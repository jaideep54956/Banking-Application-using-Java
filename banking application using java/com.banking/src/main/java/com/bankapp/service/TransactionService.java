package com.bankapp.service;

import com.bankapp.dao.TransactionDAO;
import com.bankapp.model.Transaction;

import java.sql.SQLException;
import java.util.List;

public class TransactionService {
    private TransactionDAO transactionDAO = new TransactionDAO();

    public void addTransaction(Transaction transaction) throws SQLException {
        transactionDAO.addTransaction(transaction);
    }
 
    public List<Transaction> getLastTenTransactions(int customerId) throws SQLException {
        return transactionDAO.getLastTenTransactions(customerId);
    }

    public int getCustomerIdByAccountNo(String accountNo) throws SQLException {
        return transactionDAO.getCustomerIdByAccountNo(accountNo);
    }
}
