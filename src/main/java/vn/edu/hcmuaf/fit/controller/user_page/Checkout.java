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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user == null) request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
        else {
            String ip = request.getHeader("X-FORWARDED-FOR");
            if (ip == null) ip = request.getRemoteAddr();

            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            String id = request.getParameter("id");
            if (id == null || id.isEmpty()) {
                if (!cart.isEmpty()) {
                    double result = (double) session.getAttribute("result");
                    double priceShipment = 20000.0;
                    double totalPrice = result + priceShipment;
                    request.setAttribute("totalPrice", totalPrice);
                    request.setAttribute("priceShipment", priceShipment);
                    session.setAttribute("result", result);
                    request.getRequestDispatcher("/WEB-INF/user/check_out.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/WEB-INF/user/cart.jsp").forward(request, response);
                }
            } else {
                session.removeAttribute("discount");
                session.removeAttribute("retain");
                double priceShipment = 20000.0;
                List<CartItem> temp = new ArrayList<>();
                Product p = new Product(Integer.parseInt(id));
                Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(p, ip, "/user/checkout.jsp");
                String quantity = request.getParameter("quantity");
                for (Map.Entry<Product, List<String>> entry : products.entrySet()) {
                    if (quantity == null) {
                        temp.add(new CartItem(user, entry.getKey(), 1));
                    } else {
                        if (!quantity.equals("") && Integer.parseInt(quantity)>0) temp.add(new CartItem(user, entry.getKey(), Integer.parseInt(quantity)));
                    }
                    double result = temp.get(0).getQuantity()*entry.getKey().getPrice()*1.0;
                    request.setAttribute("temp", temp);
                    session.setAttribute("result", result);
                    request.setAttribute("totalPrice", result + priceShipment);
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
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        User user = (User) session.getAttribute("auth");

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email= request.getParameter("email");
        String tinh = request.getParameter("tinh");
        String quan = request.getParameter("quan");
        String phuong = request.getParameter("phuong");
        String address = request.getParameter("address");
        boolean atHome = request.getParameter("atHome") != null;
        int cash = request.getParameter("cash") == null ? 0 : 1;
        int momo = request.getParameter("momo") == null ? 0 : 2;
        int id = request.getParameter("id")==null ? 0 : Integer.parseInt(request.getParameter("id"));
        int quantity = request.getParameter("quantity")==null ? 0 : Integer.parseInt(request.getParameter("quantity"));
        Discount discount = (Discount) session.getAttribute("discount");

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
        if ((tinh == null) || (tinh.equals(""))) {
            ok = false;
        }
        if ((quan == null) || (quan.equals(""))) {
            ok = false;
        }
        if ((phuong == null) || (phuong.equals(""))) {
            ok = false;
        }
        if ((address == null) || (address.equals(""))) {
            ok = false;
        }

        if(!ok) {
            out.write("{\"error\":\"Please fill in all information completely\"}");
        } else {
            if (cash == 0 && momo == 0) {
                out.write("{\"error\":\"Please choose the type of payment!\"}");
            }
            if (user != null) {
                DeliveryAddress dev = new DeliveryAddress();
                dev.setFullName(fullName);
                dev.setPhone(phone);
                dev.setUser(user);
                dev.setProvince(tinh);
                dev.setDistrict(quan);
                dev.setWard(phuong);
                dev.setDetailAddress(address);
                dev.setAtHome(atHome);
                dev.setIsPrimary(true);
                DeliveryAddress delivery = DeliveryService.getInstance().addDeliveryAddress(dev, ip, "/user/checkout");
                Order order = new Order();
                order.setUser(user);
                order.setAddress(delivery);
                ShippingType shippingType = new ShippingType();
                shippingType.setId(1); //hardcode for now
                order.setType(shippingType);
                if(discount!=null) order.setDiscount(discount);
                else {
                    Discount discount1 = new Discount();
                    discount1.setId(6); //hardcode for now
                    order.setDiscount(discount1);
                }
                Payment payment = new Payment();
                if (cash==0) payment.setId(momo);
                else payment.setId(cash);
                order.setPayment(PaymentService.getInstance().getPaymentById(payment));
                order.setNote("");
                order.setStatus(new OrderStatus(1, "", ""));
                List<OrderItem> items = new ArrayList<>();
                if (id!=0) {
                    Product product = null;
                    Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(id), ip, "/user/checkout");
                    for (Product p: products.keySet()) {
                        product = p;
                    }
                     if(quantity!=0) items.add(new OrderItem(order, product, product.getPrice(), quantity));
                     else items.add(new OrderItem(order, product, product.getPrice(), 1));
                } else {
                    for(CartItem i : cart) {
                        Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(i.getProduct(), ip, "/user/checkout");
                        for (Product p: products.keySet()) {
                            items.add(new OrderItem(order, p, p.getPrice(), i.getQuantity()));
                        }
                    }
                }
                System.out.println(items);
                System.out.println(order);
                Map<Order, List<OrderItem>> map = OrderService.getInstance().insertOrders(order, items, ip, "/user/checkout");
                System.out.println(map);
                if (map==null || map.isEmpty()) {
                    out.write("{ \"status\": \"Save to database failed!\"}");
                } else {
                    cart.clear();
                    session.setAttribute("cart", cart);
                    out.write("{ \"status\": \"success\"}");
                }
            } else {
                request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
            }
        }
        out.flush();
        out.close();
    }
}