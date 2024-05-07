package vn.edu.hcmuaf.fit.model;

import lombok.Data;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
public class Discount implements Serializable {
    private Integer id;
    private String discountName;
    private String description;
    private Double salePercent;
    private Integer quantity;
    private Timestamp startDate;
    private Timestamp expirationDate;

}