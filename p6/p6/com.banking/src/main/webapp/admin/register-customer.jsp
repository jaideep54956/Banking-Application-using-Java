<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #4e4e4e; /* Dark Gray Background */
            background-image: url("https://m.economictimes.com/thumb/msid-99905852,width-1200,height-900,resizemode-4,imgsize-98080/bank.jpg");
            background-size: cover;
            color: #ffffff; /* White Text Color */
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center; /* Center vertically */
            justify-content: center; /* Center horizontally */
            height: 100vh;
            overflow: hidden;
        }

        .scroll-container {
            max-height: 90vh;
            overflow-y: auto;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Align to top */
            padding: 20px 0; /* Add padding to ensure the container is fully visible */
        }

        .content {
            background: rgba(0, 0, 0, 0.6); /* Semi-transparent background */
            padding: 20px; /* Reduced padding */
            border-radius: 10px;
            text-align: center;
            animation: slideIn 1s forwards;
            opacity: 0;
            width: 90%;
            max-width: 400px; /* Adjust width as needed */
            transform: scale(0.9);
        }

        .image-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        .image-container img {
            width: 100px; /* Adjust size as needed */
            height: 100px; /* Ensure circular frame */
            border-radius: 50%; /* Circular frame */
            border: 2px solid #00e5ff; /* Bright Cyan border */
        }

        h2 {
            margin-bottom: 20px;
            color: #eef3f3; /* Light Gray */
            font-size: 2.5em; /* Adjusted size */
            text-align: center;
            position: relative;
            animation: fadeIn 1s forwards, textPulse 3s infinite;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes textPulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.8; }
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(50px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input[type="text"], input[type="tel"], input[type="email"], input[type="number"], input[type="date"], select {
            margin: 10px 0;
            padding: 15px;
            width: 90%;
            max-width: 350px;
            border: 2px solid transparent;
            border-radius: 5px;
            font-size: 16px;
            background: #ffffff; /* White background for input fields */
            color: #1e1e1e; /* Dark Gray text for input fields */
            position: relative;
            transition: all 0.3s ease-in-out;
        }

        input[type="text"]:focus, input[type="tel"]:focus, input[type="email"]:focus, input[type="number"]:focus, input[type="date"]:focus, select:focus {
            border-color: #00e5ff; /* Bright Cyan border on focus */
            box-shadow: 0 0 10px rgba(0, 229, 255, 0.5); /* Glow effect */
            outline: none;
            transform: scale(1.05);
        }

        button {
            padding: 15px 30px;
            border: 2px solid #00e5ff; /* Bright Cyan border */
            background-color: #00e5ff; /* Bright Cyan */
            color: #1e1e1e; /* Dark Gray */
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease-in-out;
            position: relative;
            overflow: hidden;
        }

        button::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
        }

        button:hover::before {
            left: 100%;
        }

        button:hover {
            background-color: #1e1e1e; /* Dark Gray */
            color: #00e5ff; /* Bright Cyan */
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 229, 255, 0.3); /* Cyan shadow */
        }
    </style>
</head>
<body>
    <div class="scroll-container">
        <div class="content">
            <div class="image-container">
                <img src="https://cdn-icons-png.flaticon.com/512/9187/9187604.png" alt="Small Image"> <!-- Replace with your image URL -->
            </div>
            <h2>Register New Customer</h2>
            <form action="${pageContext.request.contextPath}/admin/register-customer" method="post">
                <input type="text" name="fullName" placeholder="Full Name" required>
                <input type="text" name="address" placeholder="Address" required>
                <input type="tel" name="mobileNo" placeholder="Mobile Number" required>
                <input type="email" name="email" placeholder="Email" required>
                <select name="accountType" required>
                    <option value="Savings">Savings Account</option>
                    <option value="Current">Current Account</option>
                </select>
                <input type="number" name="initialBalance" placeholder="Initial Balance" min="1000" required>
                <input type="date" name="dateOfBirth" required>
                <input type="text" name="idProof" placeholder="ID Proof" required>
                <button type="submit">Register Customer</button>
            </form>
        </div>
    </div>
</body>
</html>
