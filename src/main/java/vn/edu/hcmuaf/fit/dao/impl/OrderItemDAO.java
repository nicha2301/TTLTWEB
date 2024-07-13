package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IOrderItemDAO;
import vn.edu.hcmuaf.fit.model.OrderItem;

public class OrderItemDAO extends AbsDAO<OrderItem> implements IOrderItemDAO {
    private static IOrderItemDAO instance;

    public static IOrderItemDAO getInstance() {
        if (instance == null) {
            instance = new OrderItemDAO();
        }
        return instance;
    }

    @Override
    public OrderItem addOrderItem(Integer orderId, Integer prodId, Integer quantity, Integer orderPrice) {
        String sql = "INSERT INTO order_items (order_id, product_id, quantity, order_price) VALUES (?,?,?,?)";
        return insert(sql, OrderItem.class, orderId, prodId, quantity, orderPrice);
    }

    @Override
    public boolean deleteOrderItem(Integer orderId) {
        String sql = "DELETE FROM order_items WHERE order_id =?";
        return update(sql, orderId);
    }
}