package vn.edu.hcmuaf.fit.service.impl;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.impl.LevelDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.model.Utils;
import vn.edu.hcmuaf.fit.service.IUserService;

import java.util.List;

public class UserService extends LogDAO<User> implements IUserService {
    private static IUserService instance;

    public static IUserService getInstance() {
        if (instance == null) {
            instance = new UserService();
        }
        return instance;
    }

    @Override
    public User signIn(User user, String ip, String address) {
        try {
            List<User> users = UserDAO.getInstance().checkExistUser(user.getUsername(), null);
            if (users.size()==1) {
                if(BCrypt.checkpw(user.getPassword(), users.get(0).getPassword())) {
                    user.setAfterData("Login success with ID=" + users.get(0).getId());
                } else {
                    user.setAfterData("Login fail with ID=" + users.get(0).getId());
                    users.clear();
                }
            } else {
                user.setAfterData("Login fail with the invalid username: " + user.getUsername());
                users.clear();
            }
            super.insert(user, LevelDAO.getInstance().getLevel(1).get(0), ip, address);
            return users.get(0);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * The method is used to check login with the username and password
     * The verified status and the role id are returned to servlet login to split view
     */
//    @Override
//    public User signIn(User user, String ip, String address) {
//        try {
//            List<User> users = UserDAO.getInstance().checkExistUser(user.getUsername(), null);
//            int count = 0;
//            User result = null;
//            if(!users.isEmpty()) {
//                for (User u : users) {
//                    if (BCrypt.checkpw(user.getPassword(), u.getPassword())) {
//                        user.setAfterData("Login successfully with ID=" + u.getId());
//                        result = u;
//                        break;
//                    } else {
//                        if(++count==users.size()) user.setAfterData("Login failed with username: " + user.getUsername());
//                    }
//                }
//            } else {
//                user.setAfterData("Not valid username: " + user.getUsername());
//            }
//            super.insert(user, LevelDAO.getInstance().getLevel(1).get(0), ip, address);
//            return result;
//        } catch (Exception e) {
//            return null;
//        }
//    }

    // check dung dinh dang email
    @Override
    public String signUp(User user, String rePassword, String ip, String address) {
        try {
            String error = "";
            User success = null;
            List<User> users = UserDAO.getInstance().checkExistUser(user.getUsername(), null);
            if(users.isEmpty()) {
                if(Utils.isValidEmail(user.getEmail())) {
                    users = UserDAO.getInstance().checkExistUser(null, user.getEmail());
                    if(users.isEmpty()) {
                        if(Utils.isStrongPassword(user.getPassword())) {
                            if(user.getPassword().equals(rePassword)) {
                                success = UserDAO.getInstance().signUp(user.getUsername(), user.getEmail(), user.getPassword());
                                if(success == null) error = "Register fail because my system can't insert your account into database!";
                            } else {
                                error = "Passwords do not match!";
                            }
                        } else {
                            error = "Password must have at least 8 characters, including numbers, capital letters and special characters!";
                        }
                    } else {
                        error = "Email is existed!";
                    }
                } else {
                    error = "Email is invalid!";
                }
            } else {
                error = "Username is existed!";
            }
            if(error.isEmpty()) user.setAfterData(success.getId() + ": Register success. Congratulation!");
            else user.setAfterData(user.getUsername() + ": " + error);
            super.insert(user, LevelDAO.getInstance().getLevel(1).get(0), ip, address);
            return error;
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    @Override
    public String setVerified(User user, String code, String authCode, String ip, String address) {
        try {
            String error = "";
            if(authCode != null) {
                if (code.equals(authCode)) {
                    User success = UserDAO.getInstance().setVerified(user.getId());
                    if(success == null) error = "Set verified status failed for your account";
                } else {
                    error = "Verified code do not match!";
                }
            } else {
                error = "Verified code is timeout!";
            }
            if(error.isEmpty()) user.setAfterData(user.getId() + ": Your account has verified successfully. Congratulation!");
            else user.setAfterData(user.getId() + ": " + error);
            super.insert(user, LevelDAO.getInstance().getLevel(1).get(0), ip, address);
            return error;
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    @Override
    public User updateUserInfo(User user, String fullName, String birthday, String city, String district, String ward, String detail_address, String phone, String ip, String address) {
        try {
            user.setBeforeData("Old user info of ID=" + user.getId() + " is " + user);
            User success = UserDAO.getInstance().updateUserInfo(fullName, birthday, city, district, ward, detail_address, phone, user.getId());
            user.setAfterData("Update successfully! New user info of ID=" + success.getId() + " is " + success);
            super.insert(user, LevelDAO.getInstance().getLevel(1).get(0), ip, address);
            return success;
        } catch (Exception e) {
            user.setAfterData("Update failed! New user info of ID=" + user.getId() + " don't change!");
            super.insert(user, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return null;
        }
    }

    @Override
    public User addAdmin(User user, String ip, String address) {
        try {
            User success = UserDAO.getInstance().addAdmin(user.getUsername(), user.getEmail(), user.getPassword(), user.getPhone());
            user.setAfterData("Add admin successfully! New admin with ID=" + success.getId());
            super.insert(user, LevelDAO.getInstance().getLevel(1).get(0), ip, address);
            return success;
        } catch (Exception e) {
            user.setAfterData("Add admin failed! No admin is created!");
            super.insert(user, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return null;
        }
    }

    @Override
    public User updatePassword(User user, String newPass, String ip, String address) {
        try {
            user.setBeforeData("Old password of ID=" + user.getId() + " is " + user.getPassword());
            User success = UserDAO.getInstance().updatePassword(newPass, user.getId());
            user.setAfterData("Update password successfully! New password of ID=" + success.getId() + " is " + success.getPassword());
            super.insert(user, LevelDAO.getInstance().getLevel(1).get(0), ip, address);
            return success;
        } catch (Exception e) {
            user.setAfterData("Update failed! New password of ID=" + user.getId() + " is " + user.getId() + "'s old password!");
            super.insert(user, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return user;
        }
    }
}