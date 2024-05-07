package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.dao.UserDAO;
import vn.edu.hcmuaf.fit.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/login")
public class Login extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private final UserDAO userDAO = UserDAO.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Kiểm tra thông tin đăng nhập cho admin
            User adminUser = userDAO.CheckLoginAdmin(username, password);

            if (adminUser != null) {
                // Đăng nhập thành công, lưu thông tin người dùng vào session
                HttpSession session = request.getSession();
                session.setAttribute("adminAuth", adminUser);

                // Chuyển hướng đến trang dashboard của admin
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else {
                // Đăng nhập không thành công, chuyển hướng đến trang đăng nhập với thông báo lỗi
                response.sendRedirect(request.getContextPath() + "/user/error-404.jsp");
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ SQLException
            e.printStackTrace();

            // Chuyển hướng đến trang đăng nhập với thông báo lỗi chung
            response.sendRedirect(request.getContextPath() + "/user/error-404.jsp");
        }
    }
}