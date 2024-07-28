<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Withdraw</title>
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

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://media.tenor.com/vqoBF2RQ6McAAAAi/coin.gif') no-repeat center center fixed;
            background-size: cover;
            filter: blur(8px);
            z-index: -1; /* Place behind the content */
        }

        h2 {
            margin-bottom: 30px;
            color: #eef3f3; /* Light gray header color */
            animation: fadeIn 1s ease-out;
            border-bottom: 2px solid #f5f8f9; /* Light gray border color for header */
            padding-bottom: 10px;
        }

        .container {
            background: rgba(255, 255, 255, 0.1); /* Semi-transparent background for readability */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            width: 90%;
            max-width: 500px;
            animation: fadeIn 1s ease-out;
            position: relative;
            z-index: 1; /* Ensure it stays above the background */
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input[type="number"] {
            margin: 15px 0;
            padding: 15px;
            width: 100%;
            max-width: 400px;
            border: 2px solid #f5f8f9; /* Light gray border */
            border-radius: 5px;
            font-size: 16px;
            background-color: #1e1e1e; /* Dark gray background */
            color: #ffffff; /* White text color */
            transition: transform 0.3s, box-shadow 0.3s;
        }

        input[type="number"]:focus {
            transform: scale(1.02);
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
            outline: none;
        }

        button {
            padding: 15px 30px;
            border: 2px solid #00e5ff; /* Bright cyan border */
            background-color: #1e1e1e; /* Dark gray background */
            color: #ffffff; /* White text color */
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            font-size: 16px;
        }

        button:hover {
            background-color: #00e5ff; /* Bright cyan background on hover */
            color: #1e1e1e; /* Dark gray text color on hover */
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        .gif-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 300px; /* Adjust size as needed */
            height: auto;
            opacity: 0.5; /* Adjust opacity for blending effect */
            pointer-events: none; /* Ensure GIF does not interfere with interactions */
            z-index: 0; /* Ensure it is behind the main content */
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>WITHDRAW</h2>
        <form action="${pageContext.request.contextPath}/customer/withdraw" method="post">
            <input type="number" name="amount" placeholder="Amount" min="1" step="0.01" required>
            <button type="submit">Withdraw</button>
        </form>
    </div>
    <!-- Add the GIF here -->
    <img src="path-to-your-gif.gif" alt="Background GIF" class="gif-container">
</body>
</html>
