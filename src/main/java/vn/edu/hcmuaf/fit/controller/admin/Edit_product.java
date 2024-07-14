package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.ProductCategories;
import vn.edu.hcmuaf.fit.model.ProductTypes;
import vn.edu.hcmuaf.fit.model.Supplier;
import vn.edu.hcmuaf.fit.service.impl.ProductService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = "/admin/edit-product")
public class Edit_product extends HttpServlet {

    private final ProductService productService = (ProductService) ProductService.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        String type = request.getParameter("type");

        String productName = request.getParameter("productName");
        String purpose = request.getParameter("purpose");
        String contraindications = request.getParameter("contraindications");
        String ingredients = request.getParameter("ingredients");
        String dosage = request.getParameter("dosage");
        String instructions = request.getParameter("instructions");
        String warrantyPeriod = request.getParameter("warrantyPeriod");
        String storageCondition = request.getParameter("storageCondition");

        if ("edit".equalsIgnoreCase(type)) {
            int id = Integer.parseInt(request.getParameter("productId"));
            int price = Integer.parseInt(request.getParameter("price"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int supplierId = Integer.parseInt(request.getParameter("supplierId"));
            String active = request.getParameter("active");

            Product product = new Product();
            product.setId(id);
            product.setProductName(productName);
            product.setPrice(price);
            product.setQuantity(quantity);
            product.setCate(new ProductCategories(categoryId));
            product.setPurpose(purpose);
            product.setContraindications(contraindications);
            product.setIngredients(ingredients);
            product.setDosage(dosage);
            product.setInstructions(instructions);
            product.setWarrantyPeriod(warrantyPeriod);
            product.setStorageCondition(storageCondition);
            product.setType(new ProductTypes(Integer.parseInt(request.getParameter("typeId"))));
            product.setSupplier(new Supplier(supplierId));
            product.setActive(Boolean.parseBoolean(active));

            boolean isUpdate = productService.updateProduct(product, request.getRemoteAddr(), request.getHeader("User-Agent"));
            product = productService.getProductByIdWithSupplierInfo(product, request.getRemoteAddr(), request.getHeader("User-Agent")).keySet().iterator().next();

            request.setAttribute("type", "edit");
            request.setAttribute("title", "Chỉnh sửa");
            request.setAttribute("product", product);
            request.getRequestDispatcher("/WEB-INF/admin/edit-products.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("current_page", "product");
        request.setAttribute("title", "Chỉnh sửa sản phẩm");
        String type = request.getParameter("type");

        if ("enterEdit".equalsIgnoreCase(type)) {
            request.setAttribute("type", "edit");
            request.setAttribute("title", "Chỉnh sửa sản phẩm");
            int id = Integer.parseInt(request.getParameter("id"));

            Product product = productService.getProductByIdWithSupplierInfo(new Product(id), request.getRemoteAddr(), request.getHeader("User-Agent")).keySet().iterator().next();
            request.setAttribute("product", product);
            request.getRequestDispatcher("/WEB-INF/admin/edit-products.jsp").forward(request, response);
        }
    }
}
