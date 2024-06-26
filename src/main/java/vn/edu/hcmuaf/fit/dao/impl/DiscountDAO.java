package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IDiscountDAO;
import vn.edu.hcmuaf.fit.model.Discount;

import java.sql.Timestamp;
import java.util.List;

public class DiscountDAO extends AbsDAO<Discount> implements IDiscountDAO {
    private static IDiscountDAO instance;

    public static IDiscountDAO getInstance() {
        if (instance == null) {
            instance = new DiscountDAO();
        }
        return instance;
    }


    /**
     * TESTED
     * Retrieves all the coupons from the database.
     */
    @Override
    public List<Discount> getAllCoupons() {
        String sql = "SELECT * FROM discounts";
        return query(sql, Discount.class);
    }

    /**
     * TESTED
     * Retrieves a coupon from the database by its id.
     */
    @Override
    public List<Discount> getCouponById(Integer id) {
        String sql = "SELECT * FROM discounts WHERE id =?";
        return query(sql, Discount.class, id);
    }

    /**
     * TESTED
     * Retrieves a coupon from the database by its name.
     */
    @Override
    public List<Discount> getCouponByName(String name) {
        String sql = "SELECT * FROM discounts WHERE discountName =?";
        return query(sql, Discount.class, name);
    }

    /**
     * TESTED
     * Adds a new coupon to the database.
     */
    @Override
    public Discount addCoupon(String name, String des, Double percent, Integer quantity, Timestamp startDate, Timestamp dateEnd) {
        String sql = "INSERT INTO `discounts`(`discountName`, `description`, `sale_percent`, `quantity`, `startDate`, `expirationDate`) VALUES(?,?,?,?,?,?)";
        return insert(sql, Discount.class, name, des, percent, quantity, startDate, dateEnd);
    }

    /**
     * TESTED
     * Deletes a coupon from the database by its id.
     */
    @Override
    public boolean delCoupon(Integer id) {
        String sql = "DELETE FROM discounts WHERE id=?";
        return update(sql, id);
    }

    /**
     * TESTED
     * Edits a coupon in the database by its id.
     */
    @Override
    public boolean editCoupon(Integer id, String name, String des, Double percent, Integer quantity, Timestamp startDate, Timestamp dateEnd) {
        String sql = "UPDATE `discounts` SET `discountName`=?, `description`=?, `sale_percent`=?, `quantity`=?, `startDate`=?, `expirationDate`=? WHERE id =?";
        return update(sql, name, des, percent, quantity, startDate, dateEnd, id);
    }
}