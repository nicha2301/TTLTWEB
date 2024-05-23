package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Discount;

import java.util.List;

public interface IDiscountService {

    List<Discount> getAllCoupons();

    Discount getCouponById(Integer id);

    Discount getCouponByName(String name);

    Discount addCoupon(Discount coupon, String ip, String address);

    boolean delCoupon(Discount coupon, String ip, String address);

    Discount editCoupon(Discount coupon, String ip, String address);

}