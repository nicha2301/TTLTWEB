package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Timestamp;

@Table(name = "product_review")
@Data
@EqualsAndHashCode(callSuper = true)
public class ProductReview extends AbsModel implements Serializable {
    private Integer id;
    @Nested("user")
    private User user;
    private int rating;
    @Nested("order")
    private Order order;
    private String reviewText;
    private Timestamp reviewDate;
    private String imageUrl;

    @Nested("user")
    public User getUsersByUsername() {
        return user;
    }

    @Nested("user")
    public void setUser(User user) {
        this.user = user;
    }

    @Nested("order")
    public Order getOrder() {
        return order;
    }

    @Nested("order")
    public void setOrder(Order order) {
        this.order = order;
    }
}