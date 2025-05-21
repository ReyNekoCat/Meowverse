package servlets;

import classes.connection;
import models.User;
import dao.userDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "SvEditUser", urlPatterns = {"/SvEditUser"})
@MultipartConfig
public class SvEditUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        // Get current user from session
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            // Forward to editUser.jsp with user info
            request.setAttribute("user", user);
            request.getRequestDispatcher("/jsp/perfil.jsp").forward(request, response);
        } else {
            // Not logged in, redirect to login
            response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
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
        User currentUser = (User) session.getAttribute("user");

        // Get new data from form
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String birthStr = request.getParameter("birth_date");
        String profileImage = request.getParameter("profile_image"); // If you handle image upload, use Part instead

        java.sql.Date birthDate = null;
        if (birthStr != null && !birthStr.isEmpty()) {
            try {
                java.util.Date parsed = new SimpleDateFormat("yyyy-MM-dd").parse(birthStr);
                birthDate = new java.sql.Date(parsed.getTime());
            } catch (Exception e) {
                // Invalid date, ignore or handle
            }
        }

        // Update user model
        User updatedUser = new User();
        updatedUser.setUserId(currentUser.getUserId());
        updatedUser.setFirstN(firstName);
        updatedUser.setLastN(lastName);
        updatedUser.setEmail(email);
        updatedUser.setUsername(username);
        updatedUser.setPass(password);
        updatedUser.setBirthdate(birthDate);

        // Handle profile image (for now, just use string, for file upload see below)
        updatedUser.setPFP(profileImage);

        // Keep creation date & other fields
        updatedUser.setCreationDate(currentUser.getCreationDate());

        // Update DB
        boolean success = false;
        try {
            connection conn = new connection();
            userDAO dao = new userDAO(conn.Connect());
            success = dao.updateUser(updatedUser);
            conn.Disconnect();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        // Update session user if success
        if (success) {
            session.setAttribute("user", updatedUser);
            request.setAttribute("MensajeEdicion", "¡Usuario actualizado correctamente!");
        } else {
            request.setAttribute("MensajeEdicion", "Error al actualizar usuario.");
        }

        // Forward back to edit page (or profile/home)
        request.setAttribute("user", updatedUser);
        request.getRequestDispatcher("/jsp/perfil.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para editar el usuario";
    }
}