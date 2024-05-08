package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Data
@EqualsAndHashCode(callSuper = true)
public class Product extends AbsModel implements Serializable {
    private Integer id;
    private String productName;
    @Nested("product_categories")
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
    @Nested("product_types")
    private ProductTypes type;
    @Nested("suppliers")
    private Supplier supplier;
    private Boolean active;

    @Nested("product_categories")
    public ProductCategories getCategories() {
        return categories;
    }

    @Nested("product_categories")
    public void setCategories(ProductCategories categories) {
        this.categories = categories;
    }

    @Nested("product_types")
    public ProductTypes getType() {
        return type;
    }

    @Nested("product_types")
    public void setType(ProductTypes type) {
        this.type = type;
    }

    @Nested("suppliers")
    public Supplier getSupplier() {
        return supplier;
    }

    @Nested("suppliers")
    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    @Override
    public String toString() {
        return "Product{id=" + id + ", productName=" + productName + "}";
    }
}