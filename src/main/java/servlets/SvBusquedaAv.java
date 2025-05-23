package servlets;

import classes.connection;
import dao.postDAO;
import dao.likeDAO;
import models.Post;
import models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SvBusquedaAv", urlPatterns = {"/SvBusquedaAv"})
public class SvBusquedaAv extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) (session != null ? session.getAttribute("user") : null);
        int userId = (user != null) ? user.getUserId() : -1;

        String search = request.getParameter("search");
        String category = request.getParameter("category");
        String dateOrder = request.getParameter("date_order");
        String author = request.getParameter("author");
        String contentType = request.getParameter("content_type");
        String dateRange = request.getParameter("date_range");

        connection conn = new connection();
        try {
            postDAO pDao = new postDAO(conn.Connect());
            List<Post> results = pDao.searchPosts(
                search, category, dateOrder, author, userId, contentType, dateRange
            );

            // Optionally, also get favorite posts for the current user
            List<Integer> favoritePostIds = null;
            if (user != null) {
                likeDAO likeDao = new likeDAO(conn.Connect());
                favoritePostIds = likeDao.getFavoritePostIds(userId);
            }

            request.setAttribute("posts", results);
            request.setAttribute("favoritePostIds", favoritePostIds);
            request.getRequestDispatcher("/jsp/busquedaAv.jsp").forward(request, response);
            conn.Disconnect();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
        }
    }
}