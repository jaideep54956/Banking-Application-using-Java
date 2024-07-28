package com.bankapp.service;

import com.bankapp.dao.CustomerDAO;
import com.bankapp.dao.TransactionDAO;
import com.bankapp.model.Customer;
import com.bankapp.model.Transaction;
import com.bankapp.util.PasswordUtil;

import java.math.BigDecimal;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Date;

public class CustomerService {
    private CustomerDAO customerDAO = new CustomerDAO();
    private TransactionDAO transactionDAO = new TransactionDAO();

  
        private NotificationService notificationService = new EmailNotificationService();

        public void registerCustomer(String fullName, String address, String mobileNo, String email, String accountType, BigDecimal initialBalance, Date dateOfBirth, String idProof) throws SQLException, NoSuchAlgorithmException {
            Customer customer = new Customer();
            customer.setFullName(fullName);
            customer.setAddress(address);
            customer.setMobileNo(mobileNo);
            customer.setEmail(email);
            customer.setAccountType(accountType);
            customer.setBalance(initialBalance);
            customer.setDateOfBirth(dateOfBirth);
            customer.setIdProof(idProof);
            
            String accountNo = generateAccountNumber();
            String tempPassword = PasswordUtil.generateTemporaryPassword();
            
            customer.setAccountNo(accountNo);
            customer.setPassword(PasswordUtil.hashPassword(tempPassword));
            
            customerDAO.registerCustomer(customer);
            
            // Send account details to the customer
            notificationService.sendAccountDetails(email, mobileNo, accountNo, tempPassword);
            
            System.out.println("Account created and details sent to the customer.");
        }
        
        

    public boolean login(String accountNo, String password) throws SQLException, NoSuchAlgorithmException {
        Customer customer = customerDAO.getCustomerByAccountNo(accountNo);
        if (customer != null && customer.isAccountActive()) {
            return PasswordUtil.verifyPassword(password, customer.getPassword());
        }
        return false;
    }

    public void changePassword(String accountNo, String newPassword) throws SQLException, NoSuchAlgorithmException {
        Customer customer = customerDAO.getCustomerByAccountNo(accountNo);
        if (customer != null) {
            customer.setPassword(PasswordUtil.hashPassword(newPassword));
            customer.setPasswordChanged(true);
            customerDAO.updateCustomer(customer);
        }
    }

    public BigDecimal getBalance(String accountNo) throws SQLException {
        Customer customer = customerDAO.getCustomerByAccountNo(accountNo);
        return customer != null ? customer.getBalance() : BigDecimal.ZERO;
    }

    public void deposit(String accountNo, BigDecimal amount) throws SQLException {
        Customer customer = customerDAO.getCustomerByAccountNo(accountNo);
        if (customer != null) {
            BigDecimal updatedBalance = customer.getBalance().add(amount);
            customer.setBalance(updatedBalance);
            customerDAO.updateCustomer(customer);

            // Get customer ID
            int customerId = customerDAO.getCustomerIdByAccountNo(accountNo);
            
            // Add transaction record
            Transaction transaction = new Transaction();
            transaction.setCustomerId(customerId);
            transaction.setTransactionType("Deposit");
            transaction.setAmount(amount);
            transaction.setBalance(updatedBalance); // Set the updated balance in transaction record
            transactionDAO.addTransaction(transaction);
            
            notificationService.sendDepositNotification(customer.getEmail(), accountNo, amount, updatedBalance);
        }
    }

    public boolean withdraw(String accountNo, BigDecimal amount) throws SQLException {
        Customer customer = customerDAO.getCustomerByAccountNo(accountNo);
        if (customer != null && customer.getBalance().compareTo(amount) >= 0) {
            BigDecimal updatedBalance = customer.getBalance().subtract(amount);
            customer.setBalance(updatedBalance);
            customerDAO.updateCustomer(customer);

            // Get customer ID
            int customerId = customerDAO.getCustomerIdByAccountNo(accountNo);
            
            // Add transaction record
            Transaction transaction = new Transaction();
            transaction.setCustomerId(customerId);
            transaction.setTransactionType("Withdrawal");
            transaction.setAmount(amount);
            transaction.setBalance(updatedBalance); // Set the updated balance in transaction record
            transactionDAO.addTransaction(transaction);
            
            
            notificationService.sendWithdrawalNotification(customer.getEmail(), accountNo, amount, updatedBalance);
            return true;
        }
        return false;
    }

   
    public void closeAccount(String accountNo) throws SQLException {
        try {
            Customer customer = customerDAO.getCustomerByAccountNo(accountNo);
            if (customer == null) {
                throw new SQLException("Customer not found");
            }

            // Check if the balance is zero
            if (customer.getBalance().compareTo(BigDecimal.ZERO) != 0) {
                throw new SQLException("Account balance must be zero to close the account. Current balance: " + customer.getBalance());
            }

            customerDAO.closeAccount(accountNo);

            // Send notification to the customer
            notificationService.sendAccountClosureNotification(customer.getEmail(), accountNo);

            System.out.println("Account closed successfully: " + accountNo);
        } catch (SQLException e) {
            System.err.println("Error closing account: " + e.getMessage());
            throw e;
        }
    }

    private String generateAccountNumber() {
        // Implement account number generation logic
        return "ACC" + System.currentTimeMillis();
    }

    public int getCustomerIdByAccountNo(String accountNo) throws SQLException {
        return customerDAO.getCustomerIdByAccountNo(accountNo);
    }
}
