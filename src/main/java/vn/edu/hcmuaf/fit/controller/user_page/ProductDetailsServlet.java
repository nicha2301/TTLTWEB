package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.model.Product;
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

        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            try {
                String ip = request.getHeader("X-FORWARDED-FOR");
                if (ip == null) ip = request.getRemoteAddr();

                Product p = new Product();
                p.setId(Integer.parseInt(id));
                Map<Product, List<String>> product = ProductService.getInstance().getProductByIdWithSupplierInfo(p, ip, "/user/product");
                for (Map.Entry<Product, List<String>> productEntry : product.entrySet()) {
                    System.out.println(productEntry.getKey());
                    System.out.println(productEntry.getValue());
                }
                Map<Product, List<String>> similar = ProductService.getInstance().getAllProductsLimited(0, 4);
                if (product != null && product.size()==1) {
                    request.setAttribute("product", product);
                    request.setAttribute("products", similar);
                    request.getRequestDispatcher("/WEB-INF/user/product_detail.jsp").forward(request, response);
                    return;
                } else out.println("Product not found");
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
