package vn.edu.hcmuaf.fit.dao.impl;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.mapper.reflect.BeanMapper;
import org.jdbi.v3.core.statement.StatementContext;
import org.jdbi.v3.core.statement.Update;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.dao.GenericDAO;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.Table;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class AbsDAO<T> implements GenericDAO<T> {

    @Override
    public <T> List<T> query(String sql, Class<T> bean, Object... parameters) {
        return JDBIConnector.get().withHandle(handle ->
            handle.select(sql, parameters).mapToBean(bean).list()
        );
    }

    private <T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters) {
        return JDBIConnector.get().withHandle(handle ->
                handle.select(sql, parameters).map(rowMapper).list()
        );
    }

    // insert
    @Override
    public <T> T insert(String sql, Class<T> bean, Object... parameters) {
        return JDBIConnector.get().withHandle(handle ->
            bindParams(handle, sql, bean, parameters)
        );
    }

    // update, delete
    @Override
    public boolean update(String sql, Object... parameters) {
        return JDBIConnector.get().withHandle(handle ->
            bindParams(handle, sql, parameters)
        );
    }

    private boolean bindParams(Handle handle, String sql, Object... parameters) {
        try {
            Update update = handle.createUpdate(sql);
            for (int i = 0; i < parameters.length; i++) {
                update.bind(i, parameters[i]);
            }
            return update.execute()!=0?true:false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
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
    public <K, V> Map<K, V> queryForMap(String sql, RowMapper<Map.Entry<K, V>> rowMapper, boolean mergeValues, Object... parameters) {
        List<Map.Entry<K, V>> entries = query(sql, rowMapper, parameters);
        Map<K, V> result = new HashMap<>();
        if (mergeValues) {
            entries.forEach(entry -> result.merge(entry.getKey(), entry.getValue(), (oldVal, newVal) -> {
                ((List<String>) oldVal).addAll((List<String>) newVal);
                return oldVal;
            }));
        } else {
            entries.forEach(entry -> result.put(entry.getKey(), entry.getValue()));
        }
        return result;
    }

    /**
     * Chỗ này ví dụ bean truyền vào là User, nhưng khi in ra thì là Log
     */
    private <T> T bindParams(Handle handle, String sql, Class<T> bean, Object... parameters) {
        try {
            Update update = handle.createUpdate(sql);
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

    class ProductImageMapper implements RowMapper<Map.Entry<Product, List<String>>> {
        private String imageName;

        public ProductImageMapper(String imageName) {
            this.imageName = imageName;
        }

        @Override
        public Map.Entry<Product, List<String>> map(ResultSet rs, StatementContext ctx) throws SQLException {
            // Sử dụng BeanMapper để tự động map các cột tới các thuộc tính của đối tượng Product
            Product product = BeanMapper.of(Product.class).map(rs, ctx);
            List<String> images = new ArrayList<>();
            String imageUrl = rs.getString(this.imageName);
            if (imageUrl != null) {
                images.add(imageUrl);
            }
            return new AbstractMap.SimpleEntry<>(product, images);
        }
    }
}