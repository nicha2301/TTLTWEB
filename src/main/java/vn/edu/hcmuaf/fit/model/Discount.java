package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;
import java.sql.Timestamp;

@Table(name = "discounts")
@EqualsAndHashCode(callSuper = true)
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Discount extends AbsModel implements Serializable {
     Integer id;
     String discountName;
     String description;
     Double salePercent;
     Integer quantity;
     Timestamp startDate;
     Timestamp expirationDate;
}