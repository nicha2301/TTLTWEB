package vn.edu.hcmuaf.fit.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Address implements Serializable {
    private Integer id;
    private String address;
    private String phone;
    private String hotline;
    private String email;
    private String timeOpen;
    private String map;

}