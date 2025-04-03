/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author sadam
 */
public class connection {
    //De esta clase solo se debe cambiar el nombre, usuario y contraseña de la bd.
    //Los atributos de esta clase sirven para configurar la cadena de conexion a la bd.
    String db="meowverse_DB";
    String url = "jdbc:mysql://localhost:3306/";
    String user = "admin";
    String password ="password";
    String driver = "com.mysql.cj.jdbc.Driver";
    
    //Objeto de conexion.
    Connection conn;

    public connection() {
        
    }
    //Es el metodo para realizar la conexion a la bd y retornar esa conexion.
    public Connection Connect() throws SQLException,ClassNotFoundException{

        try {
            Class.forName(driver);
            conn=DriverManager.getConnection(url+db,user,password);  
        } 
        catch(SQLException ex) {
            Logger.getLogger(connection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
    public void Disconnect() throws SQLException{
    conn.close();
    }
}
