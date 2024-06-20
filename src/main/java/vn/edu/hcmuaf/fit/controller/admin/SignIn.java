package vn.edu.hcmuaf.fit.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;

@WebServlet("/admin/signin")
public class SignIn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.getRequestDispatcher(request.getContextPath() + "./signIn.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        String ipAddress = request.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null) {
            ipAddress = request.getRemoteAddr();
        }
        User u = UserService.getInstance().signIn(user, ipAddress, "/admin/signin");
        if (u != null) {
            if (u.getVerified()) {
                // Kiểm tra xem "u" có phải là admin hay không (ví dụ, roleId = 2 là admin)
                if (u.getRole().getId() == 2) {
                    // Lưu thông tin "u" vào session
                    HttpSession session = request.getSession();
                    session.setAttribute("auth", u);

                    // Chuyển hướng đến trang dashboard.jsp
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                } else {
                    // Nếu roleId không phải là admin, chuyển hướng đến trang không có quyền truy cập
                    response.sendRedirect(request.getContextPath() + "/check/error-404.jsp");
                }
            } else {
                request.setAttribute("wrongInfor", "Tài khoản chưa kích hoạt");
                request.getRequestDispatcher("./signIn.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("wrongInfor", "Sai email hoặc password");
            request.getRequestDispatcher("./signIn.jsp").forward(request, response);
        }
    }
}