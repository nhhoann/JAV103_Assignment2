package com.example.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.DAO.videoDAO;
import com.example.Model.User;
import com.example.Model.Video;

@WebServlet("/admin/videos")
public class AdminVideoServlet extends HttpServlet {

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

        String action = request.getParameter("action");
        String id = request.getParameter("id");

        if ("edit".equals(action) && id != null) {
            Video editVideo = videoDAO.findById(id);
            request.setAttribute("editVideo", editVideo);
        }
        Video editVideo = videoDAO.findById(id);

        System.out.println("ID = " + id);
        System.out.println("VIDEO = " + editVideo);

        request.setAttribute("editVideo", editVideo);

        List<Video> videos = videoDAO.findAll();
        request.setAttribute("videos", videos);

        request.getRequestDispatcher("/views/adminvideo.jsp").forward(request, response);
    }

    @Override
    @SuppressWarnings("UseSpecificCatch")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String poster = request.getParameter("poster");
        String description = request.getParameter("description");
        String viewsRaw = request.getParameter("views");

        if (poster == null || poster.trim().isEmpty()) {
            poster = "https://img.youtube.com/vi/" + id + "/hqdefault.jpg";
        }

        int views = 0;
        try {
            views = Integer.parseInt(viewsRaw);
        } catch (Exception e) {
            views = 0;
        }

        Video v = new Video();
        v.setId(id);
        v.setTitle(title);
        v.setPoster(poster);
        v.setViews(views);
        v.setDescription(description);
        v.setActive(request.getParameter("active") != null);

        if ("create".equals(action)) {
            videoDAO.insert(v);
        } else if ("update".equals(action)) {
            videoDAO.update(v);
        } else if ("delete".equals(action)) {
            videoDAO.delete(id);
        }

        response.sendRedirect(request.getContextPath() + "/admin/videos");
    }

}
