package vn.edu.hcmuaf.fit.controller.admin;
import vn.edu.hcmuaf.fit.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/admin/product")
public class Product_direct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "product");

        ProductService productService = new ProductService();
        Map<Product, List<String>> products = productService.getAllProducts();

        request.setAttribute("productMap", products);
        request.getRequestDispatcher("/WEB-INF/admin/product.jsp").forward(request, response);

    }
}
