package com.example.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.DAO.favoriteDAO;
import com.example.Model.User;
import com.example.Model.Video;

@WebServlet("/favorites")
public class MyFavoriteServlet extends HttpServlet {

    private favoriteDAO favoriteDAO = new favoriteDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<Video> videos = favoriteDAO.findByUser(user.getId());

        request.setAttribute("videos", videos);
        request.getRequestDispatcher("/views/favorite.jsp")
               .forward(request, response);
    }
}