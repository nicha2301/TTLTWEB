package vn.edu.hcmuaf.fit.controller.admin;

import org.json.simple.JSONObject;
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
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/product")
public class Product_direct extends HttpServlet {
    private final ProductService productService = (ProductService) ProductService.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        request.setAttribute("current_page", "product");
        request.setAttribute("title", "Sản phẩm");

        String type = request.getParameter("type");
        String id = request.getParameter("id");

        Product product = new Product();
        Map<Product, List<String>> products = productService.getAllProducts();

        if (type != null && !type.isEmpty()) {
            request.setAttribute("type", type);
        }

        if ("edit".equals(type) && id != null) {
            Map<Product, List<String>> productWithSupplierInfo = productService.getProductByIdWithSupplierInfo(new Product(Integer.parseInt(id)), request.getRemoteAddr(), request.getHeader("User-Agent"));
            if (productWithSupplierInfo != null && !productWithSupplierInfo.isEmpty()) {
                product = productWithSupplierInfo.keySet().iterator().next();
            } else {
                request.setAttribute("error", "Sản phẩm không tồn tại.");
            }
        }

        request.setAttribute("product", product);
        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/admin/product.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        LocalDate today = LocalDate.now();

        String action = request.getParameter("action");
        String id = request.getParameter("id");
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
        String active = request.getParameter("active");

        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        Product product;

        if ("edit".equals(action) || "add".equals(action)) {
            try {
                Integer price = Integer.parseInt(priceStr.trim());
                Integer cateId = Integer.parseInt(cateIdStr.trim());
                Integer quantity = Integer.parseInt(quantityStr.trim());
                Integer typeId = Integer.parseInt(typeIdStr.trim());
                Integer supplierId = Integer.parseInt(supplierIdStr.trim());

                product = new Product();
                product.setId(id == null ? null : Integer.parseInt(id));
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
//                product.setActive(Boolean.parseBoolean(active));
                product.setActive(true);

                boolean valid = productName != null && price > 0 && quantity != null && cateId != null && typeId != null && supplierId != null;

                System.out.println("Product Details:");
                System.out.println("Action: " + action);
                System.out.println("ID: " + id);
                System.out.println("Name: " + productName);
                System.out.println("Price: " + price);
                System.out.println("Category ID: " + cateId);
                System.out.println("Quantity: " + quantity);
                System.out.println("Purpose: " + purpose);
                System.out.println("Contraindications: " + contraindications);
                System.out.println("Ingredients: " + ingredients);
                System.out.println("Dosage: " + dosage);
                System.out.println("Instructions: " + instructions);
                System.out.println("Warranty Period: " + warrantyPeriod);
                System.out.println("Storage Condition: " + storageCondition);
                System.out.println("Type ID: " + typeId);
                System.out.println("Supplier ID: " + supplierId);
                System.out.println("Active: " + active);

                if (valid && "edit".equals(action)) {
                    productService.updateProduct(product, ip, "admin/product");
                    jsonResponse.put("status", "success");
                } else if (valid && "add".equals(action)) {
                    productService.addProduct(product, ip, "admin/product");
                    jsonResponse.put("status", "success");
                }
            } catch (NumberFormatException e) {
                response.getWriter().print("{\"error\":\"Invalid number format.\"}");
                response.getWriter().flush();
                return;
            }
        }
        out.print(jsonResponse.toJSONString());
        out.flush();
        out.close();
    }
}
