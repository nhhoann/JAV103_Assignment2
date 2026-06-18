CREATE DATABASE QLND;
GO

USE QLND;
GO

CREATE TABLE [User] (
    Id VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Fullname NVARCHAR(100),
    Admin BIT DEFAULT 0
);
GO

CREATE TABLE Video (
    Id VARCHAR(50) PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
    Poster VARCHAR(255),
    Views INT DEFAULT 0,
    Description NVARCHAR(MAX),
    Active BIT DEFAULT 1
);
GO

CREATE TABLE Favorite (
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
    UserId VARCHAR(50),
    VideoId VARCHAR(50),
    LikeDate DATE DEFAULT GETDATE(),

    CONSTRAINT FK_Favorite_User
        FOREIGN KEY (UserId)
        REFERENCES [User](Id),

    CONSTRAINT FK_Favorite_Video
        FOREIGN KEY (VideoId)
        REFERENCES Video(Id)
);
GO

CREATE TABLE Share (
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
    UserId VARCHAR(50),
    VideoId VARCHAR(50),
    Emails VARCHAR(255),
    ShareDate DATE DEFAULT GETDATE(),

    CONSTRAINT FK_Share_User
        FOREIGN KEY (UserId)
        REFERENCES [User](Id),

    CONSTRAINT FK_Share_Video
        FOREIGN KEY (VideoId)
        REFERENCES Video(Id)
);
GO

INSERT INTO Video (Id, Title, Poster, Views, Description, Active) VALUES 
('Ytet_bPiRCU', N'Lâu Ghê Mới Gặp - Trích đoạn hài Tết đặc sắc', 'https://img.youtube.com/vi/Ytet_bPiRCU/maxresdefault.jpg', 105, N'Tiểu phẩm hài kịch OE cung cấp phục vụ sự kiện doanh nghiệp.', 1),
('dQw4w9WgXcQ', N'Tiểu phẩm Đòi Nợ Cuối Năm - Cười ra nước mắt', 'https://img.youtube.com/vi/dQw4w9WgXcQ/maxresdefault.jpg', 99, N'Nội dung hài hước châm biếm sâu sắc về các vấn đề cuối năm.', 1),
('9bZkp7q19f0', N'Hài kịch Công Sở: Kế Hoạch Tăng Lương', 'https://img.youtube.com/vi/9bZkp7q19f0/maxresdefault.jpg', 85, N'Tình huống dở khóc dở cười tại văn phòng công ty thời bão giá.', 1),
('kJQP7kiw5Fk', N'Tiểu phẩm kịch: Ngày Đầu Tiên Đi Làm', 'https://img.youtube.com/vi/kJQP7kiw5Fk/maxresdefault.jpg', 60, N'Sự cố hy hữu của nhân viên mới trong ngày đầu nhận việc.', 1),
('VbfpW0n_160', N'Hài dân gian: Kén Rể Nhà Giàu', 'https://img.youtube.com/vi/VbfpW0n_160/maxresdefault.jpg', 42, N'Trích đoạn tiểu phẩm hài cổ trang phục vụ miễn phí cho cộng đồng.', 1),
('L_LUpnjgPso', N'Hài kịch Gia Đình: Chuyện Ông Táo Chầu Trời', 'https://img.youtube.com/vi/L_LUpnjgPso/maxresdefault.jpg', 20, N'Góc nhìn hài hước về ngày tết ông Công ông Táo truyền thống.', 1);

SELECT * FROM Video;

INSERT INTO [User] (Id, Password, Email, Fullname, Admin) VALUES 
('user1', 'password1', 'user1@example.com', 'User One', 0),
('user2', 'password2', 'user2@example.com', 'User Two', 0),
('admin', 'adminpass', 'admin@example.com', 'Administrator', 1);

