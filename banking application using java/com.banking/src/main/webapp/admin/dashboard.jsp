<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bankapp.model.Customer" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bankapp.dao.CustomerDAO" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            color: #ffffff; /* White text color */
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            height: 100vh;
            overflow: hidden; /* Prevent scrollbars from appearing due to the pseudo-element */
            background: #0e0e0e; /* Dark gray background color */
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://info.ehl.edu/hubfs/Customer%20Service%20.jpeg') no-repeat center center fixed;
            background-size: cover;
            filter: blur(8px);
            z-index: -1;
            animation: moveBackground 30s linear infinite;
        }

        @keyframes moveBackground {
            0% { background-position: 0% 0%; }
            100% { background-position: 100% 100%; }
        }

        h1 {
            color: #eef3f3; /* Light gray header color */
            border-bottom: 2px solid #f5f8f9; /* Light gray border color for header */
            padding-bottom: 10px;
            margin-bottom: 20px;
            text-align: center;
        }

        .table-container {
            width: 100%;
            overflow-y: auto;
            height: 80vh; /* Adjust the height as needed */
            margin-bottom: 20px; /* Add some space at the bottom */
        }

        table {
            width: 90%; /* Adjusted width of the table */
            max-width: 1200px; /* Maximum width for larger screens */
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.2); /* Slightly transparent background for table */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            table-layout: fixed; /* Fixed table layout */
            animation: tableAnimation 1s ease-in-out;
            margin: 0 auto; /* Center the table */
        }

        @keyframes tableAnimation {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        th, td {
            padding: 12px; /* Increased padding */
            text-align: left;
            border: 1px solid #f5f8f9; /* Light gray border color */
            font-size: 14px; /* Larger font size */
            word-wrap: break-word; /* Ensures long text wraps */
        }

        th {
            background-color: #00e5ff; /* Blue background color for header cells */
            color: #0f0f0f; /* Black text color for header cells */
            animation: headingAnimation 1s ease-in-out;
        }

        @keyframes headingAnimation {
            0% { background-color: #0056b3; }
            50% { background-color: #007bff; }
            100% { background-color: #0056b3; }
        }

        td {
            background-color: #333; /* Slightly darker gray for data cells */
        }

        /* Increase the width of the Actions column */
        td:nth-child(10), th:nth-child(10) {
            width: 300px; /* Increased width for Actions column */
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin: 0;
        }

        input[type="text"], input[type="date"] {
            margin: 4px 0;
            padding: 6px;
            border: 1px solid #f5f8f9;
            border-radius: 4px;
            background-color: #1e1e1e;
            color: #ffffff;
            font-size: 12px;
            width: 100%;
            max-width: 200px;
        }

        input[type="submit"] {
            padding: 8px 16px; /* Larger padding for submit button */
            border: 2px solid #00e5ff; /* Bright cyan border */
            background-color: #1e1e1e;
            color: #ffffff;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s, transform 0.3s;
            font-size: 12px;
            margin-top: 8px;
        }

        input[type="submit"]:hover {
            background-color: #00e5ff; /* Bright cyan background on hover */
            color: #1e1e1e; /* Dark gray text color on hover */
            transform: scale(1.03);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <h1>Admin Dashboard</h1>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Mobile Number</th>
                    <th>Address</th>
                    <th>Account Type</th>
                    <th>Balance</th>
                    <th>Date of Birth</th>
                    <th>ID Proof</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    CustomerDAO customerDAO = new CustomerDAO();
                    List<Customer> customers = customerDAO.getAllCustomers();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    for (Customer customer : customers) {
                %>
                <tr>
                    <td><%= customer.getCustomerId() %></td>
                    <td><%= customer.getFullName() %></td>
                    <td><%= customer.getEmail() %></td>
                    <td><%= customer.getMobileNo() %></td>
                    <td><%= customer.getAddress() %></td>
                    <td><%= customer.getAccountType() %></td>
                    <td><%= customer.getBalance() %></td>
                    <td><%= sdf.format(customer.getDateOfBirth()) %></td>
                    <td><%= customer.getIdProof() %></td>
                    <td>
                        <form action="<%= request.getContextPath() %>/admin/dashboard" method="post">
                            <input type="hidden" name="customerId" value="<%= customer.getCustomerId() %>">
                            <input type="text" name="fullName" value="<%= customer.getFullName() %>">
                            <input type="text" name="address" value="<%= customer.getAddress() %>">
                            <input type="text" name="mobileNo" value="<%= customer.getMobileNo() %>">
                            <input type="text" name="email" value="<%= customer.getEmail() %>">
                            <input type="text" name="accountType" value="<%= customer.getAccountType() %>">
                            <input type="text" name="balance" value="<%= customer.getBalance() %>">
                            <input type="date" name="dateOfBirth" value="<%= sdf.format(customer.getDateOfBirth()) %>">
                            <input type="text" name="idProof" value="<%= customer.getIdProof() %>">
                            <input type="submit" name="action" value="Update Details">
                            <input type="submit" name="action" value="Delete">
                        </form>
                    </td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
