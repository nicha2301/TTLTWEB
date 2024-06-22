package vn.edu.hcmuaf.fit.dao.impl;

import org.jdbi.v3.core.mapper.RowMapper;
import vn.edu.hcmuaf.fit.dao.ICategoryDAO;
import vn.edu.hcmuaf.fit.model.ProductCategories;

import java.util.AbstractMap;
import java.util.List;
import java.util.Map;

public class CategoryDAO extends AbsDAO<ProductCategories> implements ICategoryDAO {
    private static ICategoryDAO instance;

    public static ICategoryDAO getInstance() {
        if (instance == null) {
            instance = new CategoryDAO();
        }
        return instance;
    }

    @Override
    public List<ProductCategories> getCategories() {
        String sql = "SELECT * FROM product_categories";
        return query(sql, ProductCategories.class);
    }

    @Override
    public Map<ProductCategories, Integer> getQuantityCategories() {
        String sql = "SELECT pc.id AS cateId, COALESCE(SUM(p.quantity), 0) AS total " +
                "FROM product_categories pc " +
                "LEFT JOIN products p ON pc.id = p.category_id " +
                "GROUP BY pc.id, pc.categoryName";
        RowMapper<Map.Entry<ProductCategories, Integer>> rowMapper = (rs, ctx) -> {
            Integer cateId = rs.getInt("cateId");
            Integer total = rs.getInt("total");
            ProductCategories category = getCategoryById(cateId).get(0);
            return new AbstractMap.SimpleEntry<>(category, total);
        };
        return queryForMap(sql, rowMapper);
    }


    @Override
    public List<ProductCategories> getCategoryById(Integer id) {
        String sql = "SELECT * FROM product_categories WHERE id =?";
        return query(sql, ProductCategories.class, id);
    }

    @Override
    public ProductCategories setActive(Integer id, Boolean active) {
        String sql = "UPDATE product_categories SET active =? WHERE id =?";
        return insert(sql, ProductCategories.class, active?1:0, id);
    }

    @Override
    public ProductCategories editCategory(Integer id, String cateName) {
        String sql = "UPDATE product_categories SET categoryName =? WHERE id =?";
        return insert(sql, ProductCategories.class, cateName, id);
    }

    @Override
    public ProductCategories addCategory(String cateName, Integer groupId) {
        String sql = "INSERT INTO `product_categories`(`categoryName`, `group_id`) VALUES(?,?)";
        return insert(sql, ProductCategories.class, cateName, groupId);
    }

}