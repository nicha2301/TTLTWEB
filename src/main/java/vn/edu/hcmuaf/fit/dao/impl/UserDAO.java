package vn.edu.hcmuaf.fit.dao.impl;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.IUserDAO;
import vn.edu.hcmuaf.fit.model.User;

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
}