package com.example.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.DAO.userDAO;
import com.example.Model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @SuppressWarnings("FieldMayBeFinal")
    private userDAO userDAO = new userDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/register.jsp").forward(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");

    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");

    System.out.println("Email = " + email);

    User user = new User();
    user.setId(username);
    user.setPassword(password);
    user.setFullname(fullname);
    user.setEmail(email);
    user.setAdmin(false);

    userDAO.insert(user);

    response.sendRedirect(request.getContextPath() + "/login");
}
}