package servlets;

import classes.connection;
import dao.postDAO;
import models.User;
import models.Post;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.http.Part;
import java.io.File;

@WebServlet(name = "SvPostCreate", urlPatterns = {"/SvPostCreate"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
    maxFileSize = 1024 * 1024 * 10,      // 10 MB
    maxRequestSize = 1024 * 1024 * 15    // 15 MB
)
public class SvPostCreate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        // Handle file upload
        Part imagePart = request.getPart("image");
        String imageFileName = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            String submittedFileName = imagePart.getSubmittedFileName();
            String ext = submittedFileName.substring(submittedFileName.lastIndexOf('.'));
            imageFileName = "post_" + System.currentTimeMillis() + ext;
            String savePath = getServletContext().getRealPath("/images/posts/");
            File dir = new File(savePath);
            if (!dir.exists()) dir.mkdirs();
            imagePart.write(savePath + File.separator + imageFileName);
        }

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
            return;
        }
        User user = (User) session.getAttribute("user");
        int userId = user.getUserId();

        connection conn = new connection();
        try {
            postDAO pDao = new postDAO(conn.Connect());
            Post post = new Post();
            post.setUserId(userId);
            post.setTitle(title);
            post.setImage(imageFileName != null ? "images/posts/" + imageFileName : null);
            post.setDescription(description);

            boolean inserted = pDao.insertPost(post);

            if (inserted) {
                request.setAttribute("msg", "Post creado correctamente");
            } else {
                request.setAttribute("msg", "Error al crear el post");
            }
            response.sendRedirect(request.getContextPath() + "/SvPostList");
            conn.Disconnect();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error interno del servidor al crear el post");
            request.getRequestDispatcher("/jsp/home.jsp").forward(request, response);
        }
    }
}
