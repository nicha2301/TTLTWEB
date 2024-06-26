//package vn.edu.hcmuaf.fit.controller.admin;
//
//import vn.edu.hcmuaf.fit.model.Order;
//import vn.edu.hcmuaf.fit.model.OrderProduct;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.util.List;
//
////import static vn.edu.hcmuaf.fit.dao.OrderDAO.*;
//import static vn.edu.hcmuaf.fit.dao.OrderProductDAO.loadOrderProductByOrderId;
//
//@WebServlet("/admin/view-order")
//public class ViewOrder extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("current_page", "total-report");
//        request.setAttribute("title", "Chi tiết đơn hàng");
//
//        int id = Integer.parseInt(request.getParameter("id"));
//        String status = request.getParameter("status");
//
//        if (status != null)
//            updateStatusById(id, status);
//
//        Order order = loadOrder_view(id);
//        request.setAttribute("view_order", order);
//        request.setAttribute("t_p",order.getTotalPay());
//        request.setAttribute("ship",order.getShipPrice());
//        double total = order.getTotalPay()+order.getShipPrice();
//        request.setAttribute("total",total);
//        List<OrderProduct> productList = loadOrderProductByOrderId(id);
//
//        request.setAttribute("list_pro", productList);
//
//        request.getRequestDispatcher("view-order.jsp").forward(request, response);
//
//    }
//}
