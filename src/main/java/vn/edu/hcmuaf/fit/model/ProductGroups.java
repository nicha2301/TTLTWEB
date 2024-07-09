package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

@Table(name = "product_groups")
@EqualsAndHashCode(callSuper = true)
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductGroups extends AbsModel implements Serializable {
     Integer id;
     String groupName;
     Boolean active;

}