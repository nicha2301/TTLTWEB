package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Table(name = "order_items")
@Data
@EqualsAndHashCode(callSuper = true)
public class OrderItem extends AbsModel implements Serializable {
    @Nested("order")
    private Order order;
    @Nested("product")
    private Product product;
    private Integer quantity;
    private Integer orderPrice;

    @Nested("order")
    public Order getOrder() {
        return order;
    }

    @Nested("order")
    public void setOrder(Order order) {
        this.order = order;
    }

    @Nested("product")
    public Product getProduct() {
        return product;
    }

    @Nested("product")
    public void setProduct(Product product) {
        this.product = product;
    }
}