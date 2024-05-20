package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.ProductCategories;

import java.util.List;
import java.util.Map;

public interface ICategoryDAO extends GenericDAO<ProductCategories> {

    List<ProductCategories> getCategories();

    Map<ProductCategories, Integer> getQuantityCategories();

    List<ProductCategories> getCategoryById(Integer id);

    ProductCategories setActive(Integer id, Boolean active);

    ProductCategories editCategory(Integer id, String cateName);

    ProductCategories addCategory(String cateName, Integer groupId);
}