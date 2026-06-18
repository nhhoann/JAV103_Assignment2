package com.example.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.example.Util.DBConnector;

public class shareDAO {

    @SuppressWarnings("CallToPrintStackTrace")
    public void share(String userId, String videoId, String email) {
    String sql = "INSERT INTO [Share] (UserId, VideoId, Emails) VALUES (?, ?, ?)";

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, userId);
        ps.setString(2, videoId);
        ps.setString(3, email);

        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}
}