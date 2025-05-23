package servlets;

import classes.connection;
import dao.postDAO;
import models.Post;
import models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SvEditPost", urlPatterns = {"/SvEditPost"})
@MultipartConfig
public class SvEditPost extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
            return;
        }
        int postId = Integer.parseInt(request.getParameter("id"));
        connection conn = new connection();
        try {
            postDAO pDao = new postDAO(conn.Connect());
            Post post = pDao.getPost(postId);
            request.setAttribute("post", post);
            request.getRequestDispatcher("/jsp/editP.jsp").forward(request, response);
            conn.Disconnect();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/SvMyPosts");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
            return;
        }
        int postId = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String oldImagePath = request.getParameter("image");
        
        // Handle file upload
        Part imagePart = request.getPart("image");
        String imageFileName = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            String submittedFileName = imagePart.getSubmittedFileName();
            String ext = submittedFileName.substring(submittedFileName.lastIndexOf('.'));
            imageFileName = "post_" + System.currentTimeMillis() + ext;
            String savePath = getServletContext().getRealPath("/images/posts/");
            java.io.File dir = new java.io.File(savePath);
            if (!dir.exists()) dir.mkdirs();
            imagePart.write(savePath + java.io.File.separator + imageFileName);
            // Store relative path to image
            imageFileName = "images/posts/" + imageFileName;
        } else {
            // For edit: keep the existing image if no new one uploaded
            imageFileName = oldImagePath; // get this from the existing post
        }
        
        connection conn = new connection();
        try {
            postDAO pDao = new postDAO(conn.Connect());
            Post post = pDao.getPost(postId);
            post.setTitle(title);
            post.setCategory(category);
            post.setDescription(description);
            post.setImage(imageFileName);
            boolean updated = pDao.updatePost(post);
            conn.Disconnect();
            response.sendRedirect(request.getContextPath() + "/SvMyPosts");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/SvMyPosts");
        }
    }
}