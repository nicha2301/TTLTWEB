package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Supplier;

import java.util.List;

public interface ISupplierDAO extends GenericDAO<Supplier> {

    List<Supplier> loadSupplierList();

    Integer sumOfSupplier();

    List<Supplier> getSupplierById(Integer id);

    Supplier insertSupplier(String name, String detail_address, String phone, String email);

    boolean updateSupplier(Integer id, String name, String email, String phone, String detailAddress);

    boolean deleteSupplier(Integer id);
}