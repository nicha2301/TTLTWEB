//package vn.edu.hcmuaf.fit.dao.impl;
//
//import vn.edu.hcmuaf.fit.connection_pool.JDBIConnector;
//import vn.edu.hcmuaf.fit.model.ProductCategories;
//import vn.edu.hcmuaf.fit.model.ProductGroups;
//
//import java.sql.SQLException;
//import java.util.List;
//import java.util.stream.Collectors;
//
//public class CategoryDAO extends AbsDAO<ProductCategories> {
//    private static CategoryDAO instance;
//
//    public CategoryDAO() {
//    }
//
//    public static CategoryDAO getInstance() {
//        if (instance == null) {
//            instance = new CategoryDAO();
//        }
//
//        return instance;
//    }
//
//    public List<ProductGroups> getGroupCategory() {
//        return JDBIConnector.get().withHandle(handle -> {
//            return handle.createQuery("SELECT * FROM product_groups")
//                    .mapToBean(ProductGroups.class)
//                    .collect(Collectors.toList());
//        });
//    }
//
//    public List<ProductCategories> getCategory() {
//        return JDBIConnector.get().withHandle(handle -> {
//            return handle.createQuery("SELECT * FROM product_categories")
//                    .mapToBean(ProductCategories.class)
//                    .collect(Collectors.toList());
//        });
//    }
//
////    public List<CategoryQuantity> getQuantityCategory() {
////        try {
////            return JDBIConnector.get().withHandle(handle -> {
////                return handle.createQuery("SELECT pc.id AS categoryId, COALESCE(SUM(p.quantity), 0) AS totalQuantity\n" +
////                                "FROM product_categories pc\n" +
////                                "LEFT JOIN products p ON pc.id = p.category_id\n" +
////                                "GROUP BY pc.id, pc.categoryName")
////                        .mapToBean(CategoryQuantity.class)
////                        .collect(Collectors.toList());
////            });
////        } catch (SQLException e) {
////            throw new RuntimeException(e);
////        }
////    }
//
//
//    public void setStatus(int status, int id) {
//        JDBIConnector.get().useHandle((handle) -> {
//            handle.createUpdate("UPDATE product_categories SET active = ? WHERE id = ?")
//                    .bind(0, status)
//                    .bind(1, id)
//                    .execute();
//        });
//    }
//
//    public void editCategory(int id, String categoryName) {
//        JDBIConnector.get().useHandle((handle) -> {
//            handle.createUpdate("UPDATE product_categories SET categoryName = ? WHERE id = ?")
//                    .bind(0, categoryName)
//                    .bind(1, id)
//                    .execute();
//        });
//    }
//
//    public void addCategory(int id, String name) {
//        try {
//            JDBIConnector.get().useHandle((handle) -> {
//                handle.createUpdate("INSERT INTO `product_categories`(`id`, `categoryName`, `group_id`, `active`) VALUES (?,?,?,?)")
//                        .bind(0, getNextIdCategory())
//                        .bind(1, name)
//                        .bind(2, id)
//                        .bind(3, 0)
//                        .execute();
//            });
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    private int getNextIdCategory() throws SQLException {
//        List<ProductCategories> list = JDBIConnector.get().withHandle((handle) -> {
//            return handle.createQuery("SELECT * FROM product_categories WHERE id = (SELECT MAX(id) FROM product_categories)")
//                    .mapToBean(ProductCategories.class)
//                    .collect(Collectors.toList());
//        });
//        return list.get(0).getId() + 1;
//    }
//
//
//    public static void main(String[] args) {
//        ProductCategories c = new ProductCategories();
//    }
//}
