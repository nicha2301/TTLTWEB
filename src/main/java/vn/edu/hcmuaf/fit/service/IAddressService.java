package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Address;

import java.util.List;

public interface IAddressService {

    List<Address> loadAddress();

    boolean updateAddress(Address pageAddress, String ip, String address);
}
