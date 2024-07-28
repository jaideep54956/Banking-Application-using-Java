<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Close Account</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            color: #ffffff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url('https://i.pinimg.com/originals/dd/ca/be/ddcabeb0bbdd9cdb4e5e911c18a4987c.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(14, 14, 14, 0.7);
            z-index: 1;
        }
        h1, form, p {
            position: relative;
            z-index: 2;
            text-align: center;
        }
        h1 {
            color: #eef3f3;
            font-size: 3em;
            margin-bottom: 0.5em;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        form {
            margin-bottom: 1em;
        }
        input[type="text"], input[type="submit"] {
            background-color: transparent;
            color: #ffffff;
            border: 2px solid #00e5ff;
            padding: 15px 30px;
            font-size: 1.2em;
            margin: 10px 0;
            display: block;
            width: calc(100% - 64px);
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
        }
        input[type="submit"] {
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: rgba(0, 229, 255, 0.2);
            transform: scale(1.05);
        }
        p {
            margin-top: 1em;
            font-size: 1.1em;
        }
        .error {
            color: #ff4444;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        h1, form, p {
            animation: fadeIn 1s ease-in-out;
        }
    </style>
</head>
<body>
    <h1>Close Account</h1>
    
    <% if (request.getAttribute("error") != null) { %>
        <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>
    
    <form action="${pageContext.request.contextPath}/customer/close-account" method="post">
        <label for="accountNo">Account Number:</label>
        <input type="text" id="accountNo" name="accountNo" required><br><br>
        
        <p>Are you sure you want to close this account? This action cannot be undone.</p>
        
        <input type="submit" value="Close Account">
    </form>
    
    <a href="${pageContext.request.contextPath}/customer/dashboard" style="color: #00e5ff; text-decoration: none; margin-top: 20px;">Cancel</a>
</body>
</html>
