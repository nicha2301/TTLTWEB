package vn.edu.hcmuaf.fit.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Role implements Serializable {
    private Integer id;
    private String roleName;

}