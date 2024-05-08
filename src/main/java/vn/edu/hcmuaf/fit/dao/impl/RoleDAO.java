package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.model.Role;

public class RoleDAO extends AbsDAO<Role>{
    private static RoleDAO instance;

    public static RoleDAO getInstance() {
        if (instance == null) {
            instance = new RoleDAO();
        }
        return instance;
    }

    public int add(Role role) {
        String sql = "INSERT INTO role(id, role_name) VALUES (?, ?)";
        return modify(sql, role.getId(), role.getRoleName());
    }

    public int update(Role role) {
        String sql = "UPDATE role SET role_name = ? WHERE id = ?";
        return modify(sql, role.getRoleName(), role.getId());
    }

    public int count(Role role) {
        String sql = "SELECT count(*) FROM role WHERE role_name = ? AND id = ?";
        return count(sql, role.getRoleName(), role.getId());
    }

    public static void main(String[] args) {
        Role role = new Role();
        role.setId(3);
//        role.setRoleName("MP dep gai");
//        System.out.println(RoleDAO.getInstance().add(role));
        role.setRoleName("Mode");
//        System.out.println(RoleDAO.getInstance().update(role));
        System.out.println(RoleDAO.getInstance().count(role));
    }
}