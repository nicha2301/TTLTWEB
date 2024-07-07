package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.sql.Date;
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
    private Date startDate;
    private Date expirationDate;

    public Discount() {
    }

    public Discount(Integer id, String discountName, String description, Double salePercent, Integer quantity, Date startDate, Date expirationDate) {
        this.id = id;
        this.discountName = discountName;
        this.description = description;
        this.salePercent = salePercent;
        this.quantity = quantity;
        this.startDate = startDate;
        this.expirationDate = expirationDate;
    }
}