package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;

@WebServlet("/user/signin")
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
        User u = UserService.getInstance().signIn(user, ipAddress, "/user/signin");
        if (u != null && u.getRole().getId() == 1) {
            if (u.getVerified()) {
                HttpSession session = request.getSession();
                session.setAttribute("auth", u);
                // Chuyển hướng đến trang index.jsp
                response.sendRedirect(request.getContextPath() + "/user/home");
            } else {
                request.setAttribute("wrongInfor", "Tài khoản chưa kích hoạt");
                request.getRequestDispatcher("/user/signIn.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("wrongInfor", "Sai email hoặc password hoặc bạn không có quyền truy cập");
            request.getRequestDispatcher("/user/signIn.jsp").forward(request, response);
        }
    }
}