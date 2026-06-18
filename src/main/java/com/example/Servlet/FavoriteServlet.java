package com.example.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.DAO.favoriteDAO;
import com.example.Model.User;

@WebServlet("/favorite")
public class FavoriteServlet extends HttpServlet {

    @SuppressWarnings("FieldMayBeFinal")
    private favoriteDAO favoriteDAO = new favoriteDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String videoId = request.getParameter("videoId");

        if (favoriteDAO.isLiked(user.getId(), videoId)) {
            favoriteDAO.unlike(user.getId(), videoId);
        } else {
            favoriteDAO.like(user.getId(), videoId);
        }

        response.sendRedirect(request.getContextPath() + "/home?id=" + videoId);

        response.sendRedirect(request.getContextPath() + "/home");
    }
}
