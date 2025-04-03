/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import models.user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * El DAO(Data Object Access) contiene las consultas a la bd y prepara los datos obtenidos para regresar la informacion
 * en el Modelo definido anteriormente.
 */
public class userDAO {
    Connection conn;

    //Por medio del constructor puede acceder a la conexion establecida en la clase Conexion.
    public userDAO(Connection conn) {
        this.conn = conn;
    }
    
    /**
    *Cada metodo definido en esta clase esta diseñada para realizar una consulta a la bd.
    * Insert
    * Update
    * Delete
    * Select
    */
    
    public List<user> getAll(){ 
        List<user> listaUsuarios = new ArrayList<>();  
        PreparedStatement ps=null;

            try{
                ps = conn.prepareStatement("Select * From usuarios ");
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    user usuario = new user();

                    usuario.setUsername(rs.getString("nombreusuario"));
                    usuario.setPass(rs.getString("pass"));
                    listaUsuarios.add(usuario);
                }
            }catch(SQLException ex){}
        return listaUsuarios;      
    }
    
    public user getUsuario(int id){
        user usuario = new user();
        return usuario;   
    }
    
    //Metodo para realizar un insert, tienen que agregar todos lo atributos que solicita la tabla
    //exceptuando los que se agregar directamente en la base como el id autoincrement 
    public boolean insertUsuario(user usuario){
    
        PreparedStatement ps=null;       
        try{
            //cada "?" es un valor almacenado en el modelo.
            ps = conn.prepareStatement("Insert Into usuarios(nombreusuario,pass) Values (?,?)");

            //Esos valores se llenan por medio del siguiente metodo y el primer argumento que se pide es la posicion del "?"
            //contando de izquierda a derecha, se tiene que espesificar que tipo de dato se va almacenar, ejemplo: setString, int setInt,etc.
            ps.setString(1, usuario.getUsername());
            ps.setString(2, usuario.getPass());
            int insert = ps.executeUpdate();

            if(insert!=0)
                return true;
            else
                return false;
        }catch(SQLException ex){
            return false;
        }      
    }   
    public void updateUsuario(user usuario){
    PreparedStatement ps=null;
        
        try{
            ps = conn.prepareStatement("Update usuarios set nombreusuario=(?) where idUsuario=(?)");
            ps.setString(1, usuario.getUsername());
            ps.setInt(2, usuario.getUserId());
            int update = ps.executeUpdate();

            if(update!=0){
                //Mensaje Exitoso
            }else{
                //Mensaje Error
            }
        }catch(SQLException ex){
        
        }
    }   
    public void deleteUsuario(int idUsuario){
        PreparedStatement ps=null;      
        try{
            ps = conn.prepareStatement("Update usuarios set estatus=(?) where idUsuario=(?)");
            ps.setBoolean(1, false);
            ps.setInt(2, idUsuario);

            int delete = ps.executeUpdate();

            if(delete!=0){
                //Mensaje Exitoso
            }else{
                //Mensaje Error
            }      
        }catch(SQLException ex){
        
        }
    }    
    public user getUsuario(String nombreUsuario,String password){
        PreparedStatement ps=null;
        user usuario = null;
        try{
            ps = conn.prepareStatement("Select * From usuarios where nombreusuario=(?) and pass=(?)");
            ps.setString(1, nombreUsuario);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                usuario = new user();
                usuario.setUsername(rs.getString("nombreusuario"));
                usuario.setPass(rs.getString("pass"));
            }
        }catch(SQLException ex){

        }
    return usuario;
    }   
}
