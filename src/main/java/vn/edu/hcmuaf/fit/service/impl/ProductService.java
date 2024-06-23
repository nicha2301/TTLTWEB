package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.LevelDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.dao.impl.ProductDAO;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.IProductService;

import java.util.List;
import java.util.Map;

public class ProductService extends LogDAO<Product> implements IProductService {

    @Override
    public List<Product> getAllProducts() {
        return ProductDAO.getInstance().getAllProducts();
    }

    @Override
    public List<Product> getAllProductsLimited(Integer start, Integer limit) {
        return ProductDAO.getInstance().getAllProductsLimited(start, limit);
    }

    @Override
    public Integer getTotalProducts() {
        return ProductDAO.getInstance().getTotalProducts();
    }

    @Override
    public List<Product> searchProductsLimited(String searchTerm, Integer start, Integer pageSize) {
        return ProductDAO.getInstance().searchProductsLimited(searchTerm, start, pageSize);
    }

    @Override
    public Integer getTotalSearchResults(String searchTerm) {
        return ProductDAO.getInstance().getTotalSearchResults(searchTerm);
    }

    @Override
    public Map<String, Integer> getListObject() {
        return ProductDAO.getInstance().getListObject();
    }

    @Override
    public List<Product> getProductByCategory(String categoryName) {
        return ProductDAO.getInstance().getProductByCategory(categoryName);
    }

    @Override
    public List<Product> getProductByType(String productType) {
        return ProductDAO.getInstance().getProductByType(productType);
    }

    @Override
    public Map<String, Integer> getGroupListObject() {
        return ProductDAO.getInstance().getGroupListObject();
    }

    @Override
    public Map<String, Integer> getListProductType() {
        return ProductDAO.getInstance().getListProductType();
    }

    @Override
    public List<Product> getProductByGroup(String groupName) {
        return ProductDAO.getInstance().getProductByGroup(groupName);
    }

    @Override
    public Product getProductByIdWithSupplierInfo(Product p, String ip, String address) {
        try {
            Level level;
            Product success = ProductDAO.getInstance().getProductByIdWithSupplierInfo(p.getId());
            if(success!= null) {
                p.setAfterData("Get product with ID=" + p.getId() + " successfully");
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                p.setAfterData("Get product with ID=" + p.getId() + " failed");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(p, level, ip, address);
            return success;
        } catch (Exception e) {
            p.setAfterData("Get product with ID=" + p.getId() + " failed with " + e.getMessage());
            super.insert(p, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return null;
        }
    }

    @Override
    public List<Product> getProductsLimit(ProductTypes type, Integer limit) {
        return ProductDAO.getInstance().getProductsLimit(type.getId(), limit);
    }

    @Override
    public boolean updateProduct(Product p, String ip, String address) {
        try {
            Level level;
            p.setBeforeData("Old info of ID=" + p.getId() + " is " + p);
            boolean success = ProductDAO.getInstance().updateProduct(p.getId(), p.getProductName(), p.getCategories().getId(), p.getSalePercent(), p.getPrice(), p.getQuantity(),
                                                                        p.getPurpose(), p.getContraindications(), p.getIngredients(), p.getDosage(), p.getInstructions(), p.getWarrantyPeriod(), p.getStorageCondition(),
                                                                    p.getType().getId(), p.getSupplier().getId());
            if(success) {
                p.setAfterData("Update success with ID=" + p.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                p.setAfterData("Update fail with ID=" + p.getId());
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(p, level, ip, address);
            return success;
        } catch (Exception e) {
            p.setAfterData("Update fail with ID=" + p.getId() + " is " + p);
            super.insert(p, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return false;
        }
    }

    @Override
    public boolean deleteProductById(Product p, String ip, String address) {
        try {
            Level level;
            p.setBeforeData("Product info of ID=" + p.getId() + " is " + p + " before delete");
            boolean success = ProductDAO.getInstance().deleteProductById(p.getId());
            if(success) {
                level = LevelDAO.getInstance().getLevel(1).get(0);
                p.setAfterData("Product ID=" + p.getId() + " has been deleted");
            } else {
                level = LevelDAO.getInstance().getLevel(2).get(0);
                p.setAfterData("Delete failed with ID=" + p.getId());
            }
            super.insert(p, level, ip, address);
            return success;
        } catch (Exception e) {
            Product product = ProductDAO.getInstance().getProductByIdWithSupplierInfo(p.getId());
            p.setAfterData(e.getMessage() + " with ID=" + p.getId());
            super.insert(p, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            if(product == null) return true;
            else return false;
        }
    }

    @Override
    public Product addProduct(Product p, String ip, String address) {
        try {
            Level level;
            Product success = ProductDAO.getInstance().addProduct(p.getProductName(), p.getCategories().getId(), p.getSalePercent(), p.getPrice(), p.getQuantity(),
                                p.getPurpose(), p.getContraindications(), p.getIngredients(), p.getDosage(), p.getInstructions(), p.getWarrantyPeriod(), p.getStorageCondition(),
                        p.getType().getId(), p.getSupplier().getId(), p.getActive());
            if(success != null) {
                p.setAfterData("Add product success with ID=" + success.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                p.setAfterData("Add failed. New product isn't created in database");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(p, level, ip, address);
            return success;
        } catch (Exception e) {
            return null;
        }
    }
}
