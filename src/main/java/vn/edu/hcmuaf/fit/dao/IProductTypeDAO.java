package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.ProductTypes;

import java.util.List;

public interface IProductTypeDAO extends GenericDAO<ProductTypes> {

    List<ProductTypes> loadProductType();

    Integer sumOfProductType();

    List<ProductTypes> getProductTypeById(Integer id);

    ProductTypes insertProductTypes(String name, String detail_address, String phone, String email);

    boolean updateProductTypes(Integer id, String name, String email, String phone, String detailAddress);

    boolean deleteProductTypes(Integer id);
}
