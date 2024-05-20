package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Role;
import vn.edu.hcmuaf.fit.model.User;

import java.sql.Timestamp;
import java.util.List;

public interface IUserDAO extends GenericDAO<User> {

    User signUp(String username, String email, String password);

    List<User> checkExistUser(String username, String email);

    User setVerified(Integer id);

    User updateUserInfo(String fullName, String birthday, String city, String district, String ward, String detailAddress, String phone, Integer id);

    User updatePassword(String newPass, Integer id);

    User addAdmin(String username, String email, String password, String phone);

    List<User> loadUsersWithRole(Integer roleId);

    List<User> loadUsersWithId(Integer id);

    Integer sumOfUsers();

    User updateUserInAdmin(Integer id, String email, String name, String birthday, String address, Timestamp dateCreated);

    User updateUserById(Integer id, String name, String phone, String email, String address);

    User deleteUserById(Integer userId);

}