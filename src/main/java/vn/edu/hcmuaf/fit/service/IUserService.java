package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.User;

public interface IUserService {

//    User checkExistUser(User user, String ip, String address);

    User signIn(User user, String ip, String address);

    String signUp(User user, String rePassword, String ip, String address);

    String setVerified(User user, String code, String authCode, String ip, String address);

    User updatePassword(User user, String newPass, String ip, String address);

    User updateUserInfo(User user, String fullName, String birthday, String city, String district, String ward, String detail_address, String phone, String ip, String address);

    User addAdmin(User user, String ip, String address);

}