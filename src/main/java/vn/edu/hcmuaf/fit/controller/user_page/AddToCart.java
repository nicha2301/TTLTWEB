//package vn.edu.hcmuaf.fit.controller.user_page;
//
//import vn.edu.hcmuaf.fit.dao.impl.DiscountDAO;
//import vn.edu.hcmuaf.fit.model.Cart;
//import vn.edu.hcmuaf.fit.model.CouponCode;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//
//import java.io.IOException;
//
//@WebServlet("/user/addtocart")
//public class AddToCart extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int productId = Integer.parseInt(request.getParameter("id") == null ? String.valueOf(-1) : request.getParameter("id"));
//        String discount = request.getParameter("discount");
//
//        HttpSession session = request.getSession();
//        DiscountDAO couponDao = new DiscountDAO();
//        Cart cart = (Cart) session.getAttribute("cart");
//        // If the cart doesn't exist, create a new one
//        if (cart == null) {
//            cart = new Cart();
//            session.setAttribute("cart", cart);
//        }
//
//        if (discount != null) {
//            CouponCode coupon = couponDao.getCouponByName(discount);
//            if (coupon != null) {
//                cart.setCoupon_code_id(coupon.getId());
//            }
//        }
//
//        if (productId != -1) {
//            cart.add(productId);
//        }
////        System.out.println(cart);
//
//        session.setAttribute("cart", cart);
//        response.sendRedirect("./cart");
//    }
//}
