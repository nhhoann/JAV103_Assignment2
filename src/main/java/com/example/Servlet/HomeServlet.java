package com.example.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.DAO.favoriteDAO;
import com.example.DAO.videoDAO;
import com.example.Model.User;
import com.example.Model.Video;
import com.example.Util.DBConnector;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Override
    @SuppressWarnings("CallToPrintStackTrace")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        @SuppressWarnings("unused")
        videoDAO dao = new videoDAO();

        List<Video> listVideo = new ArrayList<>();

        String sql = "SELECT TOP 6 * FROM Video ORDER BY Views DESC";

        try (Connection conn = DBConnector.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Video video = new Video();
                video.setId(rs.getString("Id"));
                video.setTitle(rs.getString("Title"));
                video.setPoster(rs.getString("Poster"));
                video.setViews(rs.getInt("Views"));
                video.setDescription(rs.getString("Description"));
                video.setActive(rs.getBoolean("Active"));

                listVideo.add(video);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Đẩy danh sách 6 video sang giao diện JSP [cite: 25]
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        Map<String, Boolean> likedVideos = new HashMap<>();

        if (currentUser != null) {
            favoriteDAO favoriteDAO = new favoriteDAO();

            for (Video v : listVideo) {
                likedVideos.put(
                        v.getId(),
                        favoriteDAO.isLiked(currentUser.getId(), v.getId())
                );
            }
        }

        request.setAttribute("likedVideos", likedVideos);
        request.setAttribute("videos", listVideo);

        // Điều hướng sang file giao diện trang chủ
        request.getRequestDispatcher("views/home.jsp").forward(request, response);
    }
}
