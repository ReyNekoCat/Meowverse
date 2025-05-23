package servlets;

import classes.connection;
import dao.likeDAO;
import dao.postDAO;
import models.Post;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import models.User;

@WebServlet(name = "SvPostList", urlPatterns = {"/SvPostList"})
public class SvPostList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        connection conn = new connection();
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
            return;
        }
        User user = (User) session.getAttribute("user");
        int userId = user.getUserId();
        
        try {
            postDAO pDao = new postDAO(conn.Connect());
            List<Post> posts = pDao.getAll();
            request.setAttribute("posts", posts);
            likeDAO likeDao = new likeDAO(conn.Connect());
            List<Integer> favoritePostIds = likeDao.getFavoritePostIds(userId);
            request.setAttribute("favoritePostIds", favoritePostIds);
            
            request.getRequestDispatcher("/jsp/home.jsp").forward(request, response);
            conn.Disconnect();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("msg", "Error interno del servidor al listar los posts");
            request.getRequestDispatcher("/jsp/home.jsp").forward(request, response);
        } finally {
            //conn.Disconnect();
        }
    }
}