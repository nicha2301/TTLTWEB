package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.CartItem;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.ProductTypes;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.CartService;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/user/home")
public class Home extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user != null) {
            Integer flag = (Integer) session.getAttribute("flag");
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (flag == 0) {
                cart = CartService.getInstance().getCartByUser(user);
                flag++;
                session.setAttribute("flag", flag);
                session.setAttribute("cart", cart);
                session.setAttribute("total", cart.size());
            }
        }
        Map<Product, List<String>> products = ProductService.getInstance().getAllProductsLimited(0, 3);
        ProductTypes type = new ProductTypes();
        type.setId(4);
        Map<Product, List<String>> threePoultryProducts = ProductService.getInstance().getProductsLimit(type, 3);
        type.setId(6);
        Map<Product, List<String>> tt = ProductService.getInstance().getProductsLimit(type, 3);
        request.setAttribute("pro",threePoultryProducts);
        request.setAttribute("pr",tt);
        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/user/index.jsp").forward(request, response);
    }
}