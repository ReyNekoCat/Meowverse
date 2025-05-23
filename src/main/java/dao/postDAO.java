/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import models.Post;
import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class postDAO {
    private Connection conn;

    public postDAO(Connection conn) {
        this.conn = conn;
    }

    // Get all posts (optionally only non-deleted)
    public List<Post> getAll() {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM posts WHERE deleted = FALSE ORDER BY creation_date DESC";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("ID"));
                post.setUserId(rs.getInt("user_ID"));
                post.setTitle(rs.getString("title"));
                post.setDescription(rs.getString("description"));
                post.setCreationDate(rs.getDate("creation_date"));
                post.setDeleted(rs.getBoolean("deleted"));
                post.setImage(rs.getString("image"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }
    //Get all posts of a User
    public List<Post> getPostsByUser(int userId) {
    List<Post> posts = new ArrayList<>();
    String sql = "SELECT * FROM posts WHERE deleted = FALSE AND user_ID = ? ORDER BY creation_date DESC";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Post post = new Post();
            post.setId(rs.getInt("ID"));
            post.setUserId(rs.getInt("user_ID"));
            post.setTitle(rs.getString("title"));
            post.setDescription(rs.getString("description"));
            post.setImage(rs.getString("image"));
            post.setCreationDate(rs.getDate("creation_date"));
            post.setDeleted(rs.getBoolean("deleted"));
            posts.add(post);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return posts;
}

    // Get a single post by ID
    public Post getPost(int id) {
        String sql = "SELECT * FROM posts WHERE ID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("ID"));
                post.setUserId(rs.getInt("user_ID"));
                post.setTitle(rs.getString("title"));
                post.setDescription(rs.getString("description"));
                post.setCreationDate(rs.getDate("creation_date"));
                post.setDeleted(rs.getBoolean("deleted"));
                post.setImage(rs.getString("image"));
                return post;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Insert new post
    public boolean insertPost(Post post) {
        String sql = "INSERT INTO posts (user_ID, title, image, description) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, post.getUserId());
            ps.setString(2, post.getTitle());
            ps.setString(3, post.getImage());
            ps.setString(4, post.getDescription());
            int result = ps.executeUpdate();
            return result != 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update existing post
    public boolean updatePost(Post post) {
        String sql = "UPDATE posts SET title = ?, image = ?, description = ? WHERE ID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getImage());
            ps.setString(3, post.getDescription());
            ps.setInt(4, post.getId());
            int result = ps.executeUpdate();
            return result != 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Soft-delete a post
    public boolean deletePost(int id) {
        String sql = "UPDATE posts SET deleted = TRUE WHERE ID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            int result = ps.executeUpdate();
            return result != 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
