package com.example.Model;
// CREATE TABLE Favorite (
//     Id BIGINT IDENTITY(1,1) PRIMARY KEY,
//     UserId VARCHAR(50),
//     VideoId VARCHAR(50),
//     LikeDate DATE DEFAULT GETDATE(),

//     CONSTRAINT FK_Favorite_User
//         FOREIGN KEY (UserId)
//         REFERENCES [User](Id),

//     CONSTRAINT FK_Favorite_Video
//         FOREIGN KEY (VideoId)
//         REFERENCES Video(Id)
// );
// GO
public class Favorite {
private long id;
    private String userId;
    private String videoId;
    private String likeDate;

    public Favorite() {
    }

    public Favorite(long id, String userId, String videoId, String likeDate) {
        this.id = id;
        this.userId = userId;
        this.videoId = videoId;
        this.likeDate = likeDate;
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

    public String getLikeDate() {
        return likeDate;
    }

    public void setLikeDate(String likeDate) {
        this.likeDate = likeDate;
    }
}
