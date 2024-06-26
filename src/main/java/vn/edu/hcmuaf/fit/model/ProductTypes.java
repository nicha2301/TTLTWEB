package vn.edu.hcmuaf.fit.model;

import lombok.Data;

import java.io.Serializable;

@Table(name = "product_types")
@Data
public class ProductTypes implements Serializable {
    private Integer id;
    private String typeName;

    public ProductTypes() {
    }

    public ProductTypes(Integer id, String typeName) {
        this.id = id;
        this.typeName = typeName;
    }
}