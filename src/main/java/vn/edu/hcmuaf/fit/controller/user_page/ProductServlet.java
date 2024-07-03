package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/user/products")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 12;
        int pageNumber = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");
        int start = (pageNumber - 1) * pageSize;

        Map<Product, List<String>> products;
        int totalProducts = 0;

        String searchTerm = request.getParameter("searchTerm");
        String object = request.getParameter("category");
        String group = request.getParameter("group");
        String productType = request.getParameter("type");

        // Kiểm tra xem đã lọc theo nhóm sản phẩm hay không
        boolean isFilteringByGroup = group!=null;
        request.setAttribute("isFilteringByGroup", isFilteringByGroup);

        if (productType != null) {
            products = ProductService.getInstance().getProductByType(productType);
            request.setAttribute("filteredProducts", products);
        } else if (searchTerm != null) {
            products = ProductService.getInstance().searchProductsLimited(searchTerm, start, pageSize);
            totalProducts = ProductService.getInstance().getTotalSearchResults(searchTerm);
            if (products.isEmpty()) {
                request.setAttribute("noProductsFound", true);
            }
        } else if (object != null) {
            products = ProductService.getInstance().getProductByCategory(object);
            request.setAttribute("selectedCategory", object);
        } else if (isFilteringByGroup) { // Nếu đang lọc theo nhóm sản phẩm
            products = ProductService.getInstance().getProductByGroup(group);
        } else {
            products = ProductService.getInstance().getAllProductsLimited(start, pageSize);
            totalProducts = ProductService.getInstance().getTotalProducts();
        }

        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

        Map<String, Integer> listObject = ProductService.getInstance().getListObject();
        Map<String, Integer> listProductType = ProductService.getInstance().getListProductType();
        Map<String, Integer> listGroups = ProductService.getInstance().getGroupListObject();

        request.setAttribute("product", products);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("objects", listObject.entrySet());
        request.setAttribute("proTypes", listProductType.entrySet());
        request.setAttribute("groups", listGroups.entrySet());
        request.setAttribute("searchTerm", searchTerm);
        request.setAttribute("isSearchPage", searchTerm != null);

        String decodedQueryString = buildQueryString(request, object, group, productType, searchTerm);

        String contextPath = request.getContextPath();
        if (decodedQueryString.startsWith(contextPath)) {
            decodedQueryString = decodedQueryString.substring(contextPath.length());
        }

        String url = decodedQueryString.substring(decodedQueryString.indexOf("=") + 1);
        request.setAttribute("url", url);

        request.getRequestDispatcher("/WEB-INF/user/product.jsp").forward(request, response);
    }

    private String buildQueryString(HttpServletRequest request, String object, String group, String productType, String searchTerm) {
        StringBuilder urlBuilder = new StringBuilder(request.getContextPath());
        if (object != null) {
            urlBuilder.append("&category=").append(object);
        }
        if (group != null) {
            urlBuilder.append("&group=").append(group);
        }
        if (searchTerm != null) {
            urlBuilder.append("&searchTerm=").append(searchTerm);
        }
        if (productType != null) {
            urlBuilder.append("&productType=").append(productType);
        }
        return urlBuilder.toString();
    }
}