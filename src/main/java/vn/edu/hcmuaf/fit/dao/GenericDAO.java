package vn.edu.hcmuaf.fit.dao;

import org.jdbi.v3.core.mapper.RowMapper;

import java.util.List;

public interface GenericDAO<T> {

    <T> List<T> query(String sql, Class<T> bean, Object... parameters);

    <T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters);

    <T> T modify(String sql, Class<T> bean, Object... parameters);

    Integer count(String sql, Object... parameters);

}