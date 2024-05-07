package vn.edu.hcmuaf.fit.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class OrderStatus implements Serializable {
    private Integer id;
    private String status;
    private String description;
}
