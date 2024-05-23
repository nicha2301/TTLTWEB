package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Table(name = "address")
@EqualsAndHashCode(callSuper = true)
@Data
public class Address extends AbsModel implements Serializable {
    private Integer id;
    private String address;
    private String phone;
    private String hotline;
    private String email;
    private String timeOpen;
    private String map;

}