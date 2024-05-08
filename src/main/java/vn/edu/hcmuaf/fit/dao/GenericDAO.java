package vn.edu.hcmuaf.fit.dao;

import java.util.List;

public interface GenericDAO<T> {

    List<T> query(String sql, Class<T> bean, Object... parameters);

    /**
     * This method use for insert, update and delete records from table in database
     */
    Integer modify(String sql, Object... parameters);

    Integer count(String sql, Object... parameters);

}