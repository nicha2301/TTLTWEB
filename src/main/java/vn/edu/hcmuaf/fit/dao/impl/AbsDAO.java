package vn.edu.hcmuaf.fit.dao.impl;

import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.connection_pool.JDBIConnector;
import vn.edu.hcmuaf.fit.dao.GenericDAO;

import java.util.List;

public class AbsDAO<T> implements GenericDAO<T> {

    @Override
    public List<T> query(String sql, Class<T> bean, Object... parameters) {
        return JDBIConnector.get().withHandle(handle ->
            handle.select(sql, parameters).mapToBean(bean).list()
        );
    }

    @Override
    public Integer modify(String sql, Object... parameters) {
        return JDBIConnector.get().withHandle(handle ->
            bindParams(handle, sql, parameters)
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

    private int bindParams(Handle handle, String sql, Object... parameters) {
        try {
            var update = handle.createUpdate(sql);
            for (int i = 0; i < parameters.length; i++) {
                update.bind(i, parameters[i]);
            }
            return update.execute();
        } catch (NullPointerException e) {
            return 0;
        }
    }
}