//package vn.edu.hcmuaf.fit.controller.admin;
//
//import vn.edu.hcmuaf.fit.dao.ProductDAO;
//import vn.edu.hcmuaf.fit.model.Product;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/admin/product")
//public class Product_direct extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("current_page", "product");
//
//        ProductDAO productDAO = new ProductDAO();
//        List<Product> products = productDAO.getAllProducts();
//
//        request.setAttribute("product", products);
//        request.getRequestDispatcher("./product.jsp").forward(request, response);
//
//    }
//}
