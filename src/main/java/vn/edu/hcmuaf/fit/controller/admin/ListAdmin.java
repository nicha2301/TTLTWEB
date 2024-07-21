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
//@WebServlet(urlPatterns = "/admin/list-admin")
//public class ListAdmin extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("current_page", "admin-list");
//        List<User> admins = UserDAOT.loadUserFromSql("select * from users where role_id>1");
//        request.setAttribute("admins", admins);
//        request.getRequestDispatcher("./list-admin.jsp").forward(request, response);
//    }
//
//}
