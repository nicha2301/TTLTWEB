package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.IOException;
import java.io.PrintWriter;
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
            String ip = request.getHeader("X-FORWARDED-FOR");
            if (ip == null) ip = request.getRemoteAddr();

            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (!cart.isEmpty()) {
                int re = 0;
                for(CartItem i : cart) {
                    Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(i.getProduct().getId()), ip, "/user/cart");
                    for (Product p: products.keySet()) {
                        re += i.getQuantity() * p.getPrice();
                    }
                }
                session.setAttribute("result", Utils.formatCurrency(re));
            }
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
        Map<Product, List<String>> products;
        int quantity, re = 0, id;
        String jsonResponse;

        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        String action = request.getParameter("action");
        switch (action) {
        case "delete":
            id = Integer.parseInt(request.getParameter("id"));
            products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(id), ip, "/user/cart");
            for (Product p: products.keySet()) {
                product = p;
            }
            shoppingCart.remove(user, product);
            session.setAttribute("cart", cart);

            for(CartItem i: cart) {
                products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(i.getProduct().getId()), ip, "/user/cart");
                for (Product p: products.keySet()) {
                    re += i.getQuantity()*p.getPrice();
                }
            }

            if (re==0) {
                out.write("{ \"state\": \"zero\", \"total\": \""+cart.size()+"\", \"items\": \""+cart+"\" , \"result\": \""+Utils.formatCurrency(re)+"\" }");
            } else {
                out.write("{ \"total\": \""+cart.size()+"\", \"items\": \""+cart+"\" , \"result\": \""+Utils.formatCurrency(re)+"\" }");
            }
            session.setAttribute("total", cart.size());
            session.setAttribute("result", Utils.formatCurrency(re));
            out.flush();
            out.close();
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

            for(CartItem i: cart) {
                products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(i.getProduct().getId()), ip, "/user/cart");
                for (Product p: products.keySet()) {
                    re += i.getQuantity()*p.getPrice();
                }
            }

            if (re==0) {
                out.write("{ \"state\": \"zero\", \"total\": \""+cart.size()+"\", \"items\": \""+cart+"\" , \"result\": \""+Utils.formatCurrency(re)+"\" }");
            } else {
                out.write("{ \"total\": \""+cart.size()+"\", \"items\": \""+cart+"\" , \"result\": \""+Utils.formatCurrency(re)+"\" }");
            }
            session.setAttribute("total", cart.size());
            session.setAttribute("result", Utils.formatCurrency(re));
            out.flush();
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
                if (quantity==0) {
                    out.write("{\"status\": \"bigger\", \"error\": \"Bạn chỉ được phép thêm số lượng sản phẩm khác 0!\"}");
                    out.close();
                    return;
                }
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

            for(CartItem i: cart) {
                products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(i.getProduct().getId()), ip, "/user/cart");
                for (Product p: products.keySet()) {
                    re += i.getQuantity()*p.getPrice();
                }
            }
            out.write("{ \"total\": \""+cart.size()+"\", \"items\": \""+cart+"\" , \"prefix\": \""+remain+"\" }");
            session.setAttribute("total", cart.size());
            session.setAttribute("result", Utils.formatCurrency(re));
            out.flush();
            out.close();
            break;
        }
    }
}