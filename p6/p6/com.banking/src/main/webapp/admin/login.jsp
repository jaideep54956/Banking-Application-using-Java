<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: flex-end; /* Align items to the end (right) */
            justify-content: center;
            height: 100vh;
            color: #ffffff; /* White text color for consistency */
            overflow: hidden;
            background-color: #3d3d3d; /* Fallback color */
            background-image: url('https://static.vecteezy.com/system/resources/previews/012/410/341/non_2x/premium-security-cyber-digital-concept-abstract-technology-background-protect-system-innovation-for-business-illustration-vector.jpg'); /* Background image */
            background-size: cover; /* Cover the entire viewport */
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Prevent tiling */
        }

        h2 {
            position: relative;
            margin-bottom: 20px;
            color: #eef3f3; /* Light Gray */
            font-size: 2.5em; /* Adjusted size */
            text-align: center;
            opacity: 0; /* Initially hidden for entrance animation */
            animation: fadeIn 1s forwards; /* Fade-in animation */
            animation-delay: 0.5s; /* Delay to ensure it fades in after other animations */
        }

        h2::after {
            content: "";
            display: block;
            width: 100%;
            height: 3px;
            background: #00e5ff; /* Bright Cyan */
            position: absolute;
            bottom: -10px; /* Position the underline below the heading */
            left: 0;
            transform: scaleX(0);
            transform-origin: left;
            animation: underlineAnimation 2s infinite ease-in-out; /* Continuous underline animation */
        }

        @keyframes formEntrance {
            from {
                transform: translateX(50px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes underlineAnimation {
            0% {
                transform: scaleX(0);
                opacity: 0.5;
            }
            50% {
                transform: scaleX(1);
                opacity: 1;
            }
            100% {
                transform: scaleX(0);
                opacity: 0.5;
            }
        }

        form {
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-right: 65%; /* Adjust this value as needed to move the form towards the right */
            opacity: 0; /* Initially hidden for entrance animation */
            animation: formEntrance 1s forwards; /* Form entrance animation */
            animation-delay: 1s; /* Delay to ensure form entrance happens after heading */
        }

        input[type="text"], input[type="password"] {
            margin: 10px 0;
            padding: 15px;
            width: 90%;
            max-width: 400px;
            border: 2px solid transparent; /* Transparent border for gradient effect */
            border-radius: 5px;
            font-size: 16px;
            background: #ffffff; /* White background for input fields */
            color: #1e1e1e; /* Dark Gray text for input fields */
            transition: border-color 0.3s, box-shadow 0.3s, transform 0.3s;
            position: relative;
            overflow: hidden; /* Hide overflow for pseudo-element animation */
        }

        input[type="text"]::placeholder, input[type="password"]::placeholder {
            color: #bbb; /* Light gray placeholder text */
            transition: transform 0.3s, font-size 0.3s;
        }

        input[type="text"]:focus::placeholder, input[type="password"]:focus::placeholder {
            transform: translateY(-20px);
            font-size: 12px;
            color: #505151; /* Bright Cyan for focus */
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #00e5ff; /* Bright Cyan border on focus */
            box-shadow: 0 0 10px rgba(0, 229, 255, 0.5); /* Glow effect */
            transform: scale(1.03) rotateX(2deg) rotateY(2deg); /* 3D transform */
            outline: none;
        }

        button {
            padding: 15px 30px;
            border: 2px solid #00e5ff; /* Bright Cyan border */
            background-color: #00e5ff; /* Bright Cyan */
            color: #1e1e1e; /* Dark Gray */
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s, border-color 0.3s;
        }

        button:hover {
            background-color: #1e1e1e; /* Dark Gray */
            color: #00e5ff; /* Bright Cyan */
            border-color: #00e5ff; /* Dark Gray border on hover */
            transform: scale(1.05); /* Slightly enlarge button */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Shadow effect */
        }
    </style>
</head>
<body>
    <form action="${pageContext.request.contextPath}/admin/login" method="post">
        <h2>Admin Login</h2>
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>
</body>
</html>
