package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Product;

import java.util.List;
import java.util.Map;

public interface IProductDAO extends GenericDAO<Product> {

    List<Product> getAllProducts();

    List<Product> getAllProductsLimited(Integer start, Integer limit);

    Integer getTotalProducts();

    List<Product> getProductById(Integer productId);

    List<Product> searchProductsLimited(String searchTerm, Integer start, Integer pageSize);

    Integer getTotalSearchResults(String searchTerm);

    Map<String, Integer> getListObject();

    List<Product> getProductByCategory(String object);

    List<Product> getProductByType(String productType);

    Map<String, Integer> getGroupListObject();

    Map<String, Integer> getListProductType();

    List<Product> getProductByGroup(String groupName);

    Product updateImgUrl(Integer id, String imgUrl);

    List<Product> getProductByIdWithSupplierInfo(Integer productId);

    Integer sumOfProduct();

    List<Product> loadProductById(Integer id);

    Product updateProduct(int id, String productName, int categoryId, double price, int quantity,
                         String purpose, String contraindications, int stockQuantity, String ingredients, String dosage,
                         String instructions, String warrantyPeriod, String storageCondition, String productType,
                         int supplierId);

    Product deleteProductById(int productId);

    Product addProduct(Product product);

    List<Product> getThreePoultryProducts();

    List<Product> getThreeOtherProducts();


}
