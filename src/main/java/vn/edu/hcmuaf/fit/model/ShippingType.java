package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Table(name = "shipping_type")
@Data
public class ShippingType implements Serializable {
    private Integer id;
    private String type;
    private String description;
    @Nested("info")
    private ShippingInfo info;

    @Nested("info")
    public ShippingInfo getInfo() {
        return info;
    }

    @Nested("info")
    public void setInfo(ShippingInfo info) {
        this.info = info;
    }
}