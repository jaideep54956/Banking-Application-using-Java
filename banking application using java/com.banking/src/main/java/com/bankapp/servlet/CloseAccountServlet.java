package com.bankapp.servlet;

import com.bankapp.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CloseAccountServlet", urlPatterns = {"/customer/close-account"})
public class CloseAccountServlet extends HttpServlet {
    private CustomerService customerService;

    @Override
    public void init() throws ServletException {
        super.init();
        customerService = new CustomerService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to JSP for account closure confirmation
        request.getRequestDispatcher("/customer/close-account.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo");

        if (accountNo == null || accountNo.trim().isEmpty()) {
            request.setAttribute("error", "Account number is required");
            request.getRequestDispatcher("/customer/close-account.jsp").forward(request, response);
            return;
        }

        try {
            customerService.closeAccount(accountNo);
            request.getSession().invalidate(); // Logout the user
            response.sendRedirect(request.getContextPath() + "/customer/login?message=Account closed successfully");
        } catch (SQLException e) {
            String errorMessage = e.getMessage();
            if (errorMessage.startsWith("Account balance must be zero")) {
                request.setAttribute("error", errorMessage);
            } else {
                request.setAttribute("error", "Error closing account: " + errorMessage);
            }
            request.getRequestDispatcher("/customer/close-account.jsp").forward(request, response);
        }
    }
}