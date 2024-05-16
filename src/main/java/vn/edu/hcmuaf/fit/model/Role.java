package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Table(name = "role")
@Data
public class Role implements Serializable {
    private Integer id;
    private String roleName;

}