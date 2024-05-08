package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.model.User;

import java.util.List;

public class UserService extends LogDAO<User> {
    private static UserService instance;

    public static UserService getInstance() {
        if (instance == null) {
            instance = new UserService();
        }
        return instance;
    }

    public User checkExistEmail(User user, String ip, String address) {
        try {
            List<User> users = UserDAO.getInstance().checkExistEmail(user.getEmail());
            Level level = new Level();
            if (users.size() != 1) {
                level.setId(2);
                user.setAfterData("Email not found: " + user.getEmail());
            } else {
                level.setId(1);
                user.setBeforeData("Existing email: " + user.getEmail());
                user.setAfterData("Matching email: " + user.getEmail());
            }
            super.insert(user, level, ip, address);
            return user;
        } catch (NullPointerException e) {
            return null;
        }
    }

    public static void main(String[] args) {
        String ip = "localhost";
        String address = "UserDAO";

        User user = new User();
        user.setEmail("thuandangnam@gmail.com");
        System.out.println(UserService.getInstance().checkExistEmail(user, ip, address));

        User user1 = new User();
        user1.setEmail("thuandangnam123@gmail.com");
        System.out.println(UserService.getInstance().checkExistEmail(user1, ip, address));
    }
}