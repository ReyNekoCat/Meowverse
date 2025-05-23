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
                post.setCategory(rs.getString("category"));
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
            post.setCreationDate(rs.getDate("creation_date"));
            post.setDeleted(rs.getBoolean("deleted"));
            post.setImage(rs.getString("image"));
            post.setCategory(rs.getString("category"));
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
                post.setCategory(rs.getString("category"));
                return post;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Insert new post
    public boolean insertPost(Post post) {
        String sql = "INSERT INTO posts (user_ID, title, image, description, category) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, post.getUserId());
            ps.setString(2, post.getTitle());
            ps.setString(3, post.getImage());
            ps.setString(4, post.getDescription());
            ps.setString(5, post.getCategory());
            int result = ps.executeUpdate();
            return result != 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update existing post
    public boolean updatePost(Post post) {
        String sql = "UPDATE posts SET title = ?, image = ?, description = ?, category = ? WHERE ID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getImage());
            ps.setString(3, post.getDescription());
            ps.setString(4, post.getCategory());
            ps.setInt(5, post.getId());
            int result = ps.executeUpdate();
            return result != 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Post> searchPosts(String search, String category, String dateOrder, String author, int userId, String contentType, String dateRange) {
        List<Post> posts = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM posts WHERE deleted = FALSE");
        List<Object> params = new ArrayList<>();
        if (search != null && !search.isEmpty()) {
            sql.append(" AND (title LIKE ? OR description LIKE ?)");
            params.add("%" + search + "%");
            params.add("%" + search + "%");
        }
        if (category != null && !category.isEmpty()) {
            sql.append(" AND category = ?");
            params.add(category);
        }
        if ("me".equals(author) && userId > 0) {
            sql.append(" AND user_ID = ?");
            params.add(userId);
        }
        if ("images".equals(contentType)) {
            sql.append(" AND image IS NOT NULL AND image <> ''");
        }
        // TODO: Add dateRange filter if needed
        if ("newest".equals(dateOrder)) {
            sql.append(" ORDER BY creation_date DESC");
        } else if ("oldest".equals(dateOrder)) {
            sql.append(" ORDER BY creation_date ASC");
        } else {
            sql.append(" ORDER BY creation_date DESC");
        }
        try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("ID"));
                post.setUserId(rs.getInt("user_ID"));
                post.setTitle(rs.getString("title"));
                post.setImage(rs.getString("image"));
                post.setDescription(rs.getString("description"));
                post.setCreationDate(rs.getDate("creation_date"));
                post.setDeleted(rs.getBoolean("deleted"));
                post.setCategory(rs.getString("category"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
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
