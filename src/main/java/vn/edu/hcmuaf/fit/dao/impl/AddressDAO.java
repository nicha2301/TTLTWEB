package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IAddressDAO;
import vn.edu.hcmuaf.fit.model.Address;

import java.util.List;

public class AddressDAO extends AbsDAO<Address> implements IAddressDAO {
    private static IAddressDAO instance;

    public static IAddressDAO getInstance() {
        if (instance == null) {
            instance = new AddressDAO();
        }
        return instance;
    }

    @Override
    public List<Address> loadAddress() {
        String sql = "SELECT * FROM address";
        return query(sql, Address.class);
    }

    @Override
    public boolean updateAddress(String address, String phone, String hotline, String email, String timeOpen, String map) {
        String sql = "UPDATE address SET address=?, phone=?, hotline=?, email=?, timeOpen=?, map=? WHERE id=1";
        return update(sql, address, phone, hotline, email, timeOpen, map);
    }

    public static void main(String[] args) {

    }
}