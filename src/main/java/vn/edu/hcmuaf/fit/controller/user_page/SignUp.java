package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.controller.user_page.MailService.SendEmail;
import vn.edu.hcmuaf.fit.model.Role;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;

@WebServlet("/user/signup")
public class SignUp extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.getRequestDispatcher(request.getContextPath() + "/user/signUp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        String repass = request.getParameter("repassword");
        Role role = new Role();
        String roleId = request.getParameter("roleId");
        role.setId(Integer.parseInt(roleId));
        user.setRole(role);
        SendEmail send = new SendEmail();
        String code = send.getRandomVerifyCode();
        String ipAddress = request.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null) {
            ipAddress = request.getRemoteAddr();
        }
        String error = UserService.getInstance().signUp(user, repass, ipAddress, "/user/signup");
        try {
            Integer id = Integer.parseInt(error);
            if (send.sendVerifyCode(user.getEmail(), code)) {
                HttpSession session = request.getSession();
                session.setAttribute("authCode", code);
                session.setAttribute("createdId", id);
                response.sendRedirect("./verify");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("wrongInfor", error);
            request.getRequestDispatcher("./signUp.jsp").forward(request, response);
        }
    }
}