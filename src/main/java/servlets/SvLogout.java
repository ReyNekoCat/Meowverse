package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "SvLogout", urlPatterns = {"/SvLogout"})
public class SvLogout extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Don't create if not exists
        if (session != null) {
            session.invalidate(); // Destroys all session data
        }
        // Redirect to login or homepage
        response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response); // Allow GET for logout as well
    }

    @Override
    public String getServletInfo() {
        return "Handles user logout";
    }
}