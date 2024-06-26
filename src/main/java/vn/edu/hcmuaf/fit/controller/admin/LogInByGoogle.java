//package vn.edu.hcmuaf.fit.controller.admin;
//
//
//import vn.edu.hcmuaf.fit.controller.user_page.GoogleService.Token;
//import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
//import vn.edu.hcmuaf.fit.model.User;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import java.io.IOException;
//import java.sql.SQLException;
//
//@WebServlet("/admin/loginbygoogle"
//)
//public class LoginByGoogle extends HttpServlet {
//    public LoginByGoogle() {
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        this.doPost(request, response);
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String code = request.getParameter("code");
//        String accessToken = Token.getToken(code);
//        User user = null;
//        Boolean userExist = false;
//
//        try {
//            user = Token.getUserInfo(accessToken);
//            userExist = UserDAO.getInstance().CheckExistUser(user.getEmail());
//        } catch (SQLException var9) {
//            throw new RuntimeException(var9);
//        }
//
//        try {
//            if (user != null && !userExist) {
//                UserDAO.getInstance().SignUp(user.getUsername(), user.getEmail(), (String) null, "verified", user.getRole().getId());
//            }
//
//            HttpSession session = request.getSession();
//            session.setAttribute("auth", user);
//            response.sendRedirect("./dashboard.jsp");
//        } catch (SQLException var8) {
//            throw new RuntimeException(var8);
//        }
//    }
//}
