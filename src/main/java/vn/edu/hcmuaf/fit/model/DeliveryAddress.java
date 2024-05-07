package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Data
public class DeliveryAddress implements Serializable {
    private Integer id;
    @Nested("users")
    private User user;
    private String fullName;
    private String phone;
    private String province;
    private String district;
    private String ward;
    private String detailAddress;
    private Boolean atHome;
    private Boolean isPrimary;

    @Nested("users")
    public User getUser() {
        return user;
    }

    @Nested("users")
    public void setUser(User user) {
        this.user = user;
    }
}