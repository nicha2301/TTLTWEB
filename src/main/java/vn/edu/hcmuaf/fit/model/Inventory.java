package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Timestamp;

@Table(name = "inventory")
@Data
@EqualsAndHashCode(callSuper = true)
public class Inventory extends AbsModel implements Serializable {
    @Nested("user")
    private User user;
    @Nested("discount")
    private Discount discount;
    private Timestamp addDate;
    private Boolean isUsed;

    @Nested("user")
    public User getUser() {
        return user;
    }

    @Nested("user")
    public void setUser(User user) {
        this.user = user;
    }

    @Nested("discount")
    public Discount getDiscount() {
        return discount;
    }

    @Nested("discount")
    public void setDiscount(Discount discount) {
        this.discount = discount;
    }
}