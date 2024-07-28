package com.bankapp.servlet;

import com.bankapp.dao.CustomerDAO;
import com.bankapp.model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/admin/dashboard"})
public class AdminDashboardServlet extends HttpServlet {
    private CustomerDAO customerDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        customerDAO = new CustomerDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = customerDAO.getAllCustomers();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Action received: " + action); // Logging
        if ("Update Details".equals(action)) {
            handleUpdateDetails(request, response);
        } else if ("Delete".equals(action)) {
            handleDelete(request, response);
        }
    }

    private void handleUpdateDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            String fullName = request.getParameter("fullName");
            String address = request.getParameter("address");
            String mobileNo = request.getParameter("mobileNo");
            String email = request.getParameter("email");
            String accountType = request.getParameter("accountType");
            BigDecimal balance = new BigDecimal(request.getParameter("balance"));
            Date dateOfBirth = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dateOfBirth"));
            String idProof = request.getParameter("idProof");

            System.out.println("Updating customer ID: " + customerId); // Logging

            Customer customer = new Customer();
            customer.setCustomerId(customerId);
            customer.setFullName(fullName);
            customer.setAddress(address);
            customer.setMobileNo(mobileNo);
            customer.setEmail(email);
            customer.setAccountType(accountType);
            customer.setBalance(balance);
            customer.setDateOfBirth(dateOfBirth);
            customer.setIdProof(idProof);

            customerDAO.updateCustomer(customer);
            System.out.println("Customer updated successfully"); // Logging
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
        } catch (ParseException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error parsing date.");
            request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error updating customer details.");
            request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
        }
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        System.out.println("Deleting customer ID: " + customerId); // Logging
        customerDAO.deleteCustomer(customerId);
        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
    }
}
