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

@WebServlet("/customer/withdraw")
public class WithdrawServlet extends HttpServlet {
    private CustomerService customerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("accountNo") != null) {
            String accountNo = (String) session.getAttribute("accountNo");
            BigDecimal amount = new BigDecimal(request.getParameter("amount"));

            try {
                boolean success = customerService.withdraw(accountNo, amount);
                if (success) {
                    response.sendRedirect(request.getContextPath() + "/customer/dashboard");
                } else {
                    request.setAttribute("error", "Insufficient balance");
                    request.getRequestDispatcher("/customer/dashboard").forward(request, response);
                }
            } catch (Exception e) {
                throw new ServletException("Withdrawal failed", e);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/customer/login.jsp");
        }
    }
}