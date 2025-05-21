package servlets;

import classes.connection;
import dao.postDAO;
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
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        //int userId = Integer.parseInt(request.getParameter("user_ID")); 
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
        return;
        }
        int userId = (int) session.getAttribute("userId");
        connection conn = new connection();
        
        try {
            postDAO pDao = new postDAO(conn.Connect());
            Post post = new Post();
            post.setUserId(userId);
            post.setTitle(title);
            post.setImage(image);
            post.setDescription(description);
            
            boolean inserted = pDao.insertPost(post);

            if (inserted) {
                request.setAttribute("msg", "Post creado correctamente");
            } else {
                request.setAttribute("msg", "Error al crear el post");
            }
            request.getRequestDispatcher("/jsp/home.jsp").forward(request, response);
            conn.Disconnect();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error interno del servidor al crear el post");
            request.getRequestDispatcher("/jsp/home.jsp").forward(request, response);
        } finally {
            //conn.Disconnect();
        }
    }
}
