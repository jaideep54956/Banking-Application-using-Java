package com.bankapp.servlet;

import com.bankapp.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/customer/dashboard")
public class CustomerDashboardServlet extends HttpServlet {
    private CustomerService customerService = new CustomerService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("accountNo") != null) {
            String accountNo = (String) session.getAttribute("accountNo");
            try {
                BigDecimal balance = customerService.getBalance(accountNo);
                request.setAttribute("balance", balance);
                request.getRequestDispatcher("/customer/dashboard.jsp").forward(request, response);
            } catch (Exception e) {
                throw new ServletException("Error retrieving balance", e);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/customer/login.jsp");
        }
    }
}