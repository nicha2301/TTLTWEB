package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.ISupplierDAO;
import vn.edu.hcmuaf.fit.model.Supplier;

import java.util.List;

public class SupplierDAO extends AbsDAO<Supplier> implements ISupplierDAO {
    private static ISupplierDAO instance;

    public static ISupplierDAO getInstance() {
        if (instance == null) {
            instance = new SupplierDAO();
        }
        return instance;
    }

    @Override
    public List<Supplier> loadSupplierList() {
        String sql = "SELECT * FROM suppliers";
        return query(sql, Supplier.class);
    }

    @Override
    public Integer sumOfSupplier() {
        String sql = "SELECT COUNT(*) FROM suppliers";
        return count(sql);
    }

    @Override
    public List<Supplier> getSupplierById(Integer id) {
        String sql = "SELECT * FROM suppliers WHERE id =?";
        return query(sql, Supplier.class, id);
    }

    @Override
    public Supplier insertSupplier(String name, String detail_address, String phone, String email) {
        String sql = "INSERT INTO suppliers (supplierName, detail_address, phone, email) VALUES(?,?,?,?)";
        return insert(sql, Supplier.class, name, detail_address, phone, email);
    }

    @Override
    public Supplier updateSupplier(Integer id, String name, String email, String phone, String detailAddress) {
        String sql = "UPDATE suppliers SET supplierName=?,  email=?, phone=?, detail_address=? WHERE id=?";
        return insert(sql, Supplier.class, name, email, phone, detailAddress, id);
    }

    @Override
    public Supplier deleteSupplier(Integer id) {
        String sql = "DELETE FROM suppliers WHERE id=?";
        return insert(sql, Supplier.class,id);
    }
}