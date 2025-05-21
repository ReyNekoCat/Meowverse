package servlets;

import classes.connection;
import dao.postDAO;
import models.Post;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SvPostView", urlPatterns = {"/SvPostView"})
public class SvPostView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("id"));
        connection conn = new connection();
        try {
            postDAO pDao = new postDAO(conn.Connect());
            Post post = pDao.getPost(postId);
            request.setAttribute("post", post);
            request.getRequestDispatcher("/jsp/post.jsp").forward(request, response);
            conn.Disconnect();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error interno del servidor al mostrar el post");
            request.getRequestDispatcher("/jsp/home.jsp").forward(request, response);
        } finally {
            //conn.Disconnect();
        }
    }
}