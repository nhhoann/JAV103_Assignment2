package com.example.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.Model.User;
import com.example.Model.Video;
import com.example.Util.DBConnector;

public class favoriteDAO {

    @SuppressWarnings("CallToPrintStackTrace")
    public void like(String userId, String videoId) {
        String checkSql = "SELECT * FROM Favorite WHERE UserId = ? AND VideoId = ?";
        String insertSql = "INSERT INTO Favorite (UserId, VideoId) VALUES (?, ?)";

        try (Connection conn = DBConnector.getConnection()) {
            PreparedStatement check = conn.prepareStatement(checkSql);
            check.setString(1, userId);
            check.setString(2, videoId);

            ResultSet rs = check.executeQuery();

            if (!rs.next()) {
                PreparedStatement insert = conn.prepareStatement(insertSql);
                insert.setString(1, userId);
                insert.setString(2, videoId);
                insert.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @SuppressWarnings("CallToPrintStackTrace")
    public void unlike(String userId, String videoId) {
        String sql = "DELETE FROM Favorite WHERE UserId = ? AND VideoId = ?";

        try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, userId);
            ps.setString(2, videoId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @SuppressWarnings("CallToPrintStackTrace")
    public List<Video> findByUser(String userId) {
        List<Video> list = new ArrayList<>();

        String sql = """
    SELECT v.*
    FROM Favorite f
    JOIN Video v ON f.VideoId = v.Id
    WHERE f.UserId = ?
    ORDER BY f.LikeDate DESC
    """;

        try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Video v = new Video();
                v.setId(rs.getString("Id"));
                v.setTitle(rs.getString("Title"));
                v.setPoster(rs.getString("Poster"));
                v.setViews(rs.getInt("Views"));
                v.setDescription(rs.getString("Description"));
                v.setActive(rs.getBoolean("Active"));

                list.add(v);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @SuppressWarnings("CallToPrintStackTrace")
    public boolean isLiked(String userId, String videoId) {
    String sql = "SELECT 1 FROM Favorite WHERE UserId = ? AND VideoId = ?";

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, userId);
        ps.setString(2, videoId);

        ResultSet rs = ps.executeQuery();

        return rs.next();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return false;
    
}
    @SuppressWarnings("CallToPrintStackTrace")
    public List<Object[]> getFavoriteReport() {
    List<Object[]> list = new ArrayList<>();

    String sql = """
        SELECT v.Id, v.Title, COUNT(f.UserId) AS Likes
        FROM Video v
        LEFT JOIN Favorite f ON v.Id = f.VideoId
        GROUP BY v.Id, v.Title
        ORDER BY Likes DESC
    """;

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            list.add(new Object[]{
                rs.getString("Id"),
                rs.getString("Title"),
                rs.getInt("Likes")
            });
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}

    @SuppressWarnings("CallToPrintStackTrace")
    public List<User> getUsersLikedVideo(String videoId) {
    List<User> list = new ArrayList<>();

    String sql = """
        SELECT u.Id, u.Fullname, u.Email, u.Admin
        FROM Favorite f
        JOIN [User] u ON f.UserId = u.Id
        WHERE f.VideoId = ?
    """;

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, videoId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            User u = new User();
            u.setId(rs.getString("Id"));
            u.setFullname(rs.getString("Fullname"));
            u.setEmail(rs.getString("Email"));
            u.setAdmin(rs.getBoolean("Admin"));
            list.add(u);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}

}
