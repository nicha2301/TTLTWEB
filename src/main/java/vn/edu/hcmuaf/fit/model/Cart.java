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
    @Nested("user")
    private User user;
    @Nested("product")
    private Product product;
    private Integer quantity;
    private Timestamp addDate;

    @Nested("user")
    public User getUser() {
        return user;
    }

    @Nested("user")
    public void setUser(User user) {
        this.user = user;
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