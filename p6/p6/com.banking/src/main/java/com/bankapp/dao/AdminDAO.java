package com.bankapp.dao;



import com.bankapp.model.Admin;
import com.bankapp.util.DatabaseConnection;

import java.sql.*;

public class AdminDAO {
    public Admin getAdminByUsername(String username) throws SQLException {
        String sql = "SELECT * FROM admin WHERE username = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Admin admin = new Admin();
                    admin.setAdminId(rs.getInt("admin_id"));
                    admin.setUsername(rs.getString("username"));
                    admin.setPassword(rs.getString("password"));
                    return admin;
                }
            }
        }
        return null;
    }
}