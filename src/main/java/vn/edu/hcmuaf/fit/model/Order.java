package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Timestamp;

@Table(name = "orders")
@Data
@EqualsAndHashCode(callSuper = true)
public class Order extends AbsModel implements Serializable {
    private Integer id;
    @Nested("user")
    private User user;
    @Nested("address")
    private DeliveryAddress address;
    @Nested("type")
    private ShippingType type;
    @Nested("discount")
    private Discount discount;
    @Nested("payment")
    private Payment payment;
    private Timestamp dateCreated;
    private Timestamp datePayment;
    private String note;
    @Nested("status")
    private OrderStatus status;
    @Nested("admin")
    private User admin;

    @Nested("user")
    public User getUser() {
        return user;
    }

    @Nested("user")
    public void setUser(User user) {
        this.user = user;
    }

    @Nested("address")
    public DeliveryAddress getAddress() {
        return address;
    }

    @Nested("address")
    public void setAddress(DeliveryAddress address) {
        this.address = address;
    }

    @Nested("type")
    public ShippingType getType() {
        return type;
    }

    @Nested("type")
    public void setType(ShippingType type) {
        this.type = type;
    }

    @Nested("discount")
    public Discount getDiscount() {
        return discount;
    }

    @Nested("discount")
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

    @Nested("status")
    public OrderStatus getStatus() {
        return status;
    }

    @Nested("status")
    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    @Nested("admin")
    public User getAdmin() {
        return admin;
    }

    @Nested("admin")
    public void setAdmin(User admin) {
        this.admin = admin;
    }
}