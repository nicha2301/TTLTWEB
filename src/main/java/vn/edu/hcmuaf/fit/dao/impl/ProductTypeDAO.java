package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IProductTypeDAO;
import vn.edu.hcmuaf.fit.model.ProductTypes;

import java.util.List;

public class ProductTypeDAO extends AbsDAO<ProductTypes> implements IProductTypeDAO {

    @Override
    public List<ProductTypes> loadProductType() {
        return List.of();
    }

    @Override
    public Integer sumOfProductType() {
        return 0;
    }

    @Override
    public List<ProductTypes> getProductTypeById(Integer id) {
        return List.of();
    }

    @Override
    public ProductTypes insertProductTypes(String name, String detail_address, String phone, String email) {
        return null;
    }

    @Override
    public boolean updateProductTypes(Integer id, String name, String email, String phone, String detailAddress) {
        return false;
    }

    @Override
    public boolean deleteProductTypes(Integer id) {
        return false;
    }
}