package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.CartItem;
import vn.edu.hcmuaf.fit.model.User;

import java.io.IOException;
import java.util.List;

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
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (!cart.isEmpty()) {
                double retain = (double) session.getAttribute("retain");
                double result = (double) session.getAttribute("result");
                double priceShipment = 20000.0;
                double totalPrice = result + priceShipment;
                request.setAttribute("totalPrice", totalPrice);
                request.setAttribute("priceShipment", priceShipment);
                request.getRequestDispatcher("/WEB-INF/user/check_out.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/WEB-INF/user/cart.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}