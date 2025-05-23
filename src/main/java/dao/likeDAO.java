package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class likeDAO {
    private Connection conn;

    public likeDAO(Connection conn) {
        this.conn = conn;
    }

    // Like a post (insert like)
    public boolean likePost(int userId, int postId) {
        String sql = "INSERT INTO likes (user_ID, post_ID) VALUES (?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, postId);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            // ignore duplicate like errors
            return false;
        }
    }

    // Unlike a post (delete like)
    public boolean unlikePost(int userId, int postId) {
        String sql = "DELETE FROM likes WHERE user_ID = ? AND post_ID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, postId);
            int deleted = ps.executeUpdate();
            return deleted > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    // Check if a user liked a post
    public boolean isPostLikedByUser(int userId, int postId) {
        String sql = "SELECT 1 FROM likes WHERE user_ID = ? AND post_ID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, postId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            return false;
        }
    }

    // Get all favorite posts for a user
    public List<Integer> getFavoritePostIds(int userId) {
        List<Integer> postIds = new ArrayList<>();
        String sql = "SELECT post_ID FROM likes WHERE user_ID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                postIds.add(rs.getInt("post_ID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postIds;
    }
}