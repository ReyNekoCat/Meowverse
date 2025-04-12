/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import models.User;
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
    
    public List<User> getAll(){ 
        List<User> userList = new ArrayList<>();  
        PreparedStatement ps=null;

            try{
                ps = conn.prepareStatement("Select * From users");
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    User user = new User();
                    
                    user.setUserId(rs.getInt("ID"));
                    user.setFirstN(rs.getString("first_name"));
                    user.setLastN(rs.getString("last_name"));
                    user.setEmail(rs.getString("email"));
                    user.setPFP(rs.getString("profile_image"));
                    user.setUsername(rs.getString("username"));
                    user.setPass(rs.getString("user_password"));
                    user.setBirthdate(rs.getDate("birth_date"));
                    user.setCreationDate(rs.getDate("creation_date"));
                    userList.add(user);
                }
            }catch(SQLException ex){}
        return userList;      
    }
    
    public User getUser(int id){
        User user = new User();
        return user;   
    }
    
    //Metodo para realizar un insert, tienen que agregar todos lo atributos que solicita la tabla
    //exceptuando los que se agregar directamente en la base como el id autoincrement 
    public boolean insertUser(User user){
    
        PreparedStatement ps=null;       
        try{
            //cada "?" es un valor almacenado en el modelo.         
            ps = conn.prepareStatement("Insert Into users(first_name, last_name, birth_date, email, profile_image, username, user_password) Values (?,?,?,?,?,?,?)");

            //Esos valores se llenan por medio del siguiente metodo y el primer argumento que se pide es la posicion del "?"
            //contando de izquierda a derecha, se tiene que espesificar que tipo de dato se va almacenar, ejemplo: setString, int setInt,etc.
            ps.setString(1, user.getFirstN());
            ps.setString(2, user.getLastN());
            ps.setDate(3, user.getBirthdate());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPFP());
            ps.setString(6, user.getUsername());
            ps.setString(7, user.getPass());
            int insert = ps.executeUpdate();

            if(insert!=0)
                return true;
            else
                return false;
            
        }catch(SQLException ex){
            return false;
        }      
    }   
    public void updateUser(User user){
        PreparedStatement ps=null;
        try{
            ps = conn.prepareStatement("Update users set username=(?) where ID=(?)");
            ps.setString(1, user.getUsername());
            ps.setInt(2, user.getUserId());
            int update = ps.executeUpdate();

            if(update!=0){
                //Mensaje Exitoso
            }else{
                //Mensaje Error
            }
        }catch(SQLException ex){

        }
    }   
    public void deleteUser(int idUser){
        PreparedStatement ps=null;      
        try{
            ps = conn.prepareStatement("Update users set deleted=(?) where ID=(?)");
            ps.setBoolean(1, true);
            ps.setInt(2, idUser);

            int delete = ps.executeUpdate();

            if(delete!=0){
                //Mensaje Exitoso
            }else{
                //Mensaje Error
            }      
        }catch(SQLException ex){
        
        }
    }    
    public User getUser(String username,String password){
        PreparedStatement ps=null;
        User user = null;
        try{
            ps = conn.prepareStatement("Select * From users where username=(?) and user_password=(?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                user = new User();
                user.setUsername(rs.getString("username"));
                user.setPass(rs.getString("password"));
            }
        }catch(SQLException ex){

        }
    return user;
    }   
}
