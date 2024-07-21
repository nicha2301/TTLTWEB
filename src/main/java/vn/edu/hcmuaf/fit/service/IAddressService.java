package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Address;
import vn.edu.hcmuaf.fit.model.Supplier;

import java.util.List;

public interface IAddressService {

    List<Address> loadAddress();

    boolean updateAddress(Address pageAddress, String ip, String address);

    Address getAddressById(Integer id);

    Address insertAddress(Address address1, String ip, String address);
    boolean deleteAddress(Address address1, String ip, String address);
    void setMainAddress(int id);

    void clearMainAddress();

}
