package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.sql.Timestamp;

@Data
@EqualsAndHashCode(callSuper = true)
public class Feedback extends AbsModel implements Serializable {
    private Integer id;
    private String email;
    private String name;
    private String content;
    private Timestamp submissionDate;

}