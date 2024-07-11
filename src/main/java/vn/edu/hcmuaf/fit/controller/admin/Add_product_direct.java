package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.ProductCategories;
import vn.edu.hcmuaf.fit.model.ProductTypes;
import vn.edu.hcmuaf.fit.model.Supplier;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/admin/add-product")
public class Add_product_direct extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        // Lấy dữ liệu từ form
        String productName = request.getParameter("productName");
        String priceStr = request.getParameter("price");
        String cateIdStr = request.getParameter("categoryId");
        String quantityStr = request.getParameter("quantity");
        String purpose = request.getParameter("purpose");
        String contraindications = request.getParameter("contraindications");
        String ingredients = request.getParameter("ingredients");
        String dosage = request.getParameter("dosage");
        String instructions = request.getParameter("instructions");
        String warrantyPeriod = request.getParameter("warrantyPeriod");
        String storageCondition = request.getParameter("storageCondition");
        String typeIdStr = request.getParameter("typeId");
        String supplierIdStr = request.getParameter("supplierId");

        // Kiểm tra các giá trị null hoặc rỗng trước khi chuyển đổi
        if (productName == null || priceStr == null || cateIdStr == null || quantityStr == null || typeIdStr == null || supplierIdStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters.");
            return;
        }



        try {
            // Chuyển đổi dữ liệu từ String sang các kiểu dữ liệu phù hợp
            Integer price = Integer.parseInt(priceStr.trim());
            Integer cateId = Integer.parseInt(cateIdStr.trim());
            Integer quantity = Integer.parseInt(quantityStr.trim());
            Integer typeId = Integer.parseInt(typeIdStr.trim());
            Integer supplierId = Integer.parseInt(supplierIdStr.trim());

            // Tạo đối tượng Product
            Product product = new Product();
            product.setProductName(productName);
            product.setPrice(price);
            product.setQuantity(quantity);
            product.setPurpose(purpose);
            product.setContraindications(contraindications);
            product.setIngredients(ingredients);
            product.setDosage(dosage);
            product.setInstructions(instructions);
            product.setWarrantyPeriod(warrantyPeriod);
            product.setStorageCondition(storageCondition);
            product.setCate(new ProductCategories(cateId));
            product.setType(new ProductTypes(typeId));
            product.setSupplier(new Supplier(supplierId));
            product.setActive(true);

            // Gọi phương thức addProduct của ProductService
            ProductService productService = new ProductService();

            String ip = request.getHeader("X-FORWARDED-FOR");
            if (ip == null) ip = request.getRemoteAddr();
            String address = "/admin/add-product";

            Product addedProduct = productService.addProduct(product, ip, address);

            // Kiểm tra kết quả và điều hướng
            if (addedProduct != null) {
                response.sendRedirect(request.getContextPath() + "/admin/product"); // Điều hướng tới danh sách sản phẩm
            } else {
                request.setAttribute("errorMessage", "Add product failed. Please try again.");
                request.getRequestDispatcher("/WEB-INF/admin/add-product.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format.");
        }
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/admin/add-product.jsp").forward(request, response);
    }
}
