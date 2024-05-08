package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
@EqualsAndHashCode(callSuper = true)
public class Inventory extends AbsModel implements Serializable {
    @Nested("users")
    private User user;
    @Nested("discounts")
    private Discount discount;
    private Timestamp addDate;
    private Boolean isUsed;

    @Nested("users")
    public User getUser() {
        return user;
    }

    @Nested("users")
    public void setUser(User user) {
        this.user = user;
    }

    @Nested("discounts")
    public Discount getDiscount() {
        return discount;
    }

    @Nested("discounts")
    public void setDiscount(Discount discount) {
        this.discount = discount;
    }
}