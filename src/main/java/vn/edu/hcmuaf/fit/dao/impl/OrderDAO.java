package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IOrderDAO;
import vn.edu.hcmuaf.fit.model.Order;
import vn.edu.hcmuaf.fit.model.OrderItem;

import java.util.List;
import java.util.Map;

public class OrderDAO extends AbsDAO<Order> implements IOrderDAO {
    private static IOrderDAO instance;

    public static IOrderDAO getInstance() {
        if (instance == null) {
            instance = new OrderDAO();
        }
        return instance;
    }

    @Override
    public Map<Order, List<OrderItem>> loadOrderProductByOrder(Integer orderId) {
        String sql = "SELECT o.*, i.* FROM (" +
                " SELECT * FROM orders WHERE id = ?" +
                ") AS o LEFT JOIN order_items i ON o.id = i.order_id";
        return queryForMap(sql, new OrderItemMapper(), true, orderId);
    }

    @Override
    public Map<Order, List<OrderItem>> loadOrderProductByUser(Integer userId) {
        String sql = "SELECT o.*, i.* FROM (" +
                " SELECT * FROM orders WHERE user_id = ?" +
                ") AS o LEFT JOIN order_items i ON o.id = i.order_id";
        return queryForMap(sql, new OrderItemMapper(), true, userId);
    }

    @Override
    public Order insertOrders(Integer userId, Integer addressId, Integer shipType, Integer discountId, Integer paymentId, String note, Integer statusId) {
        String sql = "INSERT INTO orders (user_id, address_id, ship_type, discount_id, payment_id, note, status_id) VALUES (?,?,?,?,?,?,?)";
        return insert(sql, Order.class, userId, addressId, shipType, discountId, paymentId, note, statusId);
    }

    @Override
    public Map<Order, List<OrderItem>> loadOrderNear(Integer limit) {
        String sql = "SELECT o.*, i.* FROM (" +
                " SELECT * FROM orders ORDER BY date_created DESC LIMIT ? " +
                ") AS o LEFT JOIN order_items i ON o.id = i.order_id";
        return queryForMap(sql, new OrderItemMapper(), true, limit);
    }

    @Override
    public boolean updateOrderStatus(Integer orderId, Integer statusId) {
        String sql = "UPDATE orders SET status_id = ? WHERE id = ?";
        return update(sql, statusId, orderId);
    }

    @Override
    public boolean deleteOrder(Integer orderId) {
        String sql = "DELETE FROM orders WHERE id = ?";
        return update(sql, orderId);
    }

    @Override
    public boolean updateTimePayment(Integer orderId) {
        String sql = "UPDATE orders SET date_payment = CURRENT_TIMESTAMP WHERE id = ?";
        return update(sql, orderId);
    }

    @Override
    public boolean updateOrdStatusByAdmin(Integer orderId, Integer adminId, Integer statusId) {
        String sql = "UPDATE orders SET status_id =?, admin_id =? WHERE id = ?";
        return update(sql, statusId, adminId, orderId);
    }

    @Override
    public boolean updatePayment(Integer orderId, Integer payment) {
        String sql = "UPDATE orders SET payment_id = ? WHERE id = ?";
        return update(sql, payment, orderId);
    }

    @Override
    public boolean updateDelivery(Integer orderId, Integer delivery) {
        String sql = "UPDATE orders SET address_id = ? WHERE id = ?";
        return update(sql, delivery, orderId);
    }
}