package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.service.impl.OrderService;
import vn.edu.hcmuaf.fit.service.impl.ProductService;
import vn.edu.hcmuaf.fit.service.impl.SupplierService;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;
import java.util.List;
@WebServlet(urlPatterns = "/admin/dashboard")
public class Dashboard extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "dashboard");
        request.setAttribute("title", "Dashboard");
        // total user
        int countUser = UserService.getInstance().sumOfUsers();
        request.setAttribute("c_user", countUser);
        // total product
        int countProduct = ProductService.getInstance().getTotalProducts();
        request.setAttribute("c_product", countProduct);

        int countSupplier = SupplierService.getInstance().sumOfSupplier();
        request.setAttribute("c_supplier", countSupplier);

        List<Order> orderList = OrderService.getInstance().loadOrderNear(5);
        request.setAttribute("orderlist", orderList);
        System.out.println(orderList);


        request.getRequestDispatcher("/WEB-INF/admin/dashboard.jsp").forward(request, response);
    }
}