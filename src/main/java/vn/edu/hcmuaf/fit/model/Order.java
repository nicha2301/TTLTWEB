package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
public class Order implements Serializable {
    private Integer id;
    @Nested("users")
    private User user;
    @Nested("delivery_address")
    private DeliveryAddress address;
    @Nested("shipping_type")
    private ShippingType type;
    @Nested("discounts")
    private Discount discount;
    @Nested("payment")
    private Payment payment;
    private Timestamp dateCreated;
    private Timestamp datePayment;
    private String note;
    @Nested("order_status")
    private OrderStatus status;
    @Nested("users")
    private User admin;

    @Nested("users")
    public User getUser() {
        return user;
    }

    @Nested("users")
    public void setUser(User user) {
        this.user = user;
    }

    @Nested("delivery_address")
    public DeliveryAddress getAddress() {
        return address;
    }

    @Nested("delivery_address")
    public void setAddress(DeliveryAddress address) {
        this.address = address;
    }

    @Nested("shipping_type")
    public ShippingType getType() {
        return type;
    }

    @Nested("shipping_type")
    public void setType(ShippingType type) {
        this.type = type;
    }

    @Nested("discounts")
    public Discount getDiscount() {
        return discount;
    }

    @Nested("discounts")
    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    @Nested("payment")
    public Payment getPayment() {
        return payment;
    }

    @Nested("payment")
    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    @Nested("order_status")
    public OrderStatus getStatus() {
        return status;
    }

    @Nested("order_status")
    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    @Nested("users")
    public User getAdmin() {
        return admin;
    }

    @Nested("users")
    public void setAdmin(User admin) {
        this.admin = admin;
    }
}