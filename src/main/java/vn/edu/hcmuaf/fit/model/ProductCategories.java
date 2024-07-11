package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Table(name = "product_categories")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductCategories extends AbsModel implements Serializable {
     Integer id;
     String categoryName;
     @Nested("group")
     ProductGroups group;
     Boolean active;

    public ProductCategories(Integer id) {
        this.id = id;
    }




    @Nested("group")
    public ProductGroups getGroup() {
        return group;
    }

    @Nested("group")
    public void setGroup(ProductGroups group) {
        this.group = group;
    }
}