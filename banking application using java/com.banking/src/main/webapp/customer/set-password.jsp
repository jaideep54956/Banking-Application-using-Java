<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Set New Password</title>
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
            color: #333;
            overflow: hidden; /* Prevent scrollbars from appearing due to the pseudo-element */
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1JaxA1t9XkDa6LXGDfrYK2BvjJQc7B1BYsCsvg0Qy8ZSetZo0Rea-0j8Ypa72_pyvFLc&usqp=CAU') no-repeat center center fixed;
            background-size: cover;
            filter: blur(8px);
            z-index: -1; /* Place behind the content */
        }

        h2 {
            margin-bottom: 20px;
            color: #4CAF50;
            animation: fadeIn 1s ease-out;
        }

        .container {
            background: rgba(255, 255, 255, 0.9); /* Slightly transparent background */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            animation: fadeIn 1s ease-out;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input[type="password"] {
            margin: 10px 0;
            padding: 15px;
            width: 90%;
            max-width: 400px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: box-shadow 0.3s, transform 0.3s;
        }

        input[type="password"]:focus {
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
            transform: scale(1.02);
        }

        button {
            padding: 15px 30px;
            border: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Set New Password</h2>
        <form action="${pageContext.request.contextPath}/customer/set-password" method="post">
            <input type="password" name="newPassword" placeholder="New Password" required>
            <input type="password" name="confirmPassword" placeholder="Confirm Password" required>
            <button type="submit">Set Password</button>
        </form>
    </div>
</body>
</html>
