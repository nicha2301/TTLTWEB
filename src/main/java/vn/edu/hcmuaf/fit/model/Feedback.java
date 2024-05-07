package vn.edu.hcmuaf.fit.model;

import lombok.Data;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
public class Feedback implements Serializable {
    private Integer id;
    private String email;
    private String name;
    private String content;
    private Timestamp submissionDate;

}