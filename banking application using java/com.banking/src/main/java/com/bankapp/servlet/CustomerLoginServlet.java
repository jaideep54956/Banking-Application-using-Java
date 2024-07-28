package com.bankapp.servlet;

import com.bankapp.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/customer/login")
public class CustomerLoginServlet extends HttpServlet {
    private CustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo");
        String password = request.getParameter("password");

        try {
            if (customerService.login(accountNo, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("accountNo", accountNo);
                response.sendRedirect(request.getContextPath() + "/customer/dashboard");
            } else{
                request.setAttribute("error", "Invalid account number or password");
                request.getRequestDispatcher("/customer/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException( "Login failed", e);
          
        }
    }
}