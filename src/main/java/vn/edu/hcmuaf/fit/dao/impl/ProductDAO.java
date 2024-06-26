package vn.edu.hcmuaf.fit.dao.impl;

import org.jdbi.v3.core.mapper.RowMapper;
import vn.edu.hcmuaf.fit.dao.IProductDAO;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.Supplier;
import vn.edu.hcmuaf.fit.service.impl.SupplierService;

import java.util.AbstractMap;
import java.util.List;
import java.util.Map;

public class ProductDAO extends AbsDAO<Product> implements IProductDAO {
    private static IProductDAO instance;

    public static IProductDAO getInstance() {
        if (instance==null) {
            return instance = new ProductDAO();
        }
        return instance;
    }

    /**
     * TESTED
     * Retrieves all products from the database.
     */
    @Override
    public List<Product> getAllProducts() {
        String sql = "SELECT * FROM products";
        return query(sql, Product.class);
    }

    /**
     * TESTED
     * Retrieves all products from the database, limited by the provided start and limit parameters.
     */
    @Override
    public List<Product> getAllProductsLimited(Integer start, Integer limit) {
        String sql = "SELECT * FROM products LIMIT ?, ?";
        return query(sql, Product.class, start, limit);
    }

    /**
     * TESTED
     * Retrieves the total number of products in the database.
     */
    @Override
    public Integer getTotalProducts() {
        String sql = "SELECT COUNT(*) FROM products";
        return count(sql);
    }

    /**
     * TESTED
     * Retrieves all products from the database that match the search term.
     */
    @Override
    public List<Product> searchProductsLimited(String searchTerm, Integer start, Integer pageSize) {
        String sql = "SELECT * FROM products WHERE productName LIKE ? LIMIT ?, ?";
        return query(sql, Product.class, "%" + searchTerm + "%", start, pageSize);
    }

    /**
     * TESTED
     * Retrieves the total number of products in the database that match the search term.
     */
    @Override
    public Integer getTotalSearchResults(String searchTerm) {
        String sql = "SELECT COUNT(*) FROM products WHERE productName LIKE ?";
        return count(sql, searchTerm);
    }

    /**
     * TESTED
     * Retrieves the total number of products in the database that belong to each category.
     */
    @Override
    public Map<String, Integer> getListObject() {
        String sql = "SELECT pc.categoryName AS cateName, COUNT(p.id) AS total " +
                "FROM product_categories pc " +
                "LEFT JOIN products p ON pc.id = p.category_id " +
                "GROUP BY pc.id, pc.categoryName";
        RowMapper<Map.Entry<String, Integer>> rowMapper = (rs, ctx) -> {
            String cateName = rs.getString("cateName");
            Integer total = rs.getInt("total");
            return new AbstractMap.SimpleEntry<>(cateName, total);
        };
        return queryForMap(sql, rowMapper);
    }

    /**
     * TESTED
     * Retrieves all products from the database that belong to the specified category.
     */
    @Override
    public List<Product> getProductByCategory(String categoryName) {
        String sql = "SELECT p.* " +
                "FROM products p " +
                "JOIN product_categories pc ON p.category_id = pc.id " +
                "WHERE pc.categoryName = ?";
        return query(sql, Product.class, categoryName);
    }

    /**
     * TESTED
     * Retrieves all products from the database that belong to the specified type.
     */
    @Override
    public List<Product> getProductByType(String productType) {
        String sql = "SELECT p.* " +
                "FROM products p " +
                "JOIN product_types pt ON p.type_id = pt.id " +
                "WHERE pt.type_name = ?";
        return query(sql, Product.class, productType);
    }

    /**
     * TESTED
     * Retrieves the total number of products in each group.
     */
    @Override
    public Map<String, Integer> getGroupListObject() {
        String sql = "SELECT pg.groupName AS groupName, COUNT(pc.id) AS productCount " +
                "FROM product_groups pg " +
                "LEFT JOIN product_categories pc ON pg.id = pc.group_id " +
                "GROUP BY pg.groupName";
        RowMapper<Map.Entry<String, Integer>> rowMapper = (rs, ctx) -> {
            String groupName = rs.getString("groupName");
            Integer productCount = rs.getInt("productCount");
            return new AbstractMap.SimpleEntry<>(groupName, productCount);
        };
        return queryForMap(sql, rowMapper);
    }

