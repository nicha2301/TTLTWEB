package vn.edu.hcmuaf.fit.dao.impl;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.IUserDAO;
import vn.edu.hcmuaf.fit.model.Role;
import vn.edu.hcmuaf.fit.model.User;

import java.sql.Timestamp;
import java.util.List;

public class UserDAO extends AbsDAO<User> implements IUserDAO {
    private static IUserDAO instance;

    public static IUserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    @Override
    public User signUp(String username, String email, String password) {
        String sql = "INSERT INTO users(username, email, password, verified) VALUES (?, ?, ?, ?)";
        return modify(sql, User.class, username, email, BCrypt.hashpw(password, BCrypt.gensalt()));
    }

    @Override
    public User setVerified(Integer id) {
        String sql = "UPDATE users SET verified = 1 WHERE id = ?";
        return modify(sql, User.class, id);
    }

    @Override
    public User updateUserInfo(String fullName, String birthday, String city, String district, String ward, String detailAddress, String phone, Integer id) {
        String sql = "UPDATE users SET fullName = ?, dateOfBirth = DATE(?), city = ?, district = ?, ward = ?, detail_address = ?, phone = ? WHERE id = ?";
        return modify(sql, User.class, fullName, birthday, city, district, ward, detailAddress, phone, id);
    }

    @Override
    public List<User> checkExistUser(String username, String email) {
        String sql = "SELECT * FROM users WHERE username = COALESCE(?, username) OR email = COALESCE(?, email)";
        return query(sql, User.class, username, email);
    }

    @Override
    public User updatePassword(String newPass, Integer id) {
        String sql = "UPDATE users SET password =? WHERE id =?";
        return modify(sql, User.class, BCrypt.hashpw(newPass, BCrypt.gensalt()), id);
    }

    @Override
    public User addAdmin(String username, String email, String password, String phone) {
        String sql = "INSERT INTO users(username, email, password, phone, verified, role_id) VALUES (?, ?, ?, ?, ?, ?)";
        return modify(sql, User.class, username, email, BCrypt.hashpw(password, BCrypt.gensalt()), phone, 1, 2);
    }

    @Override
    public List<User> loadUsersWithRole(Integer roleId) {
        String sql = "SELECT * FROM users WHERE role_id =?";
        return query(sql, User.class, roleId);
    }

    @Override
    public List<User> loadUsersWithId(Integer id) {
        String sql = "SELECT * FROM users WHERE id =?";
        return query(sql, User.class, id);
    }

    @Override
    public Integer sumOfUsers() {
        String sql = "SELECT COUNT(*) FROM users";
        return count(sql);
    }

    @Override
    public User updateUserInAdmin(Integer id, String email, String name, String birthday, String address, Timestamp dateCreated) {
        String sql = "UPDATE users SET email = ?, fullName = ?, dateOfBirth = ?, detail_address = ?, date_created = ? WHERE id = ?";
        return modify(sql, User.class, email, name, birthday, address, dateCreated, id);
    }

    @Override
    public User updateUserById(Integer id, String name, String phone, String email, String address) {
        String sql = "UPDATE users SET fullName = ?, phone = ?, email = ?, detail_address = ? WHERE id = ?";
        return modify(sql, User.class, name, phone, email, address, id);
    }

    @Override
    public User deleteUserById(Integer userId) {
        String sql = "DELETE FROM users WHERE id =?";
        return modify(sql, User.class, userId);
    }
}