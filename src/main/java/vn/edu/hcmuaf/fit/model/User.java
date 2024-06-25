package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

@Table(name = "users")
@Data
@EqualsAndHashCode(callSuper = true)
public class User extends AbsModel implements Serializable {
    private Integer id;
    private String username;
    private String email;
    private String password;
    private String fullName;
    private Date dateOfBirth;
    private String city;
    private String district;
    private String ward;
    private String detail_address;
    private String phone;
    private String avatar;
    private Boolean verified;
    private Integer loginBy;
    private Integer loginTimes;
    @Nested("role")
    private Role role;
    private Timestamp date_created;

    @Nested("role")
    public Role getRole() {
        return role;
    }

    @Nested("role")
    public void setRole(Role role) {
        this.role = role;
    }
}