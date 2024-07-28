package com.bankapp.servlet;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Here you would validate the username and password against your database
        // For simplicity, let's assume username and password are admin/admin for now
        if (username.equals("admin") && password.equals("MySecurePassword123")) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect(request.getContextPath()+"/admin/dashboard1.jsp"); // Redirect to dashboard page
        } else {
            response.sendRedirect("index.jsp"); // Redirect back to login page
        }
    }
}