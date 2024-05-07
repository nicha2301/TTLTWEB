package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Data
public class Wishlist implements Serializable {
    @Nested("users")
    private User user;
    @Nested("products")
    private Product product;

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