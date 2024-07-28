package com.bankapp.servlet;

import com.bankapp.dao.CustomerDAO;
import com.bankapp.model.Customer;
import com.bankapp.util.PasswordUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "CustomerPasswordResetServlet", urlPatterns = {"/customer/resetPassword"})
public class CustomerPasswordResetServlet extends HttpServlet {
    private CustomerDAO customerDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        customerDAO = new CustomerDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/customer/resetPassword.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo");
        String newPassword = request.getParameter("newPassword");

        try {
            Customer customer = customerDAO.getCustomerByAccountNo(accountNo);
            if (customer != null) {
                String hashedPassword = PasswordUtil.hashPassword(newPassword);
                customer.setPassword(hashedPassword);
                customer.setPasswordChanged(true);
                customerDAO.updateCustomer(customer);
                request.setAttribute("message", "Password reset successful!");
                request.getRequestDispatcher("/customer/resetPassword.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Invalid account number.");
                request.getRequestDispatcher("/customer/resetPassword.jsp").forward(request, response);
            }
        } catch (NoSuchAlgorithmException e) {
            request.setAttribute("error", "Error hashing password.");
            request.getRequestDispatcher("/customer/resetPassword.jsp").forward(request, response);
        }
    }
}
