package vn.edu.hcmuaf.fit.model;

import lombok.Data;

import java.io.Serializable;

@Table(name = "level")
@Data
public class Level implements Serializable {
    private Integer id;
    private String level;
    private String description;

}