package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

@Table(name = "order_status")
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderStatus implements Serializable {
     Integer id;
     String status;
     String description;

}