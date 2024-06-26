package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Address;

import java.util.List;

public interface IAddressDAO extends GenericDAO<Address>{

    List<Address> loadAddress();

    boolean updateAddress(String address, String phone, String hotline, String email, String timeOpen, String map);
}