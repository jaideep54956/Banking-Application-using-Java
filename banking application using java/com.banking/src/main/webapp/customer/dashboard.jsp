<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: #ffffff; /* White */
            overflow: hidden; /* Prevent scrollbars */
            position: relative;
            background: url('https://finanteq.com/wp-content/uploads/2017/11/pic_blog_05.jpg') no-repeat center center;
            background-size: cover;
            animation: gradientOverlay 15s infinite alternate;
        }

        @keyframes gradientOverlay {
            0% {
                background: linear-gradient(45deg, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://finanteq.com/wp-content/uploads/2017/11/pic_blog_05.jpg');
                background-size: cover;
            }
            50% {
                background: linear-gradient(45deg, rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.7)), url('https://finanteq.com/wp-content/uploads/2017/11/pic_blog_05.jpg');
                background-size: cover;
            }
            100% {
                background: linear-gradient(45deg, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.3)), url('https://finanteq.com/wp-content/uploads/2017/11/pic_blog_05.jpg');
                background-size: cover;
            }
        }

        h2 {
            margin-bottom: 20px;
            color: #eef3f3; /* Light Gray */
            font-size: 3em; /* Increased font size */
            text-align: center;
            opacity: 0;
            overflow: hidden; /* Ensures text does not overflow */
            border-right: .15em solid #00e5ff; /* Cursor effect */
            white-space: nowrap; /* Keeps text in a single line */
            letter-spacing: .15em; /* Spacing between letters */
            animation: typing 2.5s steps(30, end), blink-caret .75s step-end infinite, fadeIn 1s ease-out forwards;
        }

        @keyframes typing {
            from { width: 0; }
            to { width: 100%; }
        }

        @keyframes blink-caret {
            from, to { border-color: transparent; }
            50% { border-color: #00e5ff; }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        a {
            display: inline-block;
            margin: 10px;
            padding: 15px 30px;
            text-decoration: none;
            color: #1e1e1e; /* Dark Gray */
            background-color: #00e5ff; /* Bright Cyan */
            border: 2px solid #1e1e1e; /* Dark Gray */
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s, border-color 0.3s; /* Add transition for border color */
            font-size: 1.2em; /* Increased font size */
            text-align: center;
        }

        a:hover {
            background-color: #1e1e1e; /* Dark Gray */
            color: #00e5ff; /* Bright Cyan */
            border-color: #00e5ff; /* Change border color on hover */
            transform: translateY(-3px);
        }

        /* Preloader Styles */
        .preloader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8); /* Dark overlay */
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999; /* Ensure it is above other content */
            transition: opacity 0.5s ease-out;
            opacity: 1;
            visibility: visible;
        }

        .preloader img {
            width: 100%; /* Cover the width of the viewport */
            height: auto; /* Maintain aspect ratio */
            max-width: 500px; /* Limit the maximum width */
            max-height: 500px; /* Limit the maximum height */
            opacity: 0.73; /* Adjust the transparency of the image */
        }

        .preloader.hidden {
            opacity: 0;
            visibility: hidden;
        }
    </style>
</head>
<body>
    <!-- Preloader -->
    <div class="preloader">
        <img src="https://i.gifer.com/7RRt.gif" alt="Loading...">
    </div>

    <!-- Page Content -->
    
        <div class="container">
        <h2>Customer Dashboard</h2>
        <p>Account Balance: $${balance}</p>
        <a href="${pageContext.request.contextPath}/customer/deposit.jsp">Deposit</a>
        <a href="${pageContext.request.contextPath}/customer/withdraw.jsp">Withdraw</a>
        <a href="${pageContext.request.contextPath}/customer/transaction-history">Transaction History</a>
        <a href="${pageContext.request.contextPath}/customer/logout">Logout</a>
         <a href="${pageContext.request.contextPath}/customer/close-account">CloseAccount</a>
         <a href="${pageContext.request.contextPath}/customer/resetPassword">resetPassword</a>
     
    
    </div>

    <script>
        window.addEventListener('load', function() {
            setTimeout(function() {
                document.querySelector('.preloader').classList.add('hidden');
            }, 3000); // Set the timeout duration (3000ms = 3 seconds)
        });
    </script>
</body>
</html>
