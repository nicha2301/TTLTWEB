package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

@Table(name = "suppliers")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Supplier extends AbsModel implements Serializable {
     Integer id;
     String supplierName;
     String contactName;
     String email;
     String phone;
     String detailAddress;
     String imageUrl;
     Boolean active;

     public Supplier() {
     }

     public Supplier(Integer id) {
          this.id = id;
     }

     public Supplier(Integer id, String supplierName, String contactName, String email, String phone, String detailAddress, String imageUrl, Boolean active) {
          this.id = id;
          this.supplierName = supplierName;
          this.contactName = contactName;
          this.email = email;
          this.phone = phone;
          this.detailAddress = detailAddress;
          this.imageUrl = imageUrl;
          this.active = active;
     }

}