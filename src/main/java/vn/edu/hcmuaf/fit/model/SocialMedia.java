package vn.edu.hcmuaf.fit.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class SocialMedia implements Serializable {
    private Integer id;
    private String facebook;
    private String instagram;
    private String twitter;
    private String pinterest;
    private String youtube;
    private String linkedin;

}