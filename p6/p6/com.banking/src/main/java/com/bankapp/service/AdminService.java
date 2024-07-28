package com.bankapp.service;

import com.bankapp.dao.AdminDAO;
import com.bankapp.model.Admin;
import com.bankapp.util.PasswordUtil;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

public class AdminService {
    private AdminDAO adminDAO = new AdminDAO();

    public boolean login(String username, String password) throws SQLException, NoSuchAlgorithmException {
        Admin admin = adminDAO.getAdminByUsername(username);
        if (admin != null) {
            return PasswordUtil.verifyPassword(password, admin.getPassword());
        }
        return false;
    }
}