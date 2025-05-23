/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;
import java.sql.Date;

public class Post {
    private int id;
    private int userId;
    private String title;
    private String category;
    private String image;
    private String description;
    private Date creationDate;
    private boolean deleted;

    public Post() {}

    public Post(int id, int userId, String title, String category, String image, String description, Date creationDate, boolean deleted) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.category = category;
        this.image = image;
        this.description = description;
        this.creationDate = creationDate;
        this.deleted = deleted;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Date getCreationDate() { return creationDate; }
    public void setCreationDate(Date creationDate) { this.creationDate = creationDate; }

    public boolean isDeleted() { return deleted; }
    public void setDeleted(boolean deleted) { this.deleted = deleted; }
}