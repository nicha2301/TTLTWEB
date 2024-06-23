package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Discount;

import java.sql.Timestamp;
import java.util.List;

public interface IDiscountDAO extends GenericDAO<Discount> {

    List<Discount> getAllCoupons();

    List<Discount> getCouponById(Integer id);

    List<Discount> getCouponByName(String name);

    Discount addCoupon(String name, String des, Double percent, Integer quantity, Timestamp startDate, Timestamp dateEnd);

    boolean delCoupon(Integer id);

    boolean editCoupon(Integer id, String name, String des, Double percent, Integer quantity, Timestamp startDate, Timestamp dateEnd);
}
