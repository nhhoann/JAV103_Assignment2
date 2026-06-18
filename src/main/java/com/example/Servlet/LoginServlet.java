package com.example.Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.DAO.userDAO;
import com.example.Model.User;
import com.example.Util.DBConnector;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @SuppressWarnings({"unused", "FieldMayBeFinal"})
    private userDAO userdao = new userDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Hiển thị giao diện form đăng nhập
        request.getRequestDispatcher("views/login.jsp").forward(request, response);
    }

    @Override
    @SuppressWarnings("CallToPrintStackTrace")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String id = request.getParameter("username");
        String pass = request.getParameter("password");
        
        User user = null;
        
        // Tự mở kết nối dữ liệu để kiểm tra tài khoản
        String sql = "SELECT * FROM [User] WHERE Id = ? AND Password = ?";
        
        try (Connection conn = DBConnector.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, id);
            ps.setString(2, pass);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getString("Id"));
                    user.setPassword(rs.getString("Password"));
                    user.setEmail(rs.getString("Email"));
                    user.setFullname(rs.getString("Fullname"));
                    user.setAdmin(rs.getBoolean("Admin"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Kiểm tra kết quả đăng nhập
        if (user != null) {
            // Nếu đúng tài khoản, lưu thông tin vào Session để giữ trạng thái đăng nhập
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            
            // Quay về trang chủ
            response.sendRedirect("home");
        } else {
            // Nếu sai tài khoản hoặc mật khẩu, báo lỗi quay lại trang login
            request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
            request.getRequestDispatcher("views/login.jsp").forward(request, response);
        }
    }
}