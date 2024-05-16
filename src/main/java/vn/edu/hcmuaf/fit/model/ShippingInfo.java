package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Table(name = "shipping_info")
@Data
public class ShippingInfo implements Serializable {
    private Integer id;
    private String shippingName;
    private String phone;
    private Integer pricePerKg;
    private Integer pricePerSize;
    private Integer pricePerKm;

}