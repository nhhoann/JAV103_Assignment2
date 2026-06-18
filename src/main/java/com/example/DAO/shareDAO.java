package com.example.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
    @SuppressWarnings("CallToPrintStackTrace")
    public List<Object[]> getShareByVideo(String videoId) {
    List<Object[]> list = new ArrayList<>();

    String sql = """
        SELECT UserId, Emails, ShareDate
        FROM [Share]
        WHERE VideoId = ?
        ORDER BY ShareDate DESC
    """;

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, videoId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            list.add(new Object[]{
                rs.getString("UserId"),
                rs.getString("Emails"),
                rs.getDate("ShareDate")
            });
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
}