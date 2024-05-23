package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.LevelDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.dao.impl.SupplierDAO;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.model.Supplier;
import vn.edu.hcmuaf.fit.service.ISupplierService;

import java.util.List;

public class SupplierService extends LogDAO<Supplier> implements ISupplierService {

    @Override
    public Supplier getSupplierById(Integer id) {
        try {
            return SupplierDAO.getInstance().getSupplierById(id).get(0);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Supplier> getSuppliers() {
        return SupplierDAO.getInstance().loadSupplierList();
    }

    @Override
    public Integer sumOfSupplier() {
        return SupplierDAO.getInstance().sumOfSupplier();
    }

    @Override
    public Supplier insertSupplier(Supplier supplier, String ip, String address) {
        try {
            Level level;
            Supplier success = SupplierDAO.getInstance().insertSupplier(supplier.getSupplierName(), supplier.getDetailAddress(), supplier.getPhone(), supplier.getEmail());
            if(success != null) {
                supplier.setAfterData("Add successfully with ID=" + success.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                supplier.setAfterData("Add failed. New supplier isn't created in database");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(supplier, level, ip, address);
            return success;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Supplier updateSupplier(Supplier supplier, String name, String email, String phone, String detailAddress, String ip, String address) {
        try {
            Level level;
            supplier.setBeforeData("Old info of ID=" + supplier.getId() + " is " + supplier);
            Supplier success = SupplierDAO.getInstance().updateSupplier(supplier.getId(), supplier.getSupplierName(), supplier.getEmail(), supplier.getPhone(), supplier.getDetailAddress());
            if(success != null) {
                supplier.setAfterData("New info of ID=" + success.getId() + " is " + success);
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                supplier.setAfterData("New info of ID=" + supplier.getId() + " is the old info");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(supplier, level, ip, address);
            return success;
        } catch (Exception e) {
            supplier.setAfterData("New info of ID=" + supplier.getId() + " is " + supplier);
            super.insert(supplier, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return null;
        }
    }

    @Override
    public boolean deleteSupplier(Supplier supplier, String ip, String address) {
        try {
            Level level;
            boolean re = false;
            supplier.setBeforeData("Supplier info of ID=" + supplier.getId() + " is " + supplier + " before delete");
            Supplier success = SupplierDAO.getInstance().deleteSupplier(supplier.getId());
            if(success==null) {
                level = LevelDAO.getInstance().getLevel(1).get(0);
                supplier.setAfterData("Supplier with ID=" + supplier.getId() + " has been deleted");
                re = true;
            } else {
                level = LevelDAO.getInstance().getLevel(2).get(0);
                supplier.setAfterData("Delete failed with ID=" + supplier.getId());
            }
            super.insert(supplier, level, ip, address);
            return re;
        } catch (Exception e) {
            List<Supplier> list = SupplierDAO.getInstance().getSupplierById(supplier.getId());
            supplier.setAfterData(e.getMessage() + " with ID=" + supplier.getId());
            super.insert(supplier, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            if(list.isEmpty()) return true;
            else return false;
        }
    }
}