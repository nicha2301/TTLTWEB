package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Timestamp;

@Table(name = "cart")
@Data
@EqualsAndHashCode(callSuper = true)
public class Cart extends AbsModel implements Serializable {
    @Nested("users")
    private User user;
    @Nested("products")
    private Product product;
    private Integer quantity;
    private Timestamp addDate;

    @Nested("users")
    public User getUser() {
        return user;
    }

    @Nested("users")
    public void setUser(User user) {
        this.user = user;
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