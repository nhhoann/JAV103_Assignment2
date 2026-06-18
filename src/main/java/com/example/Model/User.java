package com.example.Model;
// CREATE TABLE [User] (
//     Id VARCHAR(50) PRIMARY KEY,
//     Password VARCHAR(255) NOT NULL,
//     Email VARCHAR(100) NOT NULL UNIQUE,
//     Fullname NVARCHAR(100),
//     Admin BIT DEFAULT 0
// );
// GO
public class User {
private String id;
    private String password;
    private String email;
    private String fullname;
    private boolean admin;

    public User() {
    }

    public User(String id, String password, String email, String fullname, boolean admin) {
        this.id = id;
        this.password = password;
        this.email = email;
        this.fullname = fullname;
        this.admin = admin;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }
}
