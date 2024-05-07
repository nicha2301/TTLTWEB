package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Data
public class ShippingType implements Serializable {
    private Integer id;
    private String type;
    private String description;
    @Nested("shipping_info")
    private ShippingInfo info;

    @Nested("shipping_info")
    public ShippingInfo getInfo() {
        return info;
    }

    @Nested("shipping_info")
    public void setInfo(ShippingInfo info) {
        this.info = info;
    }
}