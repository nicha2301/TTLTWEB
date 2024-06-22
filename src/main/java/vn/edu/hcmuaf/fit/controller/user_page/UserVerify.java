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

@WebServlet("/user/verify")
public class UserVerify extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.getRequestDispatcher("/user/verify.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ipAddress = request.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null) {
            ipAddress = request.getRemoteAddr();
        }
        String code = request.getParameter("verifycode");
        HttpSession session = request.getSession(true);
        User user = new User();
        user.setId((Integer) getServletContext().getAttribute("createdId"));
        String authCode = (String) session.getAttribute("authCode");
        String error = UserService.getInstance().setVerified(user, code, authCode, ipAddress, "/user/verify");
        if(error.isEmpty()) {
            response.sendRedirect("./signIn.jsp");
        } else {
            request.setAttribute("wrongAuthCode", error);
            request.getRequestDispatcher("./verify.jsp").forward(request, response);
        }
    }
}