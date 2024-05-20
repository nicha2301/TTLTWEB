package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Table(name = "product_categories")
@Data
@EqualsAndHashCode(callSuper = true)
public class ProductCategories extends AbsModel implements Serializable {
    private Integer id;
    private String categoryName;
    @Nested("group")
    private ProductGroups group;
    private Boolean active;

    @Nested("group")
    public ProductGroups getGroup() {
        return group;
    }

    @Nested("group")
    public void setGroup(ProductGroups group) {
        this.group = group;
    }
}