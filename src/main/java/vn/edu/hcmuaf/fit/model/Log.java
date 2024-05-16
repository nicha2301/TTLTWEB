package vn.edu.hcmuaf.fit.model;

import lombok.Data;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Timestamp;

@Table(name = "log")
@Data
public class Log implements Serializable {
    private Integer id;
    @Nested("level")
    private Level level;
    private String ip;
    private String address;
    private String preValue;
    private String postValue;
    private Timestamp createdAt;

    @Nested("level")
    public Level getLevel() {
        return level;
    }

    @Nested("level")
    public void setLevel(Level level) {
        this.level = level;
    }
}