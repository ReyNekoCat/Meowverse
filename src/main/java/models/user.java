/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Date;
/**
 * El modelo debe estar basado en las entidades que se definieron en el diagrama entidad-relacion.
 * Es un modelo por tabla.
 * Definan el modelo antes de definir el DAO.
 */
public class user {    
    //Declaren todos los atributos que vienen en las tablas.
    int userId;
    String username;
    String pass;
    String profileImgUrl;
    Date creationDate;
    
    //recuerden que es un modelo por entidad y que deben llevar sus get,set y constructores.
    public user() {
    }
    public user(int userId, String name, Date creationDate) {
        this.userId = userId;
        this.username = name;
        this.creationDate = creationDate;
    }
    public String getPass() {
        return pass;
    }
    public void setPass(String pass) {
        this.pass = pass;
    }  
    public String getProfileImgUrl() {
        return profileImgUrl;
    }
    public void setProfileImgUrl(String profileImgUrl) {
        this.profileImgUrl = profileImgUrl;
    }    
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public Date getCreationDate() {
        return creationDate;
    }
    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }   
}
