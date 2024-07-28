<%@ page import="java.util.Objects" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bankapp.model.Transaction" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #0e0e0e; /* Dark gray background color */
            color: #ffffff; /* White text color */
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            overflow: hidden;
            position: relative;
        }

        .circle-bg {
            position: absolute;
            border-radius: 50%;
            pointer-events: none;
            background: radial-gradient(circle, rgba(255,255,255,0.2) 20%, rgba(0,0,0,0) 40%);
            z-index: 0; /* Ensure it stays in the background */
        }

        .circle-bg.one {
            width: 200px;
            height: 200px;
            top: 10%;
            left: 20%;
            animation: moveCircles 15s linear infinite;
        }

        .circle-bg.two {
            width: 150px;
            height: 150px;
            top: 40%;
            left: 60%;
            animation: moveCircles 20s linear infinite;
            animation-delay: 5s;
        }

        .circle-bg.three {
            width: 100px;
            height: 100px;
            top: 70%;
            left: 30%;
            animation: moveCircles 25s linear infinite;
            animation-delay: 10s;
        }

        .circle-bg.four {
            width: 250px;
            height: 250px;
            top: 80%;
            left: 70%;
            animation: moveCircles 30s linear infinite;
            animation-delay: 15s;
        }

        .circle-bg.five {
            width: 120px;
            height: 120px;
            top: 20%;
            left: 50%;
            animation: moveCircles 18s linear infinite;
            animation-delay: 3s;
        }

        .circle-bg.six {
            width: 180px;
            height: 180px;
            top: 50%;
            left: 10%;
            animation: moveCircles 22s linear infinite;
            animation-delay: 7s;
        }

        .circle-bg.seven {
            width: 140px;
            height: 140px;
            top: 60%;
            left: 80%;
            animation: moveCircles 25s linear infinite;
            animation-delay: 12s;
        }

        .circle-bg.eight {
            width: 200px;
            height: 200px;
            top: 30%;
            left: 80%;
            animation: moveCircles 28s linear infinite;
            animation-delay: 8s;
        }

        .container {
            background: rgba(30, 30, 30, 0.7); /* Semi-transparent dark gray background */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 90%;
            max-width: 1000px;
            position: relative;
            z-index: 1; /* Ensure it stays above the background */
        }

        h2 {
            margin-bottom: 30px;
            color: #eef3f3; /* Light gray header color */
            animation: fadeIn 1s ease-out;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 15px;
            border: 1px solid #f5f8f9; /* Light gray border */
            text-align: center;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.3s;
        }

        th {
            background-color: #0cc8f2;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #1e1e1e; /* Dark gray for even rows */
        }

        tr:hover {
            background-color: #f7f7f7; /* Bright cyan on hover */
            transform: scale(1.02);
            color: black;
        }

        a {
            display: inline-block;
            margin: 20px 0;
            padding: 12px 24px;
            text-decoration: none;
            color: #ffffff; /* White text color */
            background-color: #090909; /* Dark gray background */
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            font-size: 16px;
            border: 2px solid #00e5ff;
        }

        a:hover {
            background-color: #00e5ff; /* Bright cyan background on hover */
            color: #111111; /* Dark text color */
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes moveCircles {
            0% { transform: translate(-50%, -50%); }
            50% { transform: translate(50%, 50%); }
            100% { transform: translate(-50%, -50%); }
        }
    </style>
</head>
<body>
    <div class="circle-bg one"></div>
    <div class="circle-bg two"></div>
    <div class="circle-bg three"></div>
    <div class="circle-bg four"></div>
    <div class="circle-bg five"></div>
    <div class="circle-bg six"></div>
    <div class="circle-bg seven"></div>
    <div class="circle-bg eight"></div>
    <div class="container">
        <h2>Transaction History</h2>
        <table>
            <tr>
                <th>Transaction ID</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Date</th>
            </tr>
            <% 
                List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                if (transactions != null && !transactions.isEmpty()) {
                    for (Transaction transaction : transactions) {
            %>
            <tr>
                <td><%= transaction.getTransactionId() %></td>
                <td><%= transaction.getTransactionType() %></td>
                <td><%= transaction.getAmount() %></td>
                <td><%= transaction.getTransactionDate() %></td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr>
                <td colspan="4">No transactions found.</td>
            </tr>
            <% } %>
        </table>
        <a href="${pageContext.request.contextPath}/customer/generate-pdf">Download PDF</a>
    </div>
</body>
</html>
