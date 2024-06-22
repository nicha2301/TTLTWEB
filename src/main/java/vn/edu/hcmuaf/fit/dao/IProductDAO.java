package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Product;

import java.util.List;
import java.util.Map;

public interface IProductDAO extends GenericDAO<Product> {

    List<Product> getAllProducts();

    List<Product> getAllProductsLimited(Integer start, Integer limit);

    Integer getTotalProducts();

    List<Product> searchProductsLimited(String searchTerm, Integer start, Integer pageSize);

    Integer getTotalSearchResults(String searchTerm);

    Map<String, Integer> getListObject();

    List<Product> getProductByCategory(String categoryName);

    List<Product> getProductByType(String productType);

    Map<String, Integer> getGroupListObject();

    Map<String, Integer> getListProductType();

    List<Product> getProductByGroup(String groupName);

    Product getProductByIdWithSupplierInfo(Integer productId);

    Product updateProduct(Integer id, String productName, Integer categoryId, Double percent,
                          Integer price, Integer quantity, String purpose, String contraindications,
                          String ingredients, String dosage, String instructions, String warrantyPeriod,
                          String storageCondition, Integer typeId, Integer supplierId);

    boolean deleteProductById(int productId);

    public Product addProduct(String productName, Integer categoryId, Double percent,
                              Integer price, Integer quantity, String purpose, String contraindications,
                              String ingredients, String dosage, String instructions, String warrantyPeriod,
                              String storageCondition, Integer typeId, Integer supplierId, Boolean active);

    List<Product> getProductsLimit(Integer type_id, Integer limit);

}