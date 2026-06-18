package com.example.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.DAO.videoDAO;
import com.example.Model.Video;

@WebServlet("/video-detail")
public class VideoDetailServlet extends HttpServlet {

    @SuppressWarnings("FieldMayBeFinal")
    private videoDAO videoDAO = new videoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        Video video = videoDAO.findById(id);

        if (video == null) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        request.setAttribute("video", video);

        request.getRequestDispatcher("/views/video-detail.jsp")
               .forward(request, response);
    }
}