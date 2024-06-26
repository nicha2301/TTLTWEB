package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Table(name = "delivery_address")
@Data
@EqualsAndHashCode(callSuper = true)
public class DeliveryAddress extends AbsModel implements Serializable {
    private Integer id;
    @Nested("user")
    private User user;
    private String fullName;
    private String phone;
    private String province;
    private String district;
    private String ward;
    private String detailAddress;
    private Boolean atHome;
    private Boolean isPrimary;

    @Nested("user")
    public User getUser() {
        return user;
    }

    @Nested("user")
    public void setUser(User user) {
        this.user = user;
    }
}