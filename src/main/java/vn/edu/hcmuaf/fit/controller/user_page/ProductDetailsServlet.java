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
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet("/user/product")
public class ProductDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);

        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            try {
                String ip = request.getHeader("X-FORWARDED-FOR");
                if (ip == null) ip = request.getRemoteAddr();

                Product p = new Product();
                p.setId(Integer.parseInt(id));
                Map<Product, List<String>> product = ProductService.getInstance().getProductByIdWithSupplierInfo(p, ip, "/user/product");
                Product prod = null;
                for (Product p1 : product.keySet()) {
                    prod = p1;
                }
                List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
                User user = (User) session.getAttribute("auth");
                int remain = prod.getQuantity();
                if (cart != null && !cart.isEmpty() && user != null) {
                    for (CartItem item : cart) {
                        if (item.getProduct().getId() == prod.getId() && item.getUser().getId() == user.getId()) {
                            remain = prod.getQuantity() - item.getQuantity();
                            break;
                        }
                    }
                }
                request.setAttribute("product", product);
                if (remain > 0) {
                    request.setAttribute("remain", remain);
                } else {
                    request.setAttribute("error", "Bạn đã thêm số lượng sản phẩm tối đa vào giỏ!");
                }
                Map<Product, List<String>> similar = ProductService.getInstance().getAllProducts();
                request.setAttribute("products", similar);
                request.getRequestDispatcher("/WEB-INF/user/product_detail.jsp").forward(request, response);
            } catch (Exception e) {
                out.println(e.getLocalizedMessage());
            }
        } else {
            out.println("Product ID is missing");
        }
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("POST method not allowed for this servlet");
        out.flush();
        out.close();
    }
}