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
public class User {    
    //Declaren todos los atributos que vienen en las tablas.
    int ID;
    String test;
    String first_name;
    String last_name;
    String email;
    String username;
    String password;
    String profile_image;
    Date birth_date;
    Date creation_date;
    
    
    //recuerden que es un modelo por entidad y que deben llevar sus get,set y constructores.
    public User() {
    }
    public User(int ID, String first_name, String last_name, String email, String username, String password, String pfp, Date birthdate, Date creationDate) {
        this.ID = ID;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.username = username;
        this.password = password;
        this.profile_image = pfp;
        this.birth_date = birthdate;
        this.creation_date = creationDate;
    }
     public String getFirstN() {
        return first_name;
    }
    public void setFirstN(String name) {
        this.first_name = name;
    }
    
    public String getLastN() {
        return last_name;
    }
    public void setLastN(String name) {
        this.last_name = name;
    }
    
    public String getEmail() {
        return email;
    }
    public void setEmail(String mail) {
        this.email = mail;
    }
    
    public String getPFP() {
        return profile_image;
    }
    public void setPFP(String pfp) {
        this.profile_image = pfp;
    } 
    
    public int getUserId() {
        return ID;
    }
    public void setUserId(int userId) {
        this.ID = userId;
    }
    
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    
     public String getPass() {
        return password;
    }
    public void setPass(String pass) {
        this.password = pass;
    }  
    
    public Date getCreationDate() {
        return creation_date;
    }
    public void setCreationDate(Date creationDate) {
        this.creation_date = creationDate;
    }
    
     public Date getBirthdate() {
        return birth_date;
    }
    public void setBirthdate(Date birthdate) {
        this.birth_date = birthdate;
    }   
}
