package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Data
@EqualsAndHashCode(callSuper = true)
public class OrderItem extends AbsModel implements Serializable {
    @Nested("orders")
    private Order order;
    @Nested("products")
    private Product product;
    private Integer quantity;
    private Integer orderPrice;

    @Nested("orders")
    public Order getOrder() {
        return order;
    }

    @Nested("orders")
    public void setOrder(Order order) {
        this.order = order;
    }

    @Nested("products")
    public Product getProduct() {
        return product;
    }

    @Nested("products")
    public void setProduct(Product product) {
        this.product = product;
    }
}