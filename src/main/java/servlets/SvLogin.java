package servlets;

import classes.connection;
import models.user;
import dao.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rey
 */
@WebServlet(name = "SvConnect", urlPatterns = {"/SvConnect"})
public class SvLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");     
        String pass = request.getParameter("password");
        //Sin out.println HTML
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {       
        String nombreUsuario = request.getParameter("nombreUsuario");     
        String pass = request.getParameter("password");
        try {        
            connection conn =  new connection();         
            userDAO uDao = new userDAO(conn.Connect());             
            user usuario = uDao.getUsuario(nombreUsuario, pass);
            if(usuario!=null)
            {
                request.setAttribute("Usuario", usuario);
                request.getRequestDispatcher(pass);               
                //Metodo para redireccionar a otra vista/Servlet
                request.setAttribute("MensajeHome", "bienvenido "+usuario.getUsername());
                List listaUsuarios = uDao.getAll();
                request.setAttribute("listaUsuarios",listaUsuarios );
                request.getRequestDispatcher("/home.jsp").forward(request, response);
            }else{       
                request.setAttribute("MensajeLogin", "Usuario/Contraseña incorrectos");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
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
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
