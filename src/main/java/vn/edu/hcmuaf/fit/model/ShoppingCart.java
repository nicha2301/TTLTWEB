//package vn.edu.hcmuaf.fit.model;
//
//import vn.edu.hcmuaf.fit.dao.CouponCodeDAO;
//import vn.edu.hcmuaf.fit.dao.ProductDAO;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//public class ShoppingCart {
//    private Map<Integer, CartItem> products = new HashMap<>();
//    private double totalPrice;
//    private int coupon_code_id;
//    private ProductDAO productDAO = new ProductDAO();
//    private CouponCodeDAO couponDAO = new CouponCodeDAO();
//
//    public ShoppingCart() {
//    }
//
//    public ShoppingCart(Map<Integer, CartItem> products, double totalPrice, int coupon_code_id) {
//        this.products = products;
//        this.totalPrice = totalPrice;
//        this.coupon_code_id = coupon_code_id;
//    }
//
//    public Map<Integer, CartItem> getProducts() {
//        return products;
//    }
//
//    public void setProducts(Map<Integer, CartItem> products) {
//        this.products = products;
//    }
//
//    public double getTotalPrice() {
//        totalPrice = 0.0;
//
//        for (CartItem cartItem : products.values()) {
//            totalPrice += cartItem.getTotalPrice();
//        }
//
//        return totalPrice;
//    }
//
//    public void setTotalPrice(double totalPrice) {
//        this.totalPrice = totalPrice;
//    }
//
//
//
//    public int getCoupon_code_id() {
//        return coupon_code_id;
//    }
//
//    public void setCoupon_code_id(int coupon_code_id) {
//        this.coupon_code_id = coupon_code_id;
//    }
//
////    public double getPriceSaled() {
////        double totalBeforeCoupon = getTotalPrice();
////
////        get value coupon by coupon id
////        double discount = totalBeforeCoupon * ( valueOfCoupon/ 100);
////        double totalPriceAfterCoupon = totalBeforeCoupon - discount;
////
////        return totalPriceAfterCoupon;
////    }
//
//    public int getTotalQuantity() {
//        int totalQuantity = 0;
//
//        for (CartItem cartItem : products.values()) {
//            totalQuantity += cartItem.getQuantity();
//        }
//
//        return totalQuantity;
//    }
//
//    public boolean add(int proId, int quantity) {
//        if (products.containsKey(proId)) {
//            return products.get(proId).incre(proId, quantity);
//        }
//
//        Product product = productDAO.getProductById(proId);
//        if (product == null) return false;
//        products.put(proId, new CartItem(product, quantity));
//        return true;
//    }
//
//    public List<OrderProduct> getOrderProducts() {
//        List<OrderProduct> orderProducts = new ArrayList<>();
//
//        for (CartItem cartItem : products.values()) {
//            orderProducts.add(cartItem.toOrderProduct());
//        }
//
//        return orderProducts;
//    }
//
//    public double getPriceSaled() {
//        double priceSaled = getTotalPrice();
//        if (coupon_code_id != 0 && coupon_code_id != -1) {
//            double discountValue = couponDAO.getCouponById(this.coupon_code_id).getDiscountValue();
//            priceSaled = priceSaled * (1 - discountValue / 100);
//        }
//
//        return priceSaled;
//    }
//
//    public int getMaxTypeWeight() {
//        int maxTypeWeight = 0;
//
//        for (CartItem cartItem : products.values()) {
//            int typeWeight = cartItem.getProduct().getTypeWeight();
//            if (typeWeight > maxTypeWeight) {
//                maxTypeWeight = typeWeight;
//            }
//        }
//
//        return maxTypeWeight;
//    }
//
//    public boolean isEmpty() {
//        return products.isEmpty();
//    }
//
//    public boolean add(int proId) {
//        return add(proId, 1);
//    }
//
//    public void remove(int proId) {
//        products.remove(proId);
//    }
//
//    // Trong lớp com.example.finallaptrinhweb.model.Cart
//    public void clear() {
//        // Implement logic để xóa các mục trong giỏ hàng
//        // Ví dụ: this.cartItems.clear();
//        this.products.clear();
//        this.totalPrice = 0;
//        this.coupon_code_id = 0;
//    }
//}
