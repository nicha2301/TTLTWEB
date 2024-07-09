//package vn.edu.hcmuaf.fit.controller.admin;
//
//import vn.edu.hcmuaf.fit.dao.impl.CategoryDao;
//import vn.edu.hcmuaf.fit.model.ProductCategories;
//import vn.edu.hcmuaf.fit.model.ProductGroups;
//import vn.edu.hcmuaf.fit.model.User;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/admin/category")
//public class Category extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("current_page", "category");
//        HttpSession session = request.getSession();
//        User admin = (User) session.getAttribute("admin");
//
////        if (admin == null) {
////            response.sendRedirect("./admin/signIn.jsp");
////        }
//
//        CategoryDao dao = new CategoryDao();
//
//        List<ProductGroups> groups = dao.getGroupCategory();
//        List<ProductCategories> categories = dao.getCate();
//        List<CategoryQuantity> quantities = dao.getQuantityCategories();
//
//
//        request.setAttribute("groups", groups);
//        request.setAttribute("categories", categories);
//        request.setAttribute("quantities", quantities);
//
//
//
//        request.getRequestDispatcher("./categories.jsp").forward(request, response);
//    }
//}
