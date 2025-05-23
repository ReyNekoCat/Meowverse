package servlets;

import classes.connection;
import dao.postDAO;
import models.Post;
import models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SvMyPosts", urlPatterns = {"/SvMyPosts"})
public class SvMyPosts extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            List<Post> myPosts = pDao.getPostsByUser(userId);
            request.setAttribute("posts", myPosts);
            request.getRequestDispatcher("/jsp/misPubli.jsp").forward(request, response);
            conn.Disconnect();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error interno del servidor al listar tus publicaciones");
            request.getRequestDispatcher("/jsp/misPubli.jsp").forward(request, response);
        }
    }
}