    /**
     * TESTED
     * Retrieves the total number of products in each type.
     */
    @Override
    public Map<String, Integer> getListProductType() {
        String sql = "SELECT pt.type_name AS typeName, COUNT(p.id) AS total " +
                "FROM product_types pt " +
                "LEFT JOIN products p ON pt.id = p.type_id " +
                "GROUP BY p.type_id, pt.type_name";
        RowMapper<Map.Entry<String, Integer>> rowMapper = (rs, ctx) -> {
            String typeName = rs.getString("typeName");
            Integer total = rs.getInt("total");
            return new AbstractMap.SimpleEntry<>(typeName, total);
        };
        return queryForMap(sql, rowMapper);
    }

    /**
     * TESTED
     * Retrieves all products from the database that belong to the specified group.
     */
    @Override
    public List<Product> getProductByGroup(String groupName) {
        String sql = "SELECT p.* " +
                "FROM products p " +
                "JOIN product_categories pc ON p.category_id = pc.id " +
                "JOIN product_groups pg ON pc.group_id = pg.id " +
                "WHERE pg.groupName = ?";
        return query(sql, Product.class, groupName);
    }

    /**
     * TESTED
     * Retrieves a product along with its supplier information by its ID.
     */
    @Override
    public Product getProductByIdWithSupplierInfo(Integer productId) {
        try {
            String sql = "SELECT * FROM products WHERE id = ?";
            Product product = query(sql, Product.class, productId).get(0);
            Supplier supplier = SupplierService.getInstance().getSupplierById(product.getSupplier().getId());
            product.setSupplier(supplier);
            return product;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * TESTED
     * Updates a product in the database.
     */
    public boolean updateProduct(Integer id, String productName, Integer categoryId, Double percent,
                                 Integer price, Integer quantity, String purpose, String contraindications,
                                 String ingredients, String dosage, String instructions, String warrantyPeriod,
                                 String storageCondition, Integer typeId, Integer supplierId) {
        String sql = "UPDATE `products` SET productName =?, category_id =?, sale_percent =?, price =?, quantity =?, purpose =?, contraindications =?, ingredients =?, dosage =?, instructions =?, warrantyPeriod =?, storageCondition =?, type_id =?, supplier_id =? WHERE id =?";
        return update(sql, productName, categoryId, percent, price, quantity, purpose, contraindications, ingredients, dosage, instructions, warrantyPeriod, storageCondition, typeId, supplierId, id);
    }

    /**
     * TESTED
     * Deletes a product from the database by its ID.
     */
    public boolean deleteProductById(int productId) {
        String sql = "DELETE FROM products WHERE id = ?";
        return update(sql, productId);
    }

    /**
     * TESTED
     * Adds a new product to the database.
     */
    public Product addProduct(String productName, Integer categoryId, Double percent,
                              Integer price, Integer quantity, String purpose, String contraindications,
                              String ingredients, String dosage, String instructions, String warrantyPeriod,
                              String storageCondition, Integer typeId, Integer supplierId, Boolean active) {
        String sql = "INSERT INTO `products`(`productName`, `category_id`, `sale_percent`, `price`, `quantity`, `purpose`, `contraindications`, `ingredients`, `dosage`, `instructions`, `warrantyPeriod`, `storageCondition`, `type_id`, `supplier_id`, `active`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return insert(sql, Product.class, productName, categoryId, percent, price, quantity, purpose, contraindications, ingredients, dosage, instructions, warrantyPeriod, storageCondition, typeId, supplierId, active ? 1 : 0);
    }

    /**
     * TESTED
     * Retrieves a list of products that belong to a specific type, limited by the provided start and limit parameters.
     */
    public List<Product> getProductsLimit(Integer type_id, Integer limit) {
        String sql = "SELECT p.* FROM product_types pt" +
                "JOIN products p ON pt.id = p.type_id" +
                "WHERE p.type_id =? LIMIT ?";
        return query(sql, Product.class, type_id, limit);
    }
}