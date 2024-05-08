package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@EqualsAndHashCode(callSuper = true)
@Data
public class Supplier extends AbsModel implements Serializable {
    private Integer id;
    private String supplierName;
    private String contactName;
    private String email;
    private String phone;
    private String detailAddress;
    private String imageUrl;
    private Boolean active;

}