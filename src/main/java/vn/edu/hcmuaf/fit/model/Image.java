package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Table(name = "images")
@Data
@EqualsAndHashCode(callSuper = true)
public class Image extends AbsModel implements Serializable {
    private Integer id;
    @Nested("product")
    private Product product;
    private String imageUrl;

    @Nested("product")
    public Product getProduct() {
        return product;
    }

    @Nested("product")
    public void setProduct(Product product) {
        this.product = product;
    }
}