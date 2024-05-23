package vn.edu.hcmuaf.fit.dao.impl;

import org.jdbi.v3.core.mapper.RowMapper;
import vn.edu.hcmuaf.fit.dao.IProductDAO;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.ProductCategories;

import java.util.AbstractMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDAO extends AbsDAO<Product> implements IProductDAO {
    private static IProductDAO instance;

    public static IProductDAO getInstance() {
        if(instance==null) {
            return instance = new ProductDAO();
        }
        return instance;
    }

    @Override
    public List<Product> getAllProducts() {
        String sql = "SELECT * FROM products";
        return query(sql, Product.class);
    }

    @Override
    public List<Product> getAllProductsLimited(Integer start, Integer limit) {
        String sql = "SELECT * FROM products LIMIT ?,?";
        return query(sql, Product.class, start, limit);
    }

    @Override
    public Integer getTotalProducts() {
        String sql = "SELECT COUNT(*) FROM products";
        return count(sql);
    }

    @Override
    public List<Product> getProductById(Integer productId) {
        String sql = "SELECT * FROM products WHERE id =?";
        return query(sql, Product.class, productId);
    }

    @Override
    public List<Product> searchProductsLimited(String searchTerm, Integer start, Integer pageSize) {
        String sql = "SELECT * FROM products WHERE productName LIKE ? LIMIT ?, ?";
        return query(sql, Product.class, "%" + searchTerm + "%", start, pageSize);
    }

    @Override
    public Integer getTotalSearchResults(String searchTerm) {
        String sql = "SELECT COUNT(*) FROM products WHERE productName LIKE ?";
        return count(sql, searchTerm);
    }

    @Override
    public Map<String, Integer> getListObject() {
        String query = "SELECT pc.categoryName, COUNT(p.id) AS productCount\n" +
                "FROM product_categories pc\n" +
                "LEFT JOIN products p ON pc.id = p.category_id\n" +
                "GROUP BY pc.id, pc.categoryName;\n";
        RowMapper<Map.Entry<ProductCategories, Integer>> rowMapper = (rs, ctx) -> {
            Integer cateId = rs.getInt("cateId");
            Integer total = rs.getInt("total");
            ProductCategories category = getCategoryById(cateId).get(0);
            return new AbstractMap.SimpleEntry<>(category, total);
        };
        List<Map.Entry<ProductCategories, Integer>> query = query(sql, rowMapper);
        Map<ProductCategories, Integer> res = new HashMap<>();
        for (Map.Entry<ProductCategories, Integer> entry : query) {
            res.put(entry.getKey(), entry.getValue());
        }
        return res;
    }

    @Override
    public List<Product> getProductByCategory(String object) {
        return List.of();
    }

    @Override
    public List<Product> getProductByType(String productType) {
        return List.of();
    }

    @Override
    public Map<String, Integer> getGroupListObject() {
        return Map.of();
    }

    @Override
    public Map<String, Integer> getListProductType() {
        return Map.of();
    }

    @Override
    public List<Product> getProductByGroup(String groupName) {
        return List.of();
    }

    @Override
    public Product updateImgUrl(Integer id, String imgUrl) {
        return null;
    }

    @Override
    public List<Product> getProductByIdWithSupplierInfo(Integer productId) {
        return List.of();
    }

    @Override
    public Integer sumOfProduct() {
        return 0;
    }

    @Override
    public List<Product> loadProductById(Integer id) {
        return List.of();
    }

    @Override
    public Product updateProduct(int id, String productName, int categoryId, double price, int quantity, String purpose, String contraindications, int stockQuantity, String ingredients, String dosage, String instructions, String warrantyPeriod, String storageCondition, String productType, int supplierId) {
        return null;
    }

    @Override
    public Product deleteProductById(int productId) {
        return null;
    }

    @Override
    public Product addProduct(Product product) {
        return null;
    }

    @Override
    public List<Product> getThreePoultryProducts() {
        return List.of();
    }

    @Override
    public List<Product> getThreeOtherProducts() {
        return List.of();
    }
}