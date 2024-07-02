//package vn.edu.hcmuaf.fit.controller.user_page;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import vn.edu.hcmuaf.fit.controller.user_page.ImageService.Service;
//import vn.edu.hcmuaf.fit.model.Product;
//import vn.edu.hcmuaf.fit.service.impl.ImageService;
//import vn.edu.hcmuaf.fit.service.impl.ProductService;
//
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/user/home")
//public class Home extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        response.setContentType("text/html; charset=UTF-8");
//        request.getRequestDispatcher("/WEB-INF/user/index.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Product> all = ProductService.getInstance().getAllProducts();
//        /**
//         *  Cập nhật url của tất cả sản phẩm vào csdl
//         *  Duyệt qua danh sách sản phẩm và cập nhật imageUrl
//         */
//        String basePath = getServletContext().getRealPath("data\\sp_");
//        for (Product product : all) {
//            int productId = product.getId();
//            String imageUrl = basePath + productId;
//
//            // Lấy đường dẫn của hình ảnh đầu tiên
//            String firstImagePath = Service.getFirstImagePath(imageUrl);
//            boolean re = ImageService.getInstance().addImage(product, )
//
//
//            // Lưu đường dẫn vào csdl
////            productDAO.updateImgUrl(productId, firstImagePath);
//
//
//        }
//
//        // Danh sách sản phẩm
//        List<Product> products = productDAO.getAllProductsLimited(0, 3);
//        List<Product> threePoultryProducts = productDAO.getThreePoultryProducts();
//        List<Product> tt = productDAO.getThreeOtherProducts();
//
//        System.out.println(products);
//        request.setAttribute("pro",threePoultryProducts);
//        request.setAttribute("pr",tt);
//        request.setAttribute("products", products);
//
//        //Danh sách banner
//
//        //Danh sách thương hiệu
//
//        request.getRequestDispatcher("/WEB-INF/user/index.jsp").forward(request, response);
//    }
//
//}
