package com.example.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.DAO.shareDAO;
import com.example.DAO.videoDAO;
import com.example.Model.User;
import com.example.Model.Video;

@WebServlet("/share")
public class ShareServlet extends HttpServlet {

    @SuppressWarnings("FieldMayBeFinal")
    private shareDAO shareDAO = new shareDAO();
    @SuppressWarnings("FieldMayBeFinal")
    private videoDAO videoDAO = new videoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String videoId = request.getParameter("id");

        if (videoId == null || videoId.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        Video video = videoDAO.findById(videoId);

        if (video == null) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        request.setAttribute("video", video);
        request.getRequestDispatcher("views/share.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String videoId = request.getParameter("videoId");
        String email = request.getParameter("email");

        shareDAO.share(user.getId(), videoId, email);

        response.sendRedirect(request.getContextPath() + "/video-detail?id=" + videoId);
    }
}