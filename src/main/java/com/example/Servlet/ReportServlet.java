package com.example.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.DAO.favoriteDAO;
import com.example.DAO.shareDAO;
import com.example.DAO.videoDAO;
import com.example.Model.User;
import com.example.Model.Video;

@WebServlet("/admin/reports")
public class ReportServlet extends HttpServlet {

    @SuppressWarnings("FieldMayBeFinal")
    private favoriteDAO favoriteDAO = new favoriteDAO();
    private shareDAO shareDAO = new shareDAO();
    @SuppressWarnings("FieldMayBeFinal")
    private videoDAO videoDAO = new videoDAO();

    private boolean isAdmin(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("currentUser");
        return user != null && user.isAdmin();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String videoId = request.getParameter("videoId");

        List<Video> videos = videoDAO.findAll();
        List<Object[]> favoriteReport = favoriteDAO.getFavoriteReport();

        request.setAttribute("videos", videos);
        request.setAttribute("favoriteReport", favoriteReport);
        request.setAttribute("selectedVideoId", videoId);

        if (videoId != null && !videoId.trim().isEmpty()) {
            request.setAttribute("likedUsers", favoriteDAO.getUsersLikedVideo(videoId));
            request.setAttribute("shareUsers", shareDAO.getShareByVideo(videoId));
        }

        request.getRequestDispatcher("/views/report.jsp").forward(request, response);
    }

    public shareDAO getShareDAO() {
        return shareDAO;
    }

    public void setShareDAO(shareDAO shareDAO) {
        this.shareDAO = shareDAO;
    }
}