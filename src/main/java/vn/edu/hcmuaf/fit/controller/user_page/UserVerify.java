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
import java.io.PrintWriter;

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(true);
        String code = request.getParameter("verifyCode");
        String authCode = (String) session.getAttribute("authCode");
        Integer id = (Integer) getServletContext().getAttribute("userId");
        boolean ok = true;
        if ((code == null) || (code.equals(""))) {
            ok = false;
        }
        if (!ok) {
            out.write("{\"error\":\"Please fill in all information completely\"}");
        } else {
            User user = new User();
            user.setId(id);

            String ip = request.getHeader("X-FORWARDED-FOR");
            if (ip == null) ip = request.getRemoteAddr();

            String error = UserService.getInstance().setVerified(user, code, authCode, ip, "/user/verify");
            if(error.isEmpty()) {
                out.write("{ \"status\": \"success\"}");
            } else {
                out.write("{ \"error\" :\"" + error + "\"}");
            }
        }
        out.close();
    }
}