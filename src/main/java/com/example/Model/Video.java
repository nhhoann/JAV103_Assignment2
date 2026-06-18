package com.example.Model;
// CREATE TABLE Video (
//     Id VARCHAR(50) PRIMARY KEY,
//     Title NVARCHAR(255) NOT NULL,
//     Poster VARCHAR(255),
//     Views INT DEFAULT 0,
//     Description NVARCHAR(MAX),
//     Active BIT DEFAULT 1
// );
// GO
public class Video {
    private String id;
    private String title;
    private String poster;
    private int views;
    private String description;
    private boolean active;

    public Video() {
    }

    public Video(String id, String title, String poster, int views, String description, boolean active) {
        this.id = id;
        this.title = title;
        this.poster = poster;
        this.views = views;
        this.description = description;
        this.active = active;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
