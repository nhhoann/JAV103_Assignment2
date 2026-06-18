package com.example.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.DAO.userDAO;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

    @SuppressWarnings("FieldMayBeFinal")
    private userDAO userDAO = new userDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        boolean success = userDAO.resetPassword(id, email, newPassword);

        if (success) {
            request.setAttribute("message", "Đổi mật khẩu thành công!");
        } else {
            request.setAttribute("error", "Sai tên đăng nhập hoặc email!");
        }

        request.getRequestDispatcher("views/forgot-password.jsp").forward(request, response);
    }
}