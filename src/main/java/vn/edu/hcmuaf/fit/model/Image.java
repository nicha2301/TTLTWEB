package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Data
@EqualsAndHashCode(callSuper = true)
public class Image extends AbsModel implements Serializable {
    private Integer id;
    @Nested("products")
    private Product product;
    private String imageUrl;

    @Nested("products")
    public Product getProduct() {
        return product;
    }

    @Nested("products")
    public void setProduct(Product product) {
        this.product = product;
    }
}