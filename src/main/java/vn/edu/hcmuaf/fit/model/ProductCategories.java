package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Data
public class ProductCategories implements Serializable {
    private Integer id;
    private String categoryName;
    @Nested("product_groups")
    private ProductGroups group;
    private Boolean active;

    @Nested("product_groups")
    public ProductGroups getGroup() {
        return group;
    }

    @Nested("product_groups")
    public void setGroup(ProductGroups group) {
        this.group = group;
    }
}