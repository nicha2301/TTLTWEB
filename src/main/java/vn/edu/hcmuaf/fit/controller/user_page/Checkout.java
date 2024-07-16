package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.CartItem;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.IOException;
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
            if (id == null) {
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
                    System.out.println(temp);
                    request.setAttribute("temp", temp);
                    System.out.println(temp.get(0).getQuantity()*entry.getKey().getPrice());
                    session.setAttribute("result", temp.get(0).getQuantity()*entry.getKey().getPrice()*1.0);
                }
                request.getRequestDispatcher("/WEB-INF/user/check_out.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
//        User user = (User) session.getAttribute("auth");
//
//        String fullName = request.getParameter("fullName");
//        String phone = request.getParameter("phone");
//        String email= request.getParameter("email");
//        String tinh = request.getParameter("tinh");
//        String quan = request.getParameter("quan");
//        String phuong = request.getParameter("phuong");
//        String address = request.getParameter("address");
//        String atHome = request.getParameter("atHome");
//        int cash = request.getParameter("cash") == null ? 0 : 1;
//        int momo = request.getParameter("momo") == null ? 0 : 1;
//
//        if (user != null) {
//            // Lưu vào order
//            boolean success = OrderService.getInstance().insertOrders()
//
//            Map<Integer, CartItem> products = cart.getProducts();
//
//            // Lưu vào order_products
//            if (insertSta == 1) {
//                for (Map.Entry<Integer, CartItem> entry : products.entrySet()) {
//                    int productId = entry.getKey();
//                    CartItem cartItem = entry.getValue();
//
//                    insertSta = OrderDAO.addOrderProduct(cart.getCoupon_code_id() == 0 ? 1 : cart.getCoupon_code_id(),
//                            cartItem.getProduct().getProductName(), cartItem.getProduct().getImageUrl(),
//                            cartItem.getQuantity(), cartItem.getProduct().getPrice());
//                }
//            }
//        }
//
//        // Xóa đơn hàng từ giỏ hàng (đây là một ví dụ, bạn có thể thay đổi tùy thuộc vào
//        // cách bạn quản lý giỏ hàng)
//        if (insertSta == 1)
//            cart.clear();
//        session.setAttribute("cart", cart);
//
//        System.out.println(cart);
//
//        // Redirect hoặc hiển thị trang thông báo thành công
//        response.sendRedirect("order_success.jsp");
    }
}