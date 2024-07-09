//package vn.edu.hcmuaf.fit.controller.admin;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.util.List;
//
//import vn.edu.hcmuaf.fit.dao.SupplierDAO;
//import vn.edu.hcmuaf.fit.model.Supplier;
//
//@WebServlet(urlPatterns = "/admin/supplier")
//public class Supplier_direct extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("current_page", "supplier");
//        request.setAttribute("title", "Nhà cung cấp");
//        List<Supplier> supplierList = SupplierDAO.loadProductType();
//        request.setAttribute("sup_view", supplierList);
//        System.out.println(request.getAttribute("sup_view"));
//        request.getRequestDispatcher("./supplier.jsp").forward(request, response);
//    }
//}