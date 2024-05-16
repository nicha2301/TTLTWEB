package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.User;

import java.util.List;

public interface IUserDAO extends GenericDAO<User> {

    User signUp(String username, String email, String password);

    List<User> checkExistUser(String username, String email);

    User setVerified(Integer id);

    User updateUserInfo(String fullName, String birthday, String city, String district, String ward, String detailAddress, String phone, Integer id);

    User updatePassword(String newPass, Integer id);

    User addAdmin(String username, String email, String password, String phone);
}