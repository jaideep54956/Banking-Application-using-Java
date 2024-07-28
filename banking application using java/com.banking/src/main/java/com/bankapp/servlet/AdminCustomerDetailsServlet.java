package com.bankapp.servlet;

import com.bankapp.dao.CustomerDAO;
import com.bankapp.model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/customer-details")
public class AdminCustomerDetailsServlet extends HttpServlet {
    private CustomerDAO customerDAO;

    public void init() throws ServletException {
        super.init();
        // Initialize DAO or get from Spring context
        customerDAO = new CustomerDAO();  // Example: Replace with your actual DAO initialization
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Customer> customers = customerDAO.getAllCustomers();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/admin/customer-details.jsp").forward(request, response);
    }
}
