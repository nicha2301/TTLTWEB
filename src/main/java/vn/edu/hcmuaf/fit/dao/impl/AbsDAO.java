package vn.edu.hcmuaf.fit.dao.impl;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.mapper.RowMapper;
import vn.edu.hcmuaf.fit.connection_pool.JDBIConnector;
import vn.edu.hcmuaf.fit.dao.GenericDAO;
import vn.edu.hcmuaf.fit.model.Table;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AbsDAO<T> implements GenericDAO<T> {

    @Override
    public <T> List<T> query(String sql, Class<T> bean, Object... parameters) {
        return JDBIConnector.get().withHandle(handle ->
            handle.select(sql, parameters).mapToBean(bean).list()
        );
    }

    private  <T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters) {
        return JDBIConnector.get().withHandle(handle ->
                handle.select(sql, parameters).map(rowMapper).list()
        );
    }

    @Override
    public <T> T modify(String sql, Class<T> bean, Object... parameters) {
        return JDBIConnector.get().withHandle(handle ->
            bindParams(handle, sql, bean, parameters)
        );
    }

    @Override
    public Integer count(String sql, Object... parameters) {
        return JDBIConnector.get().withHandle(handle ->
            handle.select(sql, parameters)
                   .mapTo(Integer.class)
                   .one()
        );
    }

    @Override
    public <K, V> Map<K, V> queryForMap(String sql, RowMapper<Map.Entry<K, V>> rowMapper, Object... parameters) {
        List<Map.Entry<K, V>> entries = query(sql, rowMapper, parameters);
        Map<K, V> res = new HashMap<>();
        for (Map.Entry<K, V> entry : entries) {
            res.put(entry.getKey(), entry.getValue());
        }
        return res;
    }

    private <T> T bindParams(Handle handle, String sql, Class<T> bean, Object... parameters) {
        try {
            var update = handle.createUpdate(sql);
            for (int i = 0; i < parameters.length; i++) {
                update.bind(i, parameters[i]);
            }
            Integer id = update.executeAndReturnGeneratedKeys("id").mapTo(Integer.class).first();
            return query("SELECT * FROM " + getTableName(bean) + " WHERE id = ?", bean, id).get(0);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    private String getTableName(Class<?> clazz) {
        if (clazz.isAnnotationPresent(Table.class)) {
            Table table = clazz.getAnnotation(Table.class);
            return table.name();
        } else {
            throw new IllegalArgumentException("No table annotation present in class: " + clazz.getName());
        }
    }
}