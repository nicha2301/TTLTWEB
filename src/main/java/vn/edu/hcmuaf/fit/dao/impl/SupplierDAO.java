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

    /**
     * TESTED
     * Loads a list of all suppliers from the database.
     */
    @Override
    public List<Supplier> loadSupplierList() {
        String sql = "SELECT * FROM suppliers";
        return query(sql, Supplier.class);
    }

    /**
     * TESTED
     * Counts the total number of suppliers in the database.=
     */
    @Override
    public Integer sumOfSupplier() {
        String sql = "SELECT COUNT(*) FROM suppliers";
        return count(sql);
    }

    /**
     * TESTED
     * Retrieves a list of suppliers based on the provided supplier id.
     */
    @Override
    public List<Supplier> getSupplierById(Integer id) {
        String sql = "SELECT * FROM suppliers WHERE id =?";
        return query(sql, Supplier.class, id);
    }

    /**
     * TESTED
     * Inserts a new supplier into the database.
     */
    @Override
    public Supplier insertSupplier(String name, String detail_address, String phone, String email) {
        String sql = "INSERT INTO suppliers (supplierName, detail_address, phone, email, active) VALUES(?,?,?,?,0)";
        return insert(sql, Supplier.class, name, detail_address, phone, email);
    }

    /**
     * TESTED
     * Updates a supplier in the database.
     */
    @Override
    public boolean updateSupplier(Integer id, String name, String email, String phone, String detailAddress) {
        String sql = "UPDATE suppliers SET supplierName=?, email=?, phone=?, detail_address=? WHERE id=?";
        return update(sql, name, email, phone, detailAddress, id);
    }

    /**
     * TESTED
     * Deletes a supplier from the database based on the provided supplier id.=
     */
    @Override
    public boolean deleteSupplier(Integer id) {
        String sql = "DELETE FROM suppliers WHERE id=?";
        return update(sql, id);
    }
}