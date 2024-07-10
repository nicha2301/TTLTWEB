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
import vn.edu.hcmuaf.fit.service.impl.CartService;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/user/cart")
public class ShoppingCartCL extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
            return;
        }
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        boolean success = false;
        String action = request.getParameter("action");
        switch (action) {
            case "get":
                request.getRequestDispatcher("/WEB-INF/user/cart.jsp").forward(request, response);
                break;
            case "delete":
                success = this.delete(request, response);
                break;
            case "update":
                success = this.update(request, response);
                break;
            case "add":
                success = this.add(request, response, user, cart);
                break;
        }
    }

    private boolean add(HttpServletRequest request, HttpServletResponse response, User user, List<CartItem> cart) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int type = Integer.parseInt(request.getParameter("type"));

            String ip = request.getHeader("X-FORWARDED-FOR");
            if (ip == null) ip = request.getRemoteAddr();

            Product product = new Product();
            product.setId(id);
            Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(product, ip, "/user/cart");
            for (Map.Entry<Product, List<String>> entry : products.entrySet()) {
                product = entry.getKey();
            }
            int quantity = 1;
            if (type == 1) quantity = Integer.parseInt(request.getParameter("quantity"));
            if (cart != null && !cart.isEmpty()) {
                for (CartItem item : cart) {
                    if (item.getProduct().getId() == id && item.getUser().getId() == user.getId()) {
                        item.setQuantity(item.getQuantity() + quantity);
                        if (!CartService.getInstance().updateItem(user, product, item.getQuantity())) return false;
                        break;
                    }
                }
            } else cart.add(CartService.getInstance().addIntoCart(user, product, quantity));
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    private boolean update(HttpServletRequest request, HttpServletResponse response) {

        return false;
    }

    private boolean delete(HttpServletRequest request, HttpServletResponse response) {

        return false;
    }
}