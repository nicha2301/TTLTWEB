package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Address;

public interface IAddressService {

    Address loadAddress();

    boolean updateAddress(Address pageAddress, String ip, String address);
}
