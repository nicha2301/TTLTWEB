package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.DiscountDAO;
import vn.edu.hcmuaf.fit.dao.impl.LevelDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.model.Discount;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.service.IDiscountService;

import java.sql.Timestamp;
import java.util.List;

public class DiscountService extends LogDAO<Discount> implements IDiscountService {

    @Override
    public List<Discount> getAllCoupons() {
        return DiscountDAO.getInstance().getAllCoupons();
    }

    @Override
    public Discount getCouponById(Integer id) {
        return DiscountDAO.getInstance().getCouponById(id).get(0);
    }

    @Override
    public Discount getCouponByName(String name) {
        return DiscountDAO.getInstance().getCouponByName(name).get(0);
    }

    @Override
    public Discount addCoupon(Discount coupon, String ip, String address) {
        try {
            Level level;
            Discount success = DiscountDAO.getInstance().addCoupon(coupon.getDiscountName(), coupon.getDescription(), coupon.getSalePercent(), coupon.getQuantity(), coupon.getStartDate(), coupon.getExpirationDate());
            if(success != null) {
                coupon.setAfterData("Add coupon successful with ID=" + success.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                coupon.setAfterData("Add failed. New coupon isn't created in database");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(coupon, level, ip, address);
            return success;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public boolean delCoupon(Discount coupon, String ip, String address) {
        try {
            Level level;
            coupon.setBeforeData("Coupon info of ID=" + coupon.getId() + " is " + coupon + " before delete");
            boolean success = DiscountDAO.getInstance().delCoupon(coupon.getId());
            if(success) {
                level = LevelDAO.getInstance().getLevel(1).get(0);
                coupon.setAfterData("Coupon with ID=" + coupon.getId() + " has been deleted");
            } else {
                level = LevelDAO.getInstance().getLevel(2).get(0);
                coupon.setAfterData("Delete coupon failed with ID=" + coupon.getId());
            }
            super.insert(coupon, level, ip, address);
            return success;
        } catch (Exception e) {
            List<Discount> list = DiscountDAO.getInstance().getCouponById(coupon.getId());
            coupon.setAfterData(e.getMessage() + " with ID=" + coupon.getId());
            super.insert(coupon, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            if(list.isEmpty()) return true;
            else return false;
        }
    }

    @Override
    public boolean editCoupon(Discount coupon, String ip, String address) {
        try {
            Level level;
            coupon.setBeforeData("Old info coupon ID=" + coupon.getId() + " is " + coupon);
            boolean success = DiscountDAO.getInstance().editCoupon(coupon.getId(), coupon.getDiscountName(), coupon.getDescription(), coupon.getSalePercent(), coupon.getQuantity(), coupon.getStartDate(), coupon.getExpirationDate());
            if(success) {
                coupon.setAfterData("New info coupon ID=" + coupon.getId() + " is " + success);
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                coupon.setAfterData("New info coupon ID=" + coupon.getId() + " is the old info");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(coupon, level, ip, address);
            return success;
        } catch (Exception e) {
            coupon.setAfterData("New info coupon ID=" + coupon.getId() + " is " + coupon);
            super.insert(coupon, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return false;
        }
    }
}