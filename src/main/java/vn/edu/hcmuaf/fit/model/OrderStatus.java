package vn.edu.hcmuaf.fit.model;

import lombok.Data;

import java.io.Serializable;

@Table(name = "order_status")
@Data
public class OrderStatus implements Serializable {
    private Integer id;
    private String status;
    private String description;

}