package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IDiscountDAO;
import vn.edu.hcmuaf.fit.model.Discount;

public class DiscountDAO extends AbsDAO<Discount> implements IDiscountDAO {
    private static IDiscountDAO instance;

    public IDiscountDAO getInstance() {
        if (instance == null) {
            instance = new DiscountDAO();
        }
        return instance;
    }



}