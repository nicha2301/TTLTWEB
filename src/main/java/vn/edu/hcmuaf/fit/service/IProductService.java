package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.ProductTypes;

import java.util.List;
import java.util.Map;

public interface IProductService {

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

    Product getProductByIdWithSupplierInfo(Product p, String ip, String address);

    List<Product> getProductsLimit(ProductTypes type, Integer limit);

    boolean updateProduct(Product p, String ip, String address);

    boolean deleteProductById(Product p, String ip, String address);

    public Product addProduct(Product p, String ip, String address);

}
