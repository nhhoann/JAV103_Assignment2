package com.example.Model;
// CREATE TABLE Share (
//     Id BIGINT IDENTITY(1,1) PRIMARY KEY,
//     UserId VARCHAR(50),
//     VideoId VARCHAR(50),
//     Emails VARCHAR(255),
//     ShareDate DATE DEFAULT GETDATE(),

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.example.Util.DBConnector;

//     CONSTRAINT FK_Share_User
//         FOREIGN KEY (UserId)
//         REFERENCES [User](Id),

//     CONSTRAINT FK_Share_Video
//         FOREIGN KEY (VideoId)
//         REFERENCES Video(Id)
// );
// GO
public class Share {
private long id;
    private String userId;
    private String videoId;
    private String emails;
    private String shareDate;

    public Share() {
    }

    public Share(long id, String userId, String videoId, String emails, String shareDate) {
        this.id = id;
        this.userId = userId;
        this.videoId = videoId;
        this.emails = emails;
        this.shareDate = shareDate;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getVideoId() {
        return videoId;
    }

    public void setVideoId(String videoId) {
        this.videoId = videoId;
    }

    public String getEmails() {
        return emails;
    }

    public void setEmails(String emails) {
        this.emails = emails;
    }

    public String getShareDate() {
        return shareDate;
    }

    public void setShareDate(String shareDate) {
        this.shareDate = shareDate;
    }

@SuppressWarnings("CallToPrintStackTrace")
   public void share(String userId, String videoId, String email) {

    String sql = "INSERT INTO [Share](UserId, VideoId, Emails, ShareDate) VALUES (?, ?, ?, GETDATE())";

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

