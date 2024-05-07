package vn.edu.hcmuaf.fit.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class ProductGroups implements Serializable {
    private Integer id;
    private String groupName;
    private Boolean active;

}