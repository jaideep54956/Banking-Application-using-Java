package com.bankapp.dao;

import com.bankapp.model.Transaction;
import com.bankapp.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {
    public void addTransaction(Transaction transaction) throws SQLException {
        String sql = "INSERT INTO transaction (customer_id, transaction_type, amount) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, transaction.getCustomerId());
            pstmt.setString(2, transaction.getTransactionType());
            pstmt.setBigDecimal(3, transaction.getAmount());
            pstmt.executeUpdate();
        }
    }

    public List<Transaction> getLastTenTransactions(int customerId) throws SQLException {
        String sql = "SELECT * FROM transaction WHERE customer_id = ? ORDER BY transaction_date DESC LIMIT 10";
        List<Transaction> transactions = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, customerId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Transaction transaction = new Transaction();
                    transaction.setTransactionId(rs.getInt("transaction_id"));
                    transaction.setCustomerId(rs.getInt("customer_id"));
                    transaction.setTransactionType(rs.getString("transaction_type"));
                    transaction.setAmount(rs.getBigDecimal("amount"));
                    transaction.setTransactionDate(rs.getTimestamp("transaction_date"));
                    transactions.add(transaction);
                }
            }
        }
        return transactions;
    }



    public int getCustomerIdByAccountNo(String accountNo) throws SQLException {
        String sql = "SELECT customer_id FROM customer WHERE account_no = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, accountNo);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("customer_id");
                } else {
                    throw new SQLException("No customer found with account number: " + accountNo);
                }
            }
        }
    }

    public void deleteTransactionsByCustomerId(int customerId) throws SQLException {
        String sql = "DELETE FROM transaction WHERE customer_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, customerId);
            pstmt.executeUpdate();
        }
    }
}