//package vn.edu.hcmuaf.fit.controller.admin;
//
//import vn.edu.hcmuaf.fit.dao.UserDAOT;
//import vn.edu.hcmuaf.fit.model.User;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.util.List;
//
//
//@WebServlet("/admin/users")
//public class Users_direct extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("current_page","users");
//        List<User> users = UserDAOT.loadUserFromSql("select * from users where role_id=1");
//        request.setAttribute("users", users);
//        request.getRequestDispatcher("./users.jsp").forward(request,response);
//    }
//}