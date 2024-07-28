package com.bankapp.servlet;

import com.bankapp.model.Transaction;
import com.bankapp.service.TransactionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/customer/transaction-history")
public class TransactionHistoryServlet extends HttpServlet {
    private TransactionService transactionService = new TransactionService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("accountNo") != null) {
            String accountNo = (String) session.getAttribute("accountNo");
            try {
                int customerId = transactionService.getCustomerIdByAccountNo(accountNo);
                List<Transaction> transactions = transactionService.getLastTenTransactions(customerId);
                request.setAttribute("transactions", transactions);
                request.getRequestDispatcher("/customer/transaction-history.jsp").forward(request, response);
            } catch (Exception e) {
                throw new ServletException("Error retrieving transaction history", e);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/customer/login.jsp");
        }
    }
}
