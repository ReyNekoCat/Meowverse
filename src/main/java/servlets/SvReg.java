/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import classes.connection;
import models.User;
import dao.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "SvReg", urlPatterns = {"/SvReg"})
public class SvReg extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Se reciben la informacion del formulario que envia la vista
        String username = request.getParameter("username");     
        String password = request.getParameter("password");
        String first_name = request.getParameter("first-name");
        String last_name = request.getParameter("last-name");
        String email = request.getParameter("email");
        //Part filePart = request.getPart("profile-img");
        //final String fileName = username+".jpg";          
        //filePart.write("C:\\Users\\Rey\\Documents\\NetBeansProjects\\meowverse\\src\\main\\webapp\\images"+fileName);
        
        //Convertir string a fecha
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String Birthdate_Text = request.getParameter("birth");
        Date Birthdate = null;
        java.sql.Date BirthdateSQL = null;
        try {
            Birthdate = dateFormat.parse(Birthdate_Text);
            BirthdateSQL = new java.sql.Date(Birthdate.getTime());
        }catch(Exception e) {
            System.out.println("Error occurred"+ e.getMessage());
        }
        
        System.out.println("username: " + username);
        System.out.println("password: " + password);
        System.out.println("first_name: " + first_name);
        System.out.println("last_name: " + last_name);
        System.out.println("email: " + email);
        System.out.println("birth: " + Birthdate_Text);
        
        try {
            //Se crea un objeto del modelo para despues llenarlo con los datos capturados
            User user = new User();
            user.setFirstN(first_name);
            user.setLastN(last_name);
            user.setEmail(email);
            user.setPFP(null);
            user.setBirthdate(BirthdateSQL);
            user.setUsername(username);
            user.setPass(password);
                   
            //Se declara el objeto de la conexion
            connection conn =  new connection();
         
            //Conectamos el DAO utilizando el objeto de Conexion y el metodo conectar()
            userDAO uDao = new userDAO(conn.Connect());
                
            //Recibimos la respuesta del metodo del DAO
            boolean insert = uDao.insertUser(user);

            if(insert)
            {
                //Metodo para redireccionar a otra vista/Servlet
                request.setAttribute("MensajeRegistro", "Usuario Registrado Correctamente");
                request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
                
            }
            //Terminamos la conexion
            conn.Disconnect();
                     
        } catch (SQLException ex) {
            Logger.getLogger(SvLogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvLogin.class.getName()).log(Level.SEVERE, null, ex);
        }       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
