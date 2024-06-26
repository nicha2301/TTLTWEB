package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Table(name = "product_groups")
@Data
@EqualsAndHashCode(callSuper = true)
public class ProductGroups extends AbsModel implements Serializable {
    private Integer id;
    private String groupName;
    private Boolean active;

    public ProductGroups() {
    }

    public ProductGroups(Integer id, String groupName, Boolean active) {
        this.id = id;
        this.groupName = groupName;
        this.active = active;
    }
}