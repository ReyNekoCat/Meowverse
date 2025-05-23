package servlets;

import classes.connection;
import dao.likeDAO;
import models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "SvToggleLike", urlPatterns = {"/SvToggleLike"})
public class SvToggleLike extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.setStatus(401);
            return;
        }
        User user = (User) session.getAttribute("user");
        int userId = user.getUserId();
        int postId = Integer.parseInt(request.getParameter("postId"));

        try {
            connection conn = new connection();
            likeDAO dao = new likeDAO(conn.Connect());
            boolean liked = dao.isPostLikedByUser(userId, postId);
            boolean result;
            if (liked) {
                result = dao.unlikePost(userId, postId);
            } else {
                result = dao.likePost(userId, postId);
            }
            conn.Disconnect();
            response.setContentType("application/json");
            response.getWriter().write("{\"liked\":" + (!liked) + "}");
        } catch (Exception e) {
            response.setStatus(500);
        }
    }
}