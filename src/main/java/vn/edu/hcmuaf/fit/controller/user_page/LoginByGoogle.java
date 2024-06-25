package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.controller.user_page.LoginAPIService.LoginType;
import vn.edu.hcmuaf.fit.controller.user_page.LoginAPIService.Service;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;

@WebServlet("/user/login")
public class LoginByGoogle extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String app = request.getParameter("apis");
        System.out.println("vo day roi: " + app);
        String accessToken = Service.getToken(code, LoginType.GOOGLE);
        System.out.println("vo day roi khong 2: " + app);
        System.out.println(request.getParameter("app"));

        try {
            String ip = request.getHeader("X-FORWARDED-FOR");
            if (ip == null) ip = request.getRemoteAddr();

            User userToken = Service.getUserInfo(accessToken, LoginType.GOOGLE);
            User user = UserService.getInstance().loginByGoogle(userToken, ip, "/user/loginByGoogle");

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("auth", user);
                request.getRequestDispatcher("/user/index.jsp").forward(request, response);
            } else {
                request.setAttribute("loginGG", "Email đã được sử dụng để đăng nhập thường");
                request.getRequestDispatcher("/user/signIn.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}