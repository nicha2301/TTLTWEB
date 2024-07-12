package vn.edu.hcmuaf.fit.controller.user_page;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.CartItem;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.ShoppingCart;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/user/cart")
public class ShoppingCartCL extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user == null) request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
        else {
            request.getRequestDispatcher("/WEB-INF/user/cart.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            out.write("{\"status\": \"failed\"}");
            out.close();
            return;
        }

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        ShoppingCart shoppingCart = new ShoppingCart(cart);
        Product product = null;
        CartItem cartItem = null;
        int id;
        Map<Product, List<String>> products;
        int quantity;
        Map<String, Object> responseData;
        String jsonResponse;

        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        String action = request.getParameter("action");
        switch (action) {
        case "delete":
            this.delete(request, response);
            break;
        case "put":
            id = Integer.parseInt(request.getParameter("id"));
            quantity = Integer.parseInt(request.getParameter("quantity"));
            products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(id), ip, "/user/cart");
            for (Product p: products.keySet()) {
                product = p;
            }
            if (quantity > 0) {
                shoppingCart.update(new CartItem(user, product, quantity));
            } else if (quantity == 0) {
                shoppingCart.remove(user, product);
            }
            session.setAttribute("cart", cart);

            responseData = new HashMap<>();
            responseData.put("total", cart.size());
            responseData.put("items", cart);

            jsonResponse = new Gson().toJson(responseData);
            out.write(jsonResponse);
            session.setAttribute("total", cart.size());
            out.close();
            break;
        case "add":
            id = Integer.parseInt(request.getParameter("id"));
            int type = Integer.parseInt(request.getParameter("type"));

            products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(id), ip, "/user/cart");
            for (Product prod : products.keySet()) {
                product = prod;
            }
            if (type == 0) {
                cartItem = new CartItem(user, product, 1);
            } else if (type == 1) {
                String input = request.getParameter("quantity");
                if (input == null || input.isEmpty()) {
                    out.write("{\"status\": \"empty\", \"error\": \"The input do not empty!\"}");
                    out.close();
                    return;
                }
                quantity = Integer.parseInt(input);
                cartItem = new CartItem(user, product, quantity);
            }
            int remain = product.getQuantity();
            int count = 0;
            if (shoppingCart.getItems().isEmpty()) {
                remain = product.getQuantity() - cartItem.getQuantity();
            } else {
                for (CartItem item : shoppingCart.getItems()) {
                    if (item.getProduct().getId() == product.getId() && item.getUser().getId() == user.getId()) {
                        remain = product.getQuantity() - item.getQuantity() - cartItem.getQuantity();
                        count++;
                        break;
                    }
                }
            }
            if (count == 0) remain = product.getQuantity() - cartItem.getQuantity();
            int contain = Integer.parseInt(request.getParameter("contain"));
            if (remain < 0) {
                if (contain > 0) {
                    out.write("{\"status\": \"out\", \"error\": \"Số lượng thêm không được lớn hơn số lượng còn lại!\"}");
                } else {
                    out.write("{\"status\": \"stock\", \"error\": \"Bạn đã thêm số lượng sản phẩm tối đa vào giỏ!\"}");
                }
                out.close();
                return;
            }
            shoppingCart.add(cartItem);
            session.setAttribute("cart", cart);

            responseData = new HashMap<>();
            responseData.put("total", cart.size());
            responseData.put("items", cart);
            responseData.put("prefix", remain);

            jsonResponse = new Gson().toJson(responseData);
            out.write(jsonResponse);
            session.setAttribute("total", cart.size());
            out.close();
            break;
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response, ShoppingCart shoppingCart, User user, String ip, HttpSession session) throws ServletException, IOException {

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}