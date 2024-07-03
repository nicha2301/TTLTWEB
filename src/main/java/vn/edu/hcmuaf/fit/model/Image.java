package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Timestamp;

@Table(name = "images")
@Data
public class Image implements Serializable {
    private Integer id;
    @Nested("product")
    private Product product;
    private String imageUrl;
    private Timestamp dateSave;

    @Nested("product")
    public Product getProduct() {
        return product;
    }

    @Nested("product")
    public void setProduct(Product product) {
        this.product = product;
    }
}