package servlets;

import classes.connection;
import models.User;
import dao.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        
        response.setContentType("text/html;charset=UTF-8");
        //String username = request.getParameter("username");     
        //String pass = request.getParameter("password");
        //Sin out.println HTML
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {       
        String username = request.getParameter("username");     
        String password = request.getParameter("password");
        System.out.println("username: " + username);
        System.out.println("password: " + password);
        try {        
            connection conn =  new connection();         
            userDAO uDao = new userDAO(conn.Connect());             
            User user = uDao.getUser(username, password);
            
            if(user!=null)
            {
                request.setAttribute("username", user);
                request.getRequestDispatcher(password);               
                //Metodo para redireccionar a otra vista/Servlet
                request.setAttribute("MensajeHome", "Bienvenido "+user.getUsername());
                List userList = uDao.getAll();
                request.setAttribute("userList",userList );
                request.getRequestDispatcher("/jsp/home.jsp").forward(request, response);
            }else{       
                request.setAttribute("MensajeLogin", "Usuario/Contraseña incorrectos");
                request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
            }
            conn.Disconnect();                  
        }catch (SQLException ex) {
            Logger.getLogger(SvLogin.class.getName()).log(Level.SEVERE, null, ex);
        }catch (ClassNotFoundException ex) {
            Logger.getLogger(SvLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SvLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
