package com.example.finallaptrinhweb.controller.admin;

import com.example.finallaptrinhweb.dao.CategoryDao;
import com.example.finallaptrinhweb.model.Order;
import com.example.finallaptrinhweb.model.OrderProduct;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import static com.example.finallaptrinhweb.dao.OrderDAO.*;
import static com.example.finallaptrinhweb.dao.OrderProductDAO.loadOrderProductByOrderId;

@WebServlet("/admin/view-order")
public class ViewOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "total-report");
        request.setAttribute("title", "Chi tiết đơn hàng");

        int id = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        CategoryDao dao = new CategoryDao();


        if(status != null) {
            Order order = dao.loadOrder_view(id);
            String currentStatus = order.getStatus();
            // Kiểm tra trạng thái hợp lệ
            if(canChangeState(currentStatus, status)) {
                updateStatusById(id, status);
                request.setAttribute("updateMessage", "Trạng thái đơn hàng đã được cập nhật thành: " + status);
            } else {
                request.setAttribute("errorMessage", "Không thể chuyển từ trạng thái " + currentStatus + " sang trạng thái " + status);
            }
        }
        Order order = dao.loadOrder_view(id);
        request.setAttribute("view_order", order);
        request.setAttribute("t_p",order.getTotalPay());
        request.setAttribute("ship",order.getShipPrice());
        double total = order.getTotalPay()+order.getShipPrice();
        request.setAttribute("total",total);
        List<OrderProduct> productList = loadOrderProductByOrderId(id);

        request.setAttribute("list_pro", productList);

        request.getRequestDispatcher("view-order.jsp").forward(request, response);

    }

    private boolean canChangeState(String currentState, String desiredState) {
        switch (currentState) {
            case "Đã hủy":
            case "Bị từ chối":
            case "Giao hàng thành công":
                return false;
            case "Chờ xử lý":
                return desiredState.equals("Đang giao hàng") || desiredState.equals("Đã hủy");
            case "Đang giao hàng":
                return desiredState.equals("Giao hàng thành công") || desiredState.equals("Bị từ chối");
            default:
                return false;
        }
    }

}
