package com.example.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.Model.User;
import com.example.Util.DBConnector;

public class userDAO {

    @SuppressWarnings("FieldMayBeFinal")
    private Connection connection;

    public userDAO() {
        this.connection = DBConnector.getConnection();
    }

    @SuppressWarnings("CallToPrintStackTrace")
    public boolean createUser(User user) {
        String sql = "INSERT INTO [User] (id, password, email, fullname, admin) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, user.getId());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getFullname());
            stmt.setBoolean(5, user.isAdmin());
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @SuppressWarnings("CallToPrintStackTrace")
    public boolean resetPassword(String id, String email, String newPassword) {
        String sql = "UPDATE [User] SET Password = ? WHERE Id = ? AND Email = ?";

        try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, newPassword);
            ps.setString(2, id);
            ps.setString(3, email);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @SuppressWarnings("CallToPrintStackTrace")
    public boolean changePassword(String id, String oldPassword, String newPassword) {
        String sql = "UPDATE [User] SET Password = ? WHERE Id = ? AND Password = ?";

        try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, newPassword);
            ps.setString(2, id);
            ps.setString(3, oldPassword);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @SuppressWarnings("CallToPrintStackTrace")
    public boolean updateProfile(String id, String fullname, String email) {
        String sql = "UPDATE [User] SET Fullname = ?, Email = ? WHERE Id = ?";

        try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @SuppressWarnings("CallToPrintStackTrace")
    public void insert(User u) {
    String sql = "INSERT INTO [User] (Id, Password, Email, Fullname, Admin) VALUES (?, ?, ?, ?, ?)";

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, u.getId());
        ps.setString(2, u.getPassword());
        ps.setString(3, u.getEmail());
        ps.setString(4, u.getFullname());
        ps.setBoolean(5, u.isAdmin());

        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}

    @SuppressWarnings("CallToPrintStackTrace")
   public void update(User u) {
    String sql = """
        UPDATE [User]
        SET Password = ?,
            Email = ?,
            Fullname = ?,
            Admin = ?
        WHERE Id = ?
        """;

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, u.getPassword());
        ps.setString(2, u.getEmail());
        ps.setString(3, u.getFullname());
        ps.setBoolean(4, u.isAdmin());
        ps.setString(5, u.getId());

        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}

    @SuppressWarnings("CallToPrintStackTrace")
  public void delete(String id) {
    String sql = "DELETE FROM [User] WHERE Id = ?";

    try (Connection conn = DBConnector.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, id);

        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}
    @SuppressWarnings("CallToPrintStackTrace")
    public List<User> findAll() {
        List<User> list = new ArrayList<>();

        String sql = "SELECT * FROM [User]";

        try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getString("Id"));
                u.setPassword(rs.getString("Password"));
                u.setEmail(rs.getString("Email"));
                u.setFullname(rs.getString("Fullname"));
                u.setAdmin(rs.getBoolean("Admin"));

                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
