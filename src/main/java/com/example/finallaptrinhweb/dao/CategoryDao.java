package com.example.finallaptrinhweb.dao;

import com.example.finallaptrinhweb.db.JDBIConnector;
import com.example.finallaptrinhweb.model.*;

import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

public class CategoryDao {
    private static CategoryDao instance;

    public CategoryDao() {
    }

    public static CategoryDao getInstance() {
        if (instance == null) {
            instance = new CategoryDao();
        }

        return instance;
    }

    public List<ProductGroups> getGroupCategory() {
        try {
            return JDBIConnector.me().get().withHandle(handle -> {
                return handle.createQuery("SELECT * FROM product_groups")
                        .mapToBean(ProductGroups.class)
                        .collect(Collectors.toList());
            });
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<ProductCategories> getCategory() {
        try {
            return JDBIConnector.me().get().withHandle(handle -> {
                return handle.createQuery("SELECT * FROM product_categories")
                        .mapToBean(ProductCategories.class)
                        .collect(Collectors.toList());
            });
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<CategoryQuantity> getQuantityCategory() {
        try {
            return JDBIConnector.me().get().withHandle(handle -> {
                return handle.createQuery("SELECT pc.id AS categoryId, COALESCE(SUM(p.quantity), 0) AS totalQuantity\n" +
                                "FROM product_categories pc\n" +
                                "LEFT JOIN products p ON pc.id = p.category_id\n" +
                                "GROUP BY pc.id, pc.categoryName")
                        .mapToBean(CategoryQuantity.class)
                        .collect(Collectors.toList());
            });
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void setStatus(int status, int id) {
        try {
            JDBIConnector.me().get().useHandle((handle) -> {
                handle.createUpdate("UPDATE product_categories SET active = ? WHERE id = ?")
                        .bind(0, status)
                        .bind(1, id)
                        .execute();
            });
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void editCategory(int id, String categoryName) {
        try {
            JDBIConnector.me().get().useHandle((handle) -> {
                handle.createUpdate("UPDATE product_categories SET categoryName = ? WHERE id = ?")
                        .bind(0, categoryName)
                        .bind(1, id)
                        .execute();
            });
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addCategory(int id, String name) {
        try {
            JDBIConnector.me().get().useHandle((handle) -> {
                handle.createUpdate("INSERT INTO `product_categories`(`id`, `categoryName`, `group_id`, `active`) VALUES (?,?,?,?)")
                        .bind(0, getNextIdCategory())
                        .bind(1, name)
                        .bind(2, id)
                        .bind(3, 0)
                        .execute();
            });
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private int getNextIdCategory() throws SQLException {
        List<ProductCategories> list = JDBIConnector.me().get().withHandle((handle) -> {
            return handle.createQuery("SELECT * FROM product_categories WHERE id = (SELECT MAX(id) FROM product_categories)")
                    .mapToBean(ProductCategories.class)
                    .collect(Collectors.toList());
        });
        return list.get(0).getId() + 1;
    }

    public List<Order> loadOrderByStatus(String status) {
        try {
            return JDBIConnector.me().get().withHandle((handle) -> {
                return handle.createQuery("SELECT orders.id AS order_id, orders.date_created, orders.username, orders.total_pay, orders.status " +
                                "FROM orders " +
                                "INNER JOIN order_products ON orders.id = order_products.order_id " +
                                "WHERE orders.status = ? " +
                                "GROUP BY orders.id")
                        .bind(0, status)
                        .mapToBean(Order.class)
                        .collect(Collectors.toList());
            });
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    ;

    public List<Order> loadAllOrder() {
        try {
            return JDBIConnector.me().get().withHandle((handle) -> {
                return handle.createQuery("SELECT * FROM orders")
                        .mapToBean(Order.class)
                        .collect(Collectors.toList());
            });
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    ;

    public Order loadOrder_view(int order_id) {
        try {
            return JDBIConnector.me().get().withHandle((handle) -> {
                return handle.createQuery("SELECT o.id, o.username, o.user_id, o.discounts_id, o.ship_id, o.quantity, o.status, o.totalAmount, o.phone, o.detail_address, o.payment, o.date_created, o.total_pay, o.ship_price " +
                                "FROM orders o " +
                                "INNER JOIN users u ON o.user_id = u.id " +
                                "INNER JOIN order_products op ON o.id = op.order_id " +
                                "WHERE o.id = ? " +
                                "GROUP BY o.id, o.date_created, u.id, o.quantity, o.status, o.totalAmount, o.phone, o.detail_address, o.payment, o.date_created, o.total_pay, o.ship_price, u.username")
                        .bind(0, order_id)
                        .mapToBean(Order.class)
                        .one();
            });

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    ;


    public List<OrderProduct> loadOrderProductByOrderId(int orderId) {
        try {
            return JDBIConnector.me().get().withHandle((handle) -> {
                return handle.createQuery("SELECT id, order_id, discounts_id, productName, imageUrl, quantity, price, SUM(price * quantity) as total " +
                                "FROM order_products " +
                                "WHERE order_id = ? " +
                                "GROUP BY order_id")
                        .bind(0, orderId)
                        .mapToBean(OrderProduct.class)
                        .collect(Collectors.toList());
            });
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    public static void main(String[] args) throws SQLException {
    }


}
