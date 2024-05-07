package vn.edu.hcmuaf.fit.model;

import lombok.Data;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
public class Payment implements Serializable {
    private Integer id;
    private String payName;
    private String description;
    private Timestamp remainingTime;

}