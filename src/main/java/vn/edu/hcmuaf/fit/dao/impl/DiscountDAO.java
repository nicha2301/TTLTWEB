//package vn.edu.hcmuaf.fit.dao.impl;
//
//import vn.edu.hcmuaf.fit.connection_pool.JDBIConnector;
//import vn.edu.hcmuaf.fit.model.Discount;
//
//import java.sql.SQLException;
//import java.util.List;
//import java.util.stream.Collectors;
//
//public class DiscountDAO extends AbsDAO<Discount>{
//    private static DiscountDAO instance;
//
//    public DiscountDAO() {
//    }
//
//    public static DiscountDAO getInstance() {
//        if (instance == null) {
//            instance = new DiscountDAO();
//        }
//
//        return instance;
//    }
//
//    public List<Discount> getAllCoupon() {
//        return
//    }
//
//    public Discount getCouponById(int id) {
//        try {
//            Discount coupons = (Discount) JDBIConnector.me().get().withHandle((handle) -> {
//                return handle.createQuery("SELECT * FROM discounts WHERE id =?")
//                        .bind(0, id)
//                        .mapToBean(Discount.class)
//                        .findFirst()
//                        .orElse(null);
//            });
//            return coupons;
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    public Discount getCouponByName(String name) {
//        try {
//            Discount coupons = (Discount) JDBIConnector.me().get().withHandle((handle) -> {
//                return handle.createQuery("SELECT * FROM discounts WHERE discountType =?")
//                        .bind(0, name)
//                        .mapToBean(Discount.class)
//                        .findFirst()
//                        .orElse(null);
//            });
//            return coupons;
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    public void addCoupon(String name, double percent, String dateEnd) {
//        try {
//            JDBIConnector.me().get().withHandle((handle) -> {
//                return handle.createUpdate("INSERT INTO `discounts`(`id`, `discountType`, `discountValue`, `expirationDate`) VALUES (?,?,?,?)")
//                        .bind(0, getNextId())
//                        .bind(1, name)
//                        .bind(2, percent)
//                        .bind(3, dateEnd)
//                        .execute();
//            });
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    public void delCoupon(int id) {
//        try {
//            JDBIConnector.me().get().withHandle((handle) -> {
//                return handle.createUpdate("DELETE FROM `discounts` WHERE id = ?")
//                        .bind(0, id)
//                        .execute();
//            });
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    public void editCoupon(int id,String name, double percent, String dateEnd) {
//        try {
//            JDBIConnector.me().get().useHandle((handle) -> {
//                handle.createUpdate("UPDATE `discounts` SET `discountType`=?, `discountValue`=?, `expirationDate`=? WHERE id = ?")
//                        .bind(0, name)
//                        .bind(1, percent)
//                        .bind(2, dateEnd)
//                        .bind(3, id)
//                        .execute();
//            });
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//
//    private int getNextId() {
//        try {
//            Integer id = JDBIConnector.me().get().withHandle((handle) -> {
//                return handle.createQuery("SELECT MAX(id) FROM discounts")
//                        .mapTo(Integer.class)
//                        .one();
//            });
//            return id + 1;
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    public static void main(String[] args) throws SQLException {
//        System.out.println(new DiscountDAO().getCouponById(1));
//    }
//
//}
