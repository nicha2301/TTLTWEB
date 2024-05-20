package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.ProductCategories;

import java.util.List;
import java.util.Map;

public interface ICategoryService {

    List<ProductCategories> getCategories();

    Map<ProductCategories, Integer> getQuantityCategories();

    ProductCategories setCategoryStatus(ProductCategories cate, Boolean active, String ip, String address);

    ProductCategories getCategoryById(Integer id);

    ProductCategories editCategory(ProductCategories cate, String cateName, String ip, String address);

    ProductCategories addCategory(ProductCategories cate, String ip, String address);

}