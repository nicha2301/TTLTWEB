package vn.edu.hcmuaf.fit.dao.impl;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.IUserDAO;
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

    /**
     * TESTED
     * Signs up a new user in the database
     *
     */
    @Override
    public User signUp(String username, String email, String password, Integer role) {
        String sql = "INSERT INTO users(username, email, password, role_id) VALUES (?, ?, ?, ?)";
        return insert(sql, User.class, username, email, BCrypt.hashpw(password, BCrypt.gensalt()), role);
    }

    /**
     * TESTED
     * Updates the verified status of a user in the database.
     */
    @Override
    public boolean setVerified(Integer id) {
        String sql = "UPDATE users SET verified = 1 WHERE id = ? AND verified <> 1";
        return update(sql, id);
    }

    @Override
    public boolean updateLoginFail(String email, Integer times) {
        String sql = "UPDATE users SET login_times =?, verified =? WHERE email =?";
        if (times < 5) return update(sql, email, times, 1);
        else return update(sql, email, 5, 0);
    }

    @Override
    public boolean resetLoginTimes(String email) {
        String sql = "UPDATE users SET login_times = 0 WHERE email =?";
        return update(sql, email);
    }

    /**
     * TESTED
     * Updates the user's information in the database.
     */
    @Override
    public User updateUserInfo(String fullName, String birthday, String city, String district, String ward, String detailAddress, String phone, Integer id) {
        String sql = "UPDATE users SET fullName = ?, dateOfBirth = DATE(?), city = ?, district = ?, ward = ?, detail_address = ?, phone = ? WHERE id = ?";
        return insert(sql, User.class, fullName, birthday, city, district, ward, detailAddress, phone, id);
    }

    /**
     * #TESTED
     * Checks if a user with the given username or email already exists in the database.
     */
    @Override
    public List<User> checkExistUser(String username, String email) {
        String sql = "SELECT * FROM users WHERE username = ? OR email = ?";
        return query(sql, User.class, username, email);
    }

    /**
     * TESTED
     * Updates the user's password in the database.
     */
    @Override
    public User updatePassword(String newPass, Integer id) {
        String sql = "UPDATE users SET password =? WHERE id =?";
        return insert(sql, User.class, BCrypt.hashpw(newPass, BCrypt.gensalt()), id);
    }

    @Override
    public User addAdmin(String username, String email, String password, String phone) {
        String sql = "INSERT INTO users(username, email, password, phone, verified, role_id) VALUES (?, ?, ?, ?, ?, ?)";
        return insert(sql, User.class, username, email, BCrypt.hashpw(password, BCrypt.gensalt()), phone, 1, 2);
    }

    @Override
    public List<User> loadUsersWithRole(Integer roleId) {
        String sql = "SELECT * FROM users WHERE role_id =?";
        return query(sql, User.class, roleId);
    }

    /**
     * TESTED
     * Loads a user with the given id from the database.
     */
    @Override
    public List<User> loadUsersWithId(Integer id) {
        String sql = "SELECT * FROM users WHERE id =?";
        return query(sql, User.class, id);
    }

    /**
     * TESTED
     * Counts the total number of users in the database.
     */
    @Override
    public Integer sumOfUsers() {
        String sql = "SELECT COUNT(*) FROM users";
        return count(sql);
    }

    @Override
    public User updateUserInAdmin(Integer id, String email, String name, String birthday, String address, Timestamp dateCreated) {
        String sql = "UPDATE users SET email = ?, fullName = ?, dateOfBirth = ?, detail_address = ?, date_created = ? WHERE id = ?";
        return insert(sql, User.class, email, name, birthday, address, dateCreated, id);
    }

    /**
     * TESTED
     * Updates the user's information in the database.
     */
    @Override
    public User updateUserById(Integer id, String name, String phone, String email, String address) {
        String sql = "UPDATE users SET fullName = ?, phone = ?, email = ?, detail_address = ? WHERE id = ?";
        return insert(sql, User.class, name, phone, email, address, id);
    }

    /**
     * TESTED
     * Deletes a user from the database by their id.
     */
    @Override
    public User deleteUserById(Integer userId) {
        String sql = "DELETE FROM users WHERE id =?";
        return insert(sql, User.class, userId);
    }

    public static void main(String[] args) {
        System.out.println(UserDAO.getInstance().checkExistUser("", "thuandangnam@gmail.com"));
        System.out.println(UserDAO.getInstance().signUp("thuandeptrai999", "thuandangnam000@gmail.com", "Thuan23042003=", 1));
    }
}