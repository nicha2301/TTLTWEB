package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.DeliveryAddress;
import vn.edu.hcmuaf.fit.model.Order;
import vn.edu.hcmuaf.fit.model.OrderItem;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.DeliveryService;
import vn.edu.hcmuaf.fit.service.impl.OrderService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/user/order_detail")
public class OrderDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user == null) request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
        else {
            String orderIdParam = request.getParameter("id");
            double re = 0.0;
            if (orderIdParam != null && !orderIdParam.isEmpty()) {
                try {
                    int order_id = Integer.parseInt(orderIdParam);
                    Order o = new Order();
                    o.setId(order_id);
                    DeliveryAddress address = DeliveryService.getInstance().loadAddressByOrder(o);
                    Map<Order, List<OrderItem>> map = OrderService.getInstance().loadOrderProductByOrder(o);
                    for (List<OrderItem> item : map.values()) {
                        for (OrderItem oi : item) {
                            re += oi.getOrderPrice()*oi.getQuantity();
                        }
                    }
                    List<OrderItem> item = new ArrayList<>();
                    for (Map.Entry<Order, List<OrderItem>> order : map.entrySet()) {
                        o = order.getKey();
                        item = order.getValue();
                    }
                    request.setAttribute("address", address);
                    request.setAttribute("order", o);
                    request.setAttribute("item", item);

                    Integer sum = OrderService.getInstance().getOrderPriceHasVoucher(o);
                    if (sum == null) sum = OrderService.getInstance().getOrderPriceNotVoucher(o);

                    double ship = re - sum;

                    request.setAttribute("sum", sum);
                    request.setAttribute("ship", ship);
                    request.setAttribute("total_money", re);

                    request.getRequestDispatcher(request.getServletContext().getContextPath() + "/WEB-INF/user/order_detail.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    response.getWriter().println("Invalid order ID format.");
                }
            } else {
                response.getWriter().println("Order ID is missing or empty.");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
