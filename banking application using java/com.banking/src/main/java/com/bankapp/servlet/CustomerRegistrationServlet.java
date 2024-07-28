package com.bankapp.servlet;

import com.bankapp.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/admin/register-customer")
public class CustomerRegistrationServlet extends HttpServlet {
    private CustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String fullName = request.getParameter("fullName");
            String address = request.getParameter("address");
            String mobileNo = request.getParameter("mobileNo");
            String email = request.getParameter("email");
            String accountType = request.getParameter("accountType");
            BigDecimal initialBalance = new BigDecimal(request.getParameter("initialBalance"));
            Date dateOfBirth = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dateOfBirth"));
            String idProof = request.getParameter("idProof");

            customerService.registerCustomer(fullName, address, mobileNo, email, accountType, initialBalance, dateOfBirth, idProof);

            response.sendRedirect(request.getContextPath() + "/admin/dashboard?success=true");
        } catch (Exception e) {
            throw new ServletException("Customer registration failed", e);
        }
    }
}