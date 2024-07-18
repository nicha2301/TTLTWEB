package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.impl.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/user/checkout")
public class Checkout extends HttpServlet {
    double priceShipment = 20000.0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user == null) request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
        else {
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            String id = request.getParameter("id");

            if (id == null || id.isEmpty()) {
                if (!cart.isEmpty()) {
                    double result = (double) session.getAttribute("result");
                    double retain = (double) session.getAttribute("retain");
                    double totalPrice = result + priceShipment;
                    request.setAttribute("totalNotVoucher", result + retain);
                    request.setAttribute("totalPrice", totalPrice);
                    request.setAttribute("priceShipment", priceShipment);
                    session.setAttribute("result", result);
                    request.getRequestDispatcher("/WEB-INF/user/check_out.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/WEB-INF/user/cart.jsp").forward(request, response);
                }
            } else {
                String ip = request.getHeader("X-FORWARDED-FOR");
                if (ip == null) ip = request.getRemoteAddr();

                Product p = new Product(Integer.parseInt(id));
                Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(p, ip, "/user/checkout.jsp");

                List<CartItem> temp = new ArrayList<>();
                String quantity = request.getParameter("quantity");
                Discount discount = (Discount) session.getAttribute("discount");

                for (Map.Entry<Product, List<String>> entry : products.entrySet()) {
                    if (quantity == null) {
                        temp.add(new CartItem(user, entry.getKey(), 1));
                    } else {
                        if (!quantity.equals("") && Integer.parseInt(quantity)>0) temp.add(new CartItem(user, entry.getKey(), Integer.parseInt(quantity)));
                    }
                    double re = temp.get(0).getQuantity()*entry.getKey().getPrice();
                    if (discount==null) {
                        session.setAttribute("result", re);
                        request.setAttribute("totalPrice", re + priceShipment);
                    } else {
                        double result = re - re * discount.getSalePercent();
                        session.setAttribute("result", result);
                        session.setAttribute("retain", re * discount.getSalePercent());
                        request.setAttribute("totalPrice", result + priceShipment);
                    }
                    request.setAttribute("temp", temp);
                    request.setAttribute("totalNotVoucher", re);
                    request.setAttribute("priceShipment", priceShipment);
                }
                request.getRequestDispatcher("/WEB-INF/user/check_out.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        PrintWriter out = response.getWriter();
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        HttpSession session = request.getSession(true);
        Discount discount = (Discount) session.getAttribute("discount");
        if (discount == null) {
            discount = new Discount();
            discount.setSalePercent(0.0);
        }


        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        User user = (User) session.getAttribute("auth");

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email= request.getParameter("email");

        String tinh = request.getParameter("tinh");
        String quan = request.getParameter("quan");
        String phuong = request.getParameter("phuong");
        System.out.println(tinh + " " + quan + " " + phuong);

        String address = request.getParameter("address");
        boolean atHome = request.getParameter("atHome") != null;

        int id = request.getParameter("id")==null||request.getParameter("id").isEmpty()? 0 : Integer.parseInt(request.getParameter("id"));
        int quantity = request.getParameter("quantity")==null||request.getParameter("quantity").isEmpty() ? 0 : Integer.parseInt(request.getParameter("quantity"));

        boolean ok = true;
        if ((fullName == null) || (fullName.equals(""))) {
            ok = false;
        }
        if ((phone == null) || (phone.equals(""))) {
            ok = false;
        }
        if ((email == null) || (email.equals(""))) {
            ok = false;
        }
        if ((tinh == null) || (tinh.equals("")) || (tinh.equals("0"))) {
            ok = false;
        }
        if ((quan == null) || (quan.equals("")) || (quan.equals("0"))) {
            ok = false;
        }
        if ((phuong == null) || (phuong.equals("")) || (phuong.equals("0"))) {
            ok = false;
        }
        if ((address == null) || (address.equals(""))) {
            ok = false;
        }

        if(!ok) {
            out.write("{\"error\":\"Please fill in all information completely\"}");
        } else {
            if (user != null) {
                DeliveryAddress dev = new DeliveryAddress(user, fullName, phone, tinh, quan, phuong, address, atHome, true);
                DeliveryAddress delivery = DeliveryService.getInstance().addDeliveryAddress(dev, ip, "/user/checkout");
                Order order = new Order();
                order.setUser(user);
                order.setAddress(delivery);

                ShippingType shippingType = new ShippingType();
                shippingType.setId(1);
                order.setType(shippingType);
                if(discount!=null) order.setDiscount(discount);
                else order.setDiscount(new Discount());

                Payment payment = new Payment();
                payment.setId(1);
                order.setPayment(PaymentService.getInstance().getPaymentById(payment));
                order.setNote("");

                OrderStatus status = new OrderStatus();
                status.setId(1);
                order.setStatus(status);

                List<OrderItem> items = new ArrayList<>();
                if (id != 0) {
                    Product product = null;
                    Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(id), ip, "/user/checkout");
                    for (Product p: products.keySet()) {
                        product = p;
                    }
                     if(quantity != 0) items.add(new OrderItem(order, product, product.getPrice(), quantity));
                     else items.add(new OrderItem(order, product, product.getPrice(), 1));
                } else {
                    for(CartItem i : cart) {
                        Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(i.getProduct(), ip, "/user/checkout");
                        for (Product p: products.keySet()) {
                            items.add(new OrderItem(order, p, p.getPrice(), i.getQuantity()));
                        }
                    }
                }
                Map<Order, List<OrderItem>> map = OrderService.getInstance().insertOrders(order, items, ip, "/user/checkout");

                if (map==null || map.isEmpty()) {
                    out.write("{ \"status\": \"Save to database failed!\"}");
                } else {
                    if (id == 0) {
                        cart.clear();
                        session.setAttribute("cart", cart);
                        CartService.getInstance().removeCart(user);
                        session.setAttribute("total", 0);
                    }
                    session.removeAttribute("discount");
                    session.removeAttribute("retain");
                    session.removeAttribute("result");
                    out.write("{ \"status\": \"success\"}");
                }
            } else {
                out.write("{\"status\": \"failed\"}");
            }
        }
        out.flush();
        out.close();
    }
}