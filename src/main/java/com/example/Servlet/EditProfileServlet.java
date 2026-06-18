package com.example.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.DAO.userDAO;
import com.example.Model.User;

@WebServlet("/edit-profile")
public class EditProfileServlet extends HttpServlet {

    @SuppressWarnings("FieldMayBeFinal")
    private userDAO userDAO = new userDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User currentUser = (User) request.getSession().getAttribute("currentUser");

        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.getRequestDispatcher("views/edit-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");

        boolean success = userDAO.updateProfile(currentUser.getId(), fullname, email);

        if (success) {
            currentUser.setFullname(fullname);
            currentUser.setEmail(email);
            session.setAttribute("currentUser", currentUser);
            request.setAttribute("message", "Cập nhật tài khoản thành công!");
        } else {
            request.setAttribute("error", "Cập nhật thất bại!");
        }

        request.getRequestDispatcher("views/edit-profile.jsp").forward(request, response);
    }
}