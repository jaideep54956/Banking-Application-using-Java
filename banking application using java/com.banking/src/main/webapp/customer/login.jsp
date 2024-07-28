<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login</title>
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
            background: url('https://img.freepik.com/free-vector/geometric-gradient-futuristic-background_23-2149116406.jpg') no-repeat center center fixed;
            background-size: cover;
            background-color: #002147; /* Blue background color */
            overflow: hidden;
            color: #ffffff; /* White text color */
        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://img.freepik.com/free-vector/geometric-gradient-futuristic-background_23-2149116406.jpg') no-repeat center center fixed;
            background-size: cover;
            filter: blur(8px); /* Blur effect for the background image */
            z-index: -1; /* Place behind the content */
        }

        h2 {
            margin-bottom: 30px;
            font-size: 3rem; /* Larger font size */
            font-weight: bold; /* Bold font weight */
            color: #f8faf8; /* Light gray color */
            animation: fadeIn 1s ease-out, moveUp 0.8s cubic-bezier(0.25, 0.46, 0.45, 0.94) both; /* Fade-in and move-up animation */
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes moveUp {
            from { transform: translateY(50px); }
            to { transform: translateY(0); }
        }

        form {
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            backdrop-filter: blur(8px); /* Blur effect for modern browsers */
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 90%;
            max-width: 400px;
            animation: fadeIn 1s ease-out; /* Fade-in animation */
        }

        input[type="text"], input[type="password"], button {
            margin: 10px 0;
            padding: 15px;
            width: 100%;
            border: 1px solid #23c0f4; /* Light gray border */
            border-radius: 5px;
            font-size: 16px;
            background-color: rgba(30, 30, 30, 0.7); /* Dark gray background for input and button */
            color: #ffffff; /* White text color for input and button */
            transition: box-shadow 0.3s, transform 0.3s;
            animation: inputFadeIn 1s ease-out forwards; /* Fade-in animation for inputs */
        }

        @keyframes inputFadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        input[type="text"]:focus, input[type="password"]:focus, button:focus {
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            transform: scale(1.02);
        }

        button {
            margin-top: 20px;
            border: 2px solid #00e5ff; /* Bright cyan border */
            background-color: #1e1e1e; /* Dark gray background */
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            font-size: 16px;
        }

        button:hover {
            background-color: #00e5ff; /* Bright cyan background on hover */
            color: #1e1e1e; /* Dark gray text color on hover */
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <h2>Customer Login</h2>
    <form action="${pageContext.request.contextPath}/customer/login" method="post">
        <input type="text" name="accountNo" placeholder="Account Number" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>
</body>
</html>
