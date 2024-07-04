package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.Utils;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/user/products", "/user/search"})
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String searchTerm = request.getParameter("searchTerm");
        int pageSize = 12;
//        int start = (pageNumber - 1) * pageSize;
        if (searchTerm != null && !searchTerm.isEmpty()) {
            Map<Product, List<String>> products = ProductService.getInstance().searchProductsLimited(searchTerm, 0, 20);
            PrintWriter out = response.getWriter();
            for (Map.Entry<Product, List<String>> entry : products.entrySet()) {
                out.println("                                        <div class=\"item\">\n" +
                        "                                            <div>\n" +
                        "                                                <div class=\"product-element-top\">\n" +
                        "                                                    <a href=\"./product?id=" + entry.getKey().getId() + "\">\n" +
                        "                                                        <img src=\"" + request.getServletContext().getContextPath() + entry.getValue().get(0) + "\" alt=\"\">\n" +
                        "                                                    </a>\n" +
                        "                                                </div>\n" +
                        "                                                <div class=\"product-element-bottom\">\n" +
                        "                                                    <a href=\"" + request.getServletContext().getContextPath() + "/user/product?id=" + entry.getKey().getId() + "\">\n" +
                                                                                entry.getKey().getProductName() +
                        "                                                    </a>\n" +
                        "                                                </div>\n" +
                        "                                                <div class=\"product-element\">\n" +
                        "                                                    <div class=\"price-wrap\">\n" +
                        "                                                        <div class=\"price\">\n" +
                        "                                                             " + Utils.formatCurrency(entry.getKey().getPrice()) + " VND\n" +
                        "                                                        </div>\n" +
                        "                                                    </div>\n" +
                        "                                                </div>\n" +
                        "                                            </div>\n" +
                        "                                            <div class=\"wd-buttons wd-pos-r-t\">\n" +
                        "                                                <div class=\"wd-add-btn wd-action-btn wd-style-icon wd-add-cart-icon\">\n" +
                        "                                                    <a href=\"" + request.getServletContext().getContextPath() + "/user/addtocart?id=" + entry.getKey().getId() + "\">\n" +
                        "                                                        class=\"button product_type_simple add-to-cart-loop\" aria-label=\"\">\n" +
                        "                                                        <span>\n" +
                        "                                                            <i class=\"fa-solid fa-cart-shopping\"></i>\n" +
                        "                                                        </span>\n" +
                        "                                                    </a>\n" +
                        "                                                </div>\n" +
                        "                                                <div class=\"quick-view wd-action-btn wd-style-icon wd-quick-view-icon\">\n" +
                        "                                                    <a href=\"\" class=\"open-quick-view quick-view-button\">\n" +
                        "                                                        <span>\n" +
                        "                                                            <i class=\"fa-solid fa-magnifying-glass\"></i>\n" +
                        "                                                        </span>\n" +
                        "                                                    </a>\n" +
                        "                                                </div>\n" +
                        "                                                <div class=\"wd-wishlist-btn wd-action-btn wd-style-icon wd-wishlist-icon\">\n" +
                        "                                                    <a class=\"wd-tltp wd-tooltip-inited\" href=\"\" data-added-text=\"Browse Wishlist\">\n" +
                        "                                                        <span class=\"wd-tooltip-label\">\n" +
                        "                                                            <i class=\"fa-regular fa-heart\"></i>\n" +
                        "                                                        </span>\n" +
                        "                                                    </a>\n" +
                        "                                                </div>\n" +
                        "                                            </div>\n" +
                        "                                        </div>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 12;
        int pageNumber = request.getParameter("page")!= null?Integer.parseInt(request.getParameter("page")):1;
        int start = (pageNumber - 1) * pageSize;

//        String searchTerm = request.getParameter("searchTerm");
        String group = request.getParameter("group");
        String object = request.getParameter("category");
        String productType = request.getParameter("type");

        Map<String, Integer> listProductType = ProductService.getInstance().getListProductType();
        Map<String, Integer> listObject = ProductService.getInstance().getListObject();
        Map<String, Integer> listGroups = ProductService.getInstance().getGroupListObject();

        Map<Product, List<String>> products;
        int totalProducts = 0;
        if (productType != null) {
            products = ProductService.getInstance().getProductByType(productType, start, pageSize);
            for (Map.Entry<String, Integer> entry : listProductType.entrySet()) {
                if (entry.getKey().equalsIgnoreCase(productType)) {
                    totalProducts = entry.getValue();
                    break;
                }
            }
            request.setAttribute("selectedType", productType);
//        } else if (searchTerm != null) { // check 'search term' is searching correctly.
//            products = ProductService.getInstance().searchProductsLimited(searchTerm, start, pageSize);
//            totalProducts = ProductService.getInstance().getTotalSearchResults(searchTerm);
//            request.setAttribute("searchTerm", searchTerm);
        } else if (object != null) {
            products = ProductService.getInstance().getProductByCategory(object, start, pageSize);
            for (Map.Entry<String, Integer> entry : listObject.entrySet()) {
                if (entry.getKey().equalsIgnoreCase(object)) {
                    totalProducts = entry.getValue();
                    break;
                }
            }
            request.setAttribute("selectedCategory", object);
        } else if (group != null) {
            products = ProductService.getInstance().getProductByGroup(group, start, pageSize);
            for (Map.Entry<String, Integer> entry : listGroups.entrySet()) {
                if (entry.getKey().equalsIgnoreCase(group)) {
                    totalProducts = entry.getValue();
                    break;
                }
            }
            request.setAttribute("selectedGroup", group);
        } else {
            products = ProductService.getInstance().getAllProductsLimited(start, pageSize);
            totalProducts = ProductService.getInstance().getTotalProducts();
        }
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

        request.setAttribute("product", products);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("objects", listObject.entrySet());
        request.setAttribute("proTypes", listProductType.entrySet());
        request.setAttribute("groups", listGroups.entrySet());

//        String decodedQueryString = buildQueryString(request, object, group, productType, searchTerm);
//        String contextPath = request.getContextPath();
//        if (decodedQueryString.startsWith(contextPath)) decodedQueryString = decodedQueryString.substring(contextPath.length());
//        String url = decodedQueryString.substring(decodedQueryString.indexOf("=") + 1);
//        request.setAttribute("url", url);
        request.getRequestDispatcher("/WEB-INF/user/product.jsp").forward(request, response);
    }

    private String buildQueryString(HttpServletRequest request, String object, String group, String type, String search) {
        StringBuilder urlBuilder = new StringBuilder(request.getContextPath());
        if (object != null) urlBuilder.append("&category=").append(object);
        if (group != null) urlBuilder.append("&group=").append(group);
        if (search != null) urlBuilder.append("&searchTerm=").append(search);
        if (type != null) urlBuilder.append("&productType=").append(type);
        return urlBuilder.toString();
    }
}