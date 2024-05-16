package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.sql.Timestamp;

@Table(name = "discounts")
@Data
@EqualsAndHashCode(callSuper = true)
public class Discount extends AbsModel implements Serializable {
    private Integer id;
    private String discountName;
    private String description;
    private Double salePercent;
    private Integer quantity;
    private Timestamp startDate;
    private Timestamp expirationDate;

}