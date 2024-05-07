package vn.edu.hcmuaf.fit.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Supplier implements Serializable {
    private Integer id;
    private String supplierName;
    private String contactName;
    private String email;
    private String phone;
    private String detailAddress;
    private String imageUrl;
    private Boolean active;

}