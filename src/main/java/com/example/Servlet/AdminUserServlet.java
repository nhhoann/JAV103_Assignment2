package com.example.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.DAO.userDAO;
import com.example.Model.User;

@WebServlet("/admin/users")
public class AdminUserServlet extends HttpServlet {

    @SuppressWarnings("FieldMayBeFinal")
    private userDAO userDAO = new userDAO();

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

        List<User> users = userDAO.findAll();
        request.setAttribute("users", users);

        request.getRequestDispatcher("/views/adminuser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!isAdmin(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        User u = new User();
        u.setId(request.getParameter("id"));
        u.setPassword(request.getParameter("password"));
        u.setEmail(request.getParameter("email"));
        u.setFullname(request.getParameter("fullname"));
        u.setAdmin(request.getParameter("admin") != null);

        if ("create".equals(action)) {
            userDAO.insert(u);
        } else if ("update".equals(action)) {
            userDAO.update(u);
        } else if ("delete".equals(action)) {
            userDAO.delete(u.getId());
        }

        response.sendRedirect(request.getContextPath() + "/admin/users");
    }
}