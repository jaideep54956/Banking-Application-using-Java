<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #0e0e0e; /* Dark gray background */
            color: #ffffff; /* White text color */
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        .image-container {
            width: 60%; /* Image takes more than half of the page */
            background: url('https://images.unsplash.com/photo-1561414927-6d86591d0c4f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8fA%3D%3D') no-repeat center center;
            background-size: cover;
            opacity: 0.7; /* Adjust the opacity if needed */
            position: relative;
            animation: slideAnimation 20s linear infinite; /* Sliding animation */
        }

        @keyframes slideAnimation {
            0% { transform: translateX(-10%); }
            50% { transform: translateX(10%); }
            100% { transform: translateX(-10%); }
        }

        .content-container {
            width: 40%; /* Form takes the remaining part of the page */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
            text-align: center;
        }

        .heading-container {
            margin-bottom: 20px;
        }

        .heading-container h2 {
            font-size: 3rem; /* Larger font size */
            font-weight: bold; /* Bold text */
            text-transform: uppercase; /* Uppercase text */
            letter-spacing: 2px; /* Increased letter spacing */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Text shadow for depth */
        }

        .heading-container hr {
            width: 60%;
            border: 0;
            height: 3px;
            background-color: #00e5ff; /* Bright cyan color for hr */
            margin: 20px auto;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

        input[type="number"] {
            margin: 10px 0;
            padding: 15px;
            width: 80%;
            max-width: 400px;
            border: 1px solid #f5f8f9; /* Light gray border */
            border-radius: 5px;
            font-size: 16px;
            background-color: #1e1e1e; /* Dark gray background for input */
            color: #ffffff; /* White text color for input */
            transition: box-shadow 0.3s, transform 0.3s;
        }

        input[type="number"]:focus {
            box-shadow: 0 0 10px #00e5ff; /* Bright cyan shadow on focus */
            transform: scale(1.05);
        }

        button {
            padding: 15px 30px;
            border: 2px solid #00e5ff; /* Bright cyan border */
            background-color: #1e1e1e; /* Dark gray background */
            color: #ffffff; /* White text color */
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
            transition: background-color 0.3s, color 0.3s, transform 0.3s, box-shadow 0.3s;
        }

        button:hover {
            background-color: #00e5ff; /* Bright cyan background on hover */
            color: #1e1e1e; /* Dark gray text color on hover */
            transform: scale(1.1);
            box-shadow: 0 0 20px #00e5ff; /* Bright cyan shadow on hover */
        }
    </style>
</head>
<body>
    <div class="image-container"></div>
    <div class="content-container">
        <div class="heading-container">
            <h2>Deposit</h2>
            <hr>
        </div>
        <form action="${pageContext.request.contextPath}/customer/deposit" method="post">
            <input type="number" name="amount" placeholder="Amount" min="1" step="0.01" required>
            <button type="submit">Deposit</button>
        </form>
    </div>
</body>
</html>
