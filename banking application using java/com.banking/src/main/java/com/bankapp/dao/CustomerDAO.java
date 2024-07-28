package com.bankapp.dao;

import com.bankapp.model.Customer;
import com.bankapp.util.DatabaseConnection;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    private static final String SELECT_ALL_CUSTOMERS = "SELECT * FROM customer";
    private static final String UPDATE_CUSTOMER_BALANCE = "UPDATE customer SET balance = ? WHERE customer_id = ?";
    private static final String UPDATE_CUSTOMER_DETAILS = "UPDATE customer SET full_name = ?, address = ?, mobile_no = ?, email = ?, account_type = ?, balance = ?, date_of_birth = ?, id_proof = ?, password = ?, is_password_changed = ?, is_account_active = ? WHERE customer_id = ?";
    private static final String SELECT_CUSTOMER_BY_ACCOUNT_NO = "SELECT * FROM customer WHERE account_no = ?";
    private static final String SELECT_CUSTOMER_ID_BY_ACCOUNT_NO = "SELECT customer_id FROM customer WHERE account_no = ?";
    private static final String DELETE_CUSTOMER_BY_ACCOUNT_NO = "DELETE FROM customer WHERE account_no = ?";
    private static final String DELETE_CUSTOMER_TRANSACTIONS = "DELETE FROM transaction WHERE customer_id = (SELECT customer_id FROM customer WHERE account_no = ?)";

    public List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(resultSet.getInt("customer_id"));
                customer.setFullName(resultSet.getString("full_name"));
                customer.setEmail(resultSet.getString("email"));
                customer.setMobileNo(resultSet.getString("mobile_no"));
                customer.setAddress(resultSet.getString("address"));
                customer.setAccountType(resultSet.getString("account_type"));
                customer.setBalance(resultSet.getBigDecimal("balance"));
                customer.setDateOfBirth(resultSet.getDate("date_of_birth"));
                customer.setIdProof(resultSet.getString("id_proof"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }
    public void registerCustomer(Customer customer) throws SQLException {
        String sql = "INSERT INTO customer (full_name, address, mobile_no, email, account_type, balance, date_of_birth, id_proof, account_no, password, is_password_changed, is_account_active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, customer.getFullName());
            pstmt.setString(2, customer.getAddress());
            pstmt.setString(3, customer.getMobileNo());
            pstmt.setString(4, customer.getEmail());
            pstmt.setString(5, customer.getAccountType());
            pstmt.setBigDecimal(6, customer.getBalance());
            pstmt.setDate(7, new java.sql.Date(customer.getDateOfBirth().getTime()));
            pstmt.setString(8, customer.getIdProof());
            pstmt.setString(9, customer.getAccountNo());
            pstmt.setString(10, customer.getPassword());
            pstmt.setBoolean(11, customer.isPasswordChanged());
            pstmt.setBoolean(12, customer.isAccountActive());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e; // Rethrow the exception to propagate it to the caller
        }
    }


    public void updateCustomerBalance(int customerId, BigDecimal newBalance) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_BALANCE)) {
            preparedStatement.setBigDecimal(1, newBalance);
            preparedStatement.setInt(2, customerId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void updateCustomer(Customer customer) {
        String query = "UPDATE customer SET full_name = ?, address = ?, mobile_no = ?, email = ?, account_type = ?, balance = ?, date_of_birth = ?, id_proof = ? WHERE customer_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, customer.getFullName());
            preparedStatement.setString(2, customer.getAddress());
            preparedStatement.setString(3, customer.getMobileNo());
            preparedStatement.setString(4, customer.getEmail());
            preparedStatement.setString(5, customer.getAccountType());
            preparedStatement.setBigDecimal(6, customer.getBalance());
            preparedStatement.setDate(7, new java.sql.Date(customer.getDateOfBirth().getTime()));
            preparedStatement.setString(8, customer.getIdProof());
            preparedStatement.setInt(9, customer.getCustomerId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Customer getCustomerByAccountNo(String accountNo) {
        Customer customer = null;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ACCOUNT_NO)) {
            preparedStatement.setString(1, accountNo);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    customer = new Customer();
                    customer.setCustomerId(resultSet.getInt("customer_id"));
                    customer.setFullName(resultSet.getString("full_name"));
                    customer.setAddress(resultSet.getString("address"));
                    customer.setMobileNo(resultSet.getString("mobile_no"));
                    customer.setEmail(resultSet.getString("email"));
                    customer.setAccountType(resultSet.getString("account_type"));
                    customer.setBalance(resultSet.getBigDecimal("balance"));
                    customer.setDateOfBirth(resultSet.getDate("date_of_birth"));
                    customer.setIdProof(resultSet.getString("id_proof"));
                    customer.setAccountNo(resultSet.getString("account_no"));
                    customer.setPassword(resultSet.getString("password"));
                    customer.setPasswordChanged(resultSet.getBoolean("is_password_changed"));
                    customer.setAccountActive(resultSet.getBoolean("is_account_active"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    public int getCustomerIdByAccountNo(String accountNo) {
        int customerId = 0;
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_ID_BY_ACCOUNT_NO)) {
            preparedStatement.setString(1, accountNo);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    customerId = resultSet.getInt("customer_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerId;
    }

    public void deleteTransactionsByCustomerId(int customerId) throws SQLException {
        String sql = "DELETE FROM transaction WHERE customer_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, customerId);
            statement.executeUpdate();
        }
    }

    public void deleteCustomerByAccountNo(String accountNo) throws SQLException {
        String sql = "DELETE FROM customer WHERE account_no = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, accountNo);
            statement.executeUpdate();
            System.out.println("Deleted customer with account number: " + accountNo);
        } catch (SQLException e) {
            e.printStackTrace();
            throw e; // Rethrow the exception to propagate it to the caller
        }
    }

    public void deleteCustomer(int customerId) {
        String query = "DELETE FROM customer WHERE customer_id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, customerId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   
    // ... (keep all existing methods)

    public void closeAccount(String accountNo) throws SQLException {
        Connection connection = null;
        try {
            connection = DatabaseConnection.getConnection();
            connection.setAutoCommit(false);

            // Get customer ID
            int customerId = getCustomerIdByAccountNo(accountNo);
            if (customerId == 0) {
                throw new SQLException("Customer not found with account number: " + accountNo);
            }

            // Delete associated transactions
            String deleteTransactionsSql = "DELETE FROM transaction WHERE customer_id = ?";
            try (PreparedStatement deleteTransactionsStmt = connection.prepareStatement(deleteTransactionsSql)) {
                deleteTransactionsStmt.setInt(1, customerId);
                deleteTransactionsStmt.executeUpdate();
            }

            // Delete customer
            String deleteCustomerSql = "DELETE FROM customer WHERE account_no = ?";
            try (PreparedStatement deleteCustomerStmt = connection.prepareStatement(deleteCustomerSql)) {
                deleteCustomerStmt.setString(1, accountNo);
                deleteCustomerStmt.executeUpdate();
            }

            connection.commit();
            System.out.println("Account closed successfully: " + accountNo);
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            throw e;
        } finally {
            if (connection != null) {
                try {
                    connection.setAutoCommit(true);
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

