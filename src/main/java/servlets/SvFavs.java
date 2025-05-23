package servlets;

import classes.connection;
import dao.likeDAO;
import dao.postDAO;
import models.Post;
import models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SvFavs", urlPatterns = {"/SvFavs"})
public class SvFavs extends HttpServlet {
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
            likeDAO likeDao = new likeDAO(conn.Connect());
            postDAO pDao = new postDAO(conn.Connect());

            // 1. Get favorite post IDs
            List<Integer> favoritePostIds = likeDao.getFavoritePostIds(userId);

            // 2. Get Post objects for those IDs
            List<Post> favoritePosts = new ArrayList<>();
            for (Integer postId : favoritePostIds) {
                Post p = pDao.getPost(postId);
                if (p != null) favoritePosts.add(p);
            }

            // 3. Set attributes and forward
            request.setAttribute("posts", favoritePosts);
            request.setAttribute("favoritePostIds", favoritePostIds);
            request.getRequestDispatcher("/jsp/favs.jsp").forward(request, response);
            conn.Disconnect();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
        }
    }
}