package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Table(name = "products")
@Data
@EqualsAndHashCode(callSuper = true)
public class Product extends AbsModel implements Serializable {
    private Integer id;
    private String productName;
    @Nested("categories")
    private ProductCategories categories;
    private Double salePercent;
    private Integer price;
    private Integer quantity;
    private String purpose;
    private String contraindications;
    private String ingredients;
    private String dosage;
    private String instructions;
    private String warrantyPeriod;
    private String storageCondition;
    @Nested("type")
    private ProductTypes type;
    @Nested("supplier")
    private Supplier supplier;
    private Boolean active;

    @Nested("categories")
    public ProductCategories getCategories() {
        return categories;
    }

    @Nested("categories")
    public void setCategories(ProductCategories categories) {
        this.categories = categories;
    }

    @Nested("type")
    public ProductTypes getType() {
        return type;
    }

    @Nested("type")
    public void setType(ProductTypes type) {
        this.type = type;
    }

    @Nested("supplier")
    public Supplier getSupplier() {
        return supplier;
    }

    @Nested("supplier")
    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    @Override
    public String toString() {
        return "Product{id=" + id + ", productName=" + productName + "}";
    }
}