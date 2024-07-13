package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.OrderItem;

public interface IOrderItemDAO extends GenericDAO<OrderItem> {

    OrderItem addOrderItem(Integer orderId, Integer prodId, Integer quantity, Integer orderPrice);

    boolean deleteOrderItem(Integer orderId);
}