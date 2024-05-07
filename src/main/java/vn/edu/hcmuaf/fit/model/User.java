package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

@Data
public class User implements Serializable {
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