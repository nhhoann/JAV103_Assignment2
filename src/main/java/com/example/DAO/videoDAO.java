package com.example.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.Model.Video;
import com.example.Util.DBConnector;

public class videoDAO {

    @SuppressWarnings("FieldMayBeFinal")
    private Connection connection;

    public videoDAO() {
        this.connection = DBConnector.getConnection();
    }

    // CREATE VIDEO
    @SuppressWarnings({"ConvertToTryWithResources", "UseSpecificCatch", "CallToPrintStackTrace"})
    public void createVideo(Video video) {

        String sql = "INSERT INTO video "
                + "(Id, Title, Poster, Views, Description, Active) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try {

            PreparedStatement stat = connection.prepareStatement(sql);

            stat.setString(1, video.getId());
            stat.setString(2, video.getTitle());
            stat.setString(3, video.getPoster());
            stat.setInt(4, video.getViews());
            stat.setString(5, video.getDescription());
            stat.setBoolean(6, video.isActive());

            stat.executeUpdate();

            stat.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // GET ALL VIDEOS
    @SuppressWarnings({"ConvertToTryWithResources", "UseSpecificCatch", "CallToPrintStackTrace"})
    public List<Video> findAll() {

        List<Video> list = new ArrayList<>();

        String sql = "SELECT * FROM video ORDER BY Views DESC";

       try (Connection conn = DBConnector.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Video video = new Video();

                video.setId(rs.getString("Id"));
                video.setTitle(rs.getString("Title"));
                video.setPoster(rs.getString("Poster"));
                video.setViews(rs.getInt("Views"));
                video.setDescription(rs.getString("Description"));
                video.setActive(rs.getBoolean("Active"));

                list.add(video);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // FIND VIDEO BY ID
    @SuppressWarnings("CallToPrintStackTrace")
    public Video findById(String id) {
    String sql = "SELECT * FROM Video WHERE Id = ?";

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            Video v = new Video();
            v.setId(rs.getString("Id"));
            v.setTitle(rs.getString("Title"));
            v.setPoster(rs.getString("Poster"));
            v.setViews(rs.getInt("Views"));
            v.setDescription(rs.getString("Description"));
            v.setActive(rs.getBoolean("Active"));
            return v;
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return null;
}
    // DELETE VIDEO
    @SuppressWarnings({"CallToPrintStackTrace", "UseSpecificCatch", "ConvertToTryWithResources"})
    public void deleteVideo(String id) {

        String sql = "DELETE FROM video WHERE Id = ?";

        try {

            PreparedStatement stat = connection.prepareStatement(sql);

            stat.setString(1, id);

            stat.executeUpdate();

            stat.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // UPDATE VIDEO
    @SuppressWarnings({"ConvertToTryWithResources", "UseSpecificCatch", "CallToPrintStackTrace"})
    public void updateVideo(Video video) {

        String sql = "UPDATE video "
                + "SET Title = ?, Poster = ?, Views = ?, Description = ?, Active = ? "
                + "WHERE Id = ?";
        try {

            PreparedStatement stat = connection.prepareStatement(sql);

            stat.setString(1, video.getTitle());
            stat.setString(2, video.getPoster());
            stat.setInt(3, video.getViews());
            stat.setString(4, video.getDescription());
            stat.setBoolean(5, video.isActive());
            stat.setString(6, video.getId());

            stat.executeUpdate();

            stat.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @SuppressWarnings("CallToPrintStackTrace")
    public void increaseViews(String id) {
        String sql = "UPDATE Video SET Views = Views + 1 WHERE Id = ?";

        try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @SuppressWarnings("CallToPrintStackTrace")
	public void insert(Video v) {
    String sql = "INSERT INTO Video (Id, Title, Poster, Views, Description, Active) VALUES (?, ?, ?, ?, ?, ?)";

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, v.getId());
        ps.setString(2, v.getTitle());
        ps.setString(3, v.getPoster());
        ps.setInt(4, v.getViews());
        ps.setString(5, v.getDescription());
        ps.setBoolean(6, v.isActive());

        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}

    @SuppressWarnings("CallToPrintStackTrace")
    public void update(Video v) {
    String sql = """
        UPDATE Video
        SET Title = ?,
            Poster = ?,
            Views = ?,
            Description = ?,
            Active = ?
        WHERE Id = ?
        """;

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, v.getTitle());
        ps.setString(2, v.getPoster());
        ps.setInt(3, v.getViews());
        ps.setString(4, v.getDescription());
        ps.setBoolean(5, v.isActive());
        ps.setString(6, v.getId());

        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}

    @SuppressWarnings("CallToPrintStackTrace")
    public void delete(String id) {
    try (Connection conn = DBConnector.getConnection()) {

        PreparedStatement ps1 = conn.prepareStatement("DELETE FROM Favorite WHERE VideoId = ?");
        ps1.setString(1, id);
        ps1.executeUpdate();

        PreparedStatement ps2 = conn.prepareStatement("DELETE FROM [Share] WHERE VideoId = ?");
        ps2.setString(1, id);
        ps2.executeUpdate();

        PreparedStatement ps3 = conn.prepareStatement("DELETE FROM Video WHERE Id = ?");
        ps3.setString(1, id);
        ps3.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}
}
