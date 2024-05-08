package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.model.AbsModel;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.model.Log;

public class LogDAO<T extends AbsModel> extends AbsDAO<Log> {

    public Integer insert(T model, Level level, String ip, String address) {
        try {
            String sql = "INSERT INTO log(level_id, ip, address, pre_value, post_value) VALUES (?, ?, ?, ?, ?)";
            return modify(sql, level.getId(), ip, address, model.getBeforeData(), model.getAfterData());
        } catch (Exception e) {
            return null;
        }
    }
}