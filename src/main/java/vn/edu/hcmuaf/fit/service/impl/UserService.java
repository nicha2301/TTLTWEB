package vn.edu.hcmuaf.fit.service.impl;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.impl.LevelDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.model.Role;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.model.Utils;
import vn.edu.hcmuaf.fit.service.IUserService;

import java.sql.Timestamp;
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
    public User chkUsrByNameOrEmail(String username, String email) {
        try {
            List<User> users = UserDAO.getInstance().checkExistUser(username, email);
            if (users.size() != 1) users.clear();
            return users.get(0);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * TESTED
     * This method is used to check login with the username and password.
     * The verified status and the role id are returned to servlet login to split view.
     *
     * @param user    The User object containing the username and password for login.
     * @param ip      The IP address of the client making the request.
     * @param address The address of the client making the request.
     * @return The User object with the verified status and role id, or null if an error occurs.
     */
    @Override
    public User signIn(User user, String ip, String address) {
        try {
            List<User> users = UserDAO.getInstance().checkExistUser("", user.getEmail());
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
//            List<User> users = UserDAO.getInstance().chkUsrByNameOrEmail(user.getUsername(), null);
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

    /**
     * TESTED
     * This method is used to check login with the username and password.
     * The verified status and the role id are returned to servlet login to split view.
     *
     * @param user    The User object containing the username and password for login.
     * @param ip      The IP address of the client making the request.
     * @param address The address of the client making the request.
     */
    @Override
    public String signUp(User user, String rePassword, String ip, String address) {
        try {
            String error = "";
            boolean check = false;
            User success = null;
            List<User> users = UserDAO.getInstance().checkExistUser(user.getUsername(), "");
            if(users.size()==0) {
                if(Utils.isValidEmail(user.getEmail())) {
                    users = UserDAO.getInstance().checkExistUser("", user.getEmail());
                    if(users.isEmpty()) {
                        if(Utils.isStrongPassword(user.getPassword())) {
                            if(user.getPassword().equals(rePassword)) {
                                success = UserDAO.getInstance().signUp(user.getUsername(), user.getEmail(), user.getPassword(), user.getRole().getId());
                                if(success == null) {
                                    error = "Register fail because my system can't insert your account into database!";
                                } else {
                                    error = success.getId() + "";
                                    check = true;
                                }
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
            if(check) user.setAfterData(success.getId() + ": Register success. Congratulation!");
            else user.setAfterData(user.getUsername() + ": " + error);
            super.insert(user, LevelDAO.getInstance().getLevel(1).get(0), ip, address);
            return error;
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    /**
     * TESTED
     * Sets the verified status of a user.
     *
     * @param user   The User object containing the ID of the user whose verified status needs to be set.
     * @param code   The verification code provided by the user.
     * @param authCode The verification code generated by the system.
     * @param ip      The IP address of the client making the request.
     * @param address The address of the client making the request.
     * @return The error message if the verification fails, otherwise an empty string.
     * @throws Exception If any error occurs during the verification process.
     */
    @Override
    public String setVerified(User user, String code, String authCode, String ip, String address) {
        try {
            String error = "";
            if(authCode != null) {
                if (code.equals(authCode)) {
                    boolean success = UserDAO.getInstance().setVerified(user.getId());
                    if(!success) error = "Set verified status failed for your account";
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

    /**
     * TESTED
     * Updates a user's information by their ID.
     *
     * @return The updated User object with the new information, or null if the update fails.
     */
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

    /**
     * TESTED
     * Updates the password of a user.
     *
     * @param user   The User object containing the ID of the user whose password needs to be updated.
     * @param newPass The new password for the user.
     * @param ip      The IP address of the client making the request.
     * @param address The address of the client making the request.
     * @return The updated User object with the new password, or the original User object if the update fails.
     */
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

    @Override
    public List<User> loadUsersWithRole(Role role) {
        return UserDAO.getInstance().loadUsersWithRole(role.getId());
    }

    /**
     * TESTED
     * Loads a user by their ID.
     *
     * @param user   The User object containing the ID of the user to be loaded.
     * @param ip      The IP address of the client making the request.
     * @param address The address of the client making the request.
     * @return The User object with the matching ID, or null if the user is not found.
     */
    @Override
    public User loadUsersWithId(User user, String ip, String address) {
        try {
            List<User> users = UserDAO.getInstance().loadUsersWithId(user.getId());
            if (users.size()==1) {
                user.setAfterData("Load successfully with ID=" + users.get(0).getId());
            } else {
                user.setAfterData("Load failed with ID=" + user.getId());
                users.clear();
            }
            super.insert(user, LevelDAO.getInstance().getLevel(1).get(0), ip, address);
            return users.get(0);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * TESTED
     * Returns the total number of users in the system.
     *
     * @return the total number of users
     */
    @Override
    public Integer sumOfUsers() {
        return UserDAO.getInstance().sumOfUsers();
    }

    @Override
    public User updateUserInAdmin(User user, String email, String name, String birthday, String detail_address, Timestamp dateCreated, String ip, String address) {
        try {
            user.setBeforeData("Old user info of ID=" + user.getId() + " is " + user);
            User success = UserDAO.getInstance().updateUserInAdmin(user.getId(), email, name, birthday, detail_address, dateCreated);
            user.setAfterData("Update successfully! New user info of ID=" + success.getId() + " is " + success);
            super.insert(user, LevelDAO.getInstance().getLevel(1).get(0), ip, address);
            return success;
        } catch (Exception e) {
            user.setAfterData("Update failed! New user info of ID=" + user.getId() + " don't change!");
            super.insert(user, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return null;
        }
    }

    /**
     * TESTED
     * Updates a user's information by their ID.
     *
     * @param user   The User object containing the ID of the user whose information needs to be updated.
     * @param name    The new name for the user.
     * @param phone   The new phone number for the user.
     * @param email    The new email address for the user.
     * @param detail_address The new detailed address for the user.
     * @param ip       The IP address of the client making the request.
     * @param address  The address of the client making the request.
     * @return The updated User object with the new information, or null if the update fails.
     */
    @Override
    public User updateUserById(User user, String name, String phone, String email, String detail_address, String ip, String address) {
        try {
            user.setBeforeData("Old user info of ID=" + user.getId() + " is " + user);
            User success = UserDAO.getInstance().updateUserById(user.getId(), name, phone, email, detail_address);
            user.setAfterData("Update successfully! New user info of ID=" + success.getId() + " is " + success);
            super.insert(user, LevelDAO.getInstance().getLevel(1).get(0), ip, address);
            return success;
        } catch (Exception e) {
            user.setAfterData("Update failed! New user info of ID=" + user.getId() + " don't change!");
            super.insert(user, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return null;
        }
    }

    /**
     * TESTED
     * Deletes a user by their ID.
     *
     * @param user   The User object containing the ID of the user to be deleted.
     * @param ip      The IP address of the client making the request.
     * @param address The address of the client making the request.
     * @return True if the user is successfully deleted, false otherwise.
     */
    @Override
    public boolean deleteUserById(User user, String ip, String address) {
        try {
            Level level;
            boolean re = false;
            user.setBeforeData("User info of ID=" + user.getId() + " is " + user + " before delete");
            User success = UserDAO.getInstance().deleteUserById(user.getId());
            if(success==null) {
                level = LevelDAO.getInstance().getLevel(1).get(0);
                user.setAfterData("User with ID=" + user.getId() + " has been deleted");
                re = true;
            } else {
                level = LevelDAO.getInstance().getLevel(2).get(0);
                user.setAfterData("Delete failed with ID=" + user.getId());
            }
            super.insert(user, level, ip, address);
            return re;
        } catch (Exception e) {
            List<User> list = UserDAO.getInstance().loadUsersWithId(user.getId());
            user.setAfterData(e.getMessage() + " with ID=" + user.getId());
            super.insert(user, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            if(list.isEmpty()) return true;
            else return false;
        }
    }

    @Override
    public boolean updateLoginFail(User user, int times, String ip, String address) {
        try {
            Level level;
            user.setBeforeData("Login times of email=" + user.getEmail() + " are " + (times - 1));
            boolean success = UserDAO.getInstance().updateLoginFail(user.getEmail(), times);
            if(success) {
                user.setAfterData("Update success. Login times of email=" + user.getEmail() + " are " + times);
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                user.setAfterData("Update fail. Login times of email=" + user.getEmail() + " are not changed");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(user, level, ip, address);
            return success;
        } catch (Exception e) {
            User u = UserService.getInstance().chkUsrByNameOrEmail("", user.getEmail());
            boolean check = false;
            if(u != null) {
                if(u.getLoginTimes()==times) {
                    user.setAfterData("Update success. Login times of email=" + user.getEmail() + " are " + times);
                    check = true;
                } else {
                    user.setAfterData("Update fail. Login times of email=" + user.getEmail() + " are " + u.getLoginTimes());
                }
                super.insert(user, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            }
            return check;
        }
    }

    @Override
    public boolean resetLoginTimes(User user, String ip, String address) {
        try {
            Level level;
            user.setBeforeData("Login times of email=" + user.getEmail() + " are " + user.getLoginTimes());
            boolean success = UserDAO.getInstance().resetLoginTimes(user.getEmail());
            if(success) {
                user.setAfterData("Update success. Login times of email=" + user.getEmail() + " are " + 0);
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                user.setAfterData("Update fail. Login times of email=" + user.getEmail() + " are " + user.getLoginTimes());
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(user, level, ip, address);
            return success;
        } catch (Exception e) {
            User u = UserService.getInstance().chkUsrByNameOrEmail("", user.getEmail());
            boolean check = false;
            if(u != null) {
                if(u.getLoginTimes()==0) {
                    user.setAfterData("Update success. Login times of email=" + user.getEmail() + " are " + 0);
                    check = true;
                } else {
                    user.setAfterData("Update fail. Login times of email=" + user.getEmail() + " are " + u.getLoginTimes());
                }
                super.insert(user, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            }
            return check;
        }
    }
}