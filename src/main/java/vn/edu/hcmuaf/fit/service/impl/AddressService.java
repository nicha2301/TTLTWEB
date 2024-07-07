package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.AddressDAO;
import vn.edu.hcmuaf.fit.dao.impl.LevelDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.model.Address;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.service.IAddressService;
import vn.edu.hcmuaf.fit.service.IOrderService;

import java.util.List;

public class AddressService extends LogDAO<Address> implements IAddressService {
    private static IOrderService instance;

    public static IOrderService getInstance() {
        if (instance == null) {
            instance = new OrderService();
        }
        return instance;
    }


    @Override
    public List<Address> loadAddress() {
        return AddressDAO.getInstance().loadAddress();
    }

    @Override
    public boolean updateAddress(Address pageAddress, String ip, String address) {
        try {
            Level level;
            pageAddress.setBeforeData("Old info of web address is " + pageAddress);
            boolean success = AddressDAO.getInstance().updateAddress(pageAddress.getAddress(), pageAddress.getPhone(), pageAddress.getHotline(), pageAddress.getEmail(), pageAddress.getTimeOpen(), pageAddress.getMap());
            if(success) {
                pageAddress.setAfterData("New info of address is update");
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                pageAddress.setAfterData("New info of address isn't updated!");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(pageAddress, level, ip, address);
            return success;
        } catch (Exception e) {
            pageAddress.setBeforeData("New info of web address is " + pageAddress);
            super.insert(pageAddress, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return false;
        }
    }
}