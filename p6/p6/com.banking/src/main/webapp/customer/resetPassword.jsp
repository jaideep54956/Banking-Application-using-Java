<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Password Reset</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #0e0e0e; /* Dark gray background color */
            color: #ffffff; /* White text color */
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        h2 {
            color: #eef3f3; /* Light gray header color */
        }

        .form-container {
            margin-top: 20px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: rgba(30, 30, 30, 0.7); /* Dark gray semi-transparent background */
            text-align: center;
            width: 90%;
            max-width: 800px; /* Maximum width for the form container */
            display: flex;
            flex-direction: row; /* Display form and image side by side */
            align-items: center;
        }

        .form-container .image-container {
            flex: 1; /* Take up remaining space */
            padding: 20px; 
            padding-right: 20px; /* Add padding around the image */
            display: flex;
            justify-content: center;
        }

        .form-container img {
            width: 100%; /* Ensure the image fills its container */
            max-width: 100%; /* Prevent the image from exceeding its original size */
            height: auto; /* Maintain aspect ratio */
            border-radius: 10px; /* Rounded corners */
            object-fit: cover; /* Cover the container with the image */
            transition: .5s; /* Add transition for smoother animation */
            animation: turner 20s infinite; /* Apply the animation */
        }

        /* Keyframes for the spinning animation */
        @keyframes turner {
            0%   { transform: rotateY(0deg); }
            10%  { transform: rotateY(0deg); }
            50%  { transform: rotateY(360deg); }
            60%  { transform: rotateY(360deg); }
            100% { transform: rotateY(0deg); }
        }

        .container {
            position: relative;
            perspective: 800px;
            margin: 0 auto;
            width: 50%;
        }

        .wrapper {
            width: 400px;
            height: 400px;
            position: absolute;
            transform-style: preserve-3d;
            transition: transform 1s;
        }

        .wrapper div {
            width: 400px;
            height: 10px; /* 50 divisions */
            background-image: url('http://www.bell.ca/Styles/wireless/all_languages/all_regions/catalog_images/Pixel_by_Google/google_pixel_very_silver_lrg1.png');
            background-size: cover;
            backface-visibility: visible;
            animation: turner 20s infinite;
        }

        .one { background-position: 0 0; }
        .one1 { background-position: 0 -100%; animation-delay: .1s; }
        .one2 { background-position: 0 -200%; animation-delay: .2s; }
        .one3 { background-position: 0 -300%; animation-delay: .3s; }
        .one4 { background-position: 0 -400%; animation-delay: .4s; }
        .one5 { background-position: 0 -500%; animation-delay: .5s; }
        .one6 { background-position: 0 -600%; animation-delay: .6s; }
        .one7 { background-position: 0 -700%; animation-delay: .7s; }
        .one8 { background-position: 0 -800%; animation-delay: .8s; }
        .one9 { background-position: 0 -900%; animation-delay: .9s; }
        .one10 { background-position: 0 -1000%; animation-delay: 1s; }
        .one11 { background-position: 0 -1100%; animation-delay: 1.1s; }
        .one12 { background-position: 0 -1200%; animation-delay: 1.2s; }
        .one13 { background-position: 0 -1300%; animation-delay: 1.3s; }
        .one14 { background-position: 0 -1400%; animation-delay: 1.4s; }
        .one15 { background-position: 0 -1500%; animation-delay: 1.5s; }
        .one16 { background-position: 0 -1600%; animation-delay: 1.6s; }
        .one17 { background-position: 0 -1700%; animation-delay: 1.7s; }
        .one18 { background-position: 0 -1800%; animation-delay: 1.8s; }
        .one19 { background-position: 0 -1900%; animation-delay: 1.9s; }
        .one20 { background-position: 0 -2000%; animation-delay: 2s; }
        .one21 { background-position: 0 -2100%; animation-delay: 2.1s; }
        .one22 { background-position: 0 -2200%; animation-delay: 2.2s; }
        .one23 { background-position: 0 -2300%; animation-delay: 2.3s; }
        .one24 { background-position: 0 -2400%; animation-delay: 2.4s; }
        .one25 { background-position: 0 -2500%; animation-delay: 2.5s; }
        .one26 { background-position: 0 -2600%; animation-delay: 2.6s; }
        .one27 { background-position: 0 -2700%; animation-delay: 2.7s; }
        .one28 { background-position: 0 -2800%; animation-delay: 2.8s; }
        .one29 { background-position: 0 -2900%; animation-delay: 2.9s; }
        .one30 { background-position: 0 -3000%; animation-delay: 3s; }
        .one31 { background-position: 0 -3100%; animation-delay: 3.1s; }
        .one32 { background-position: 0 -3200%; animation-delay: 3.2s; }
        .one33 { background-position: 0 -3300%; animation-delay: 3.3s; }
        .one34 { background-position: 0 -3400%; animation-delay: 3.4s; }
        .one35 { background-position: 0 -3500%; animation-delay: 3.5s; }
        .one36 { background-position: 0 -3600%; animation-delay: 3.6s; }
        .one37 { background-position: 0 -3700%; animation-delay: 3.7s; }
        .one38 { background-position: 0 -3800%; animation-delay: 3.8s; }
        .one39 { background-position: 0 -3900%; animation-delay: 3.9s; }
        .one40 { background-position: 0 -4000%; animation-delay: 4s; }
        .one41 { background-position: 0 -4100%; animation-delay: 4.1s; }
        .one42 { background-position: 0 -4200%; animation-delay: 4.2s; }
        .one43 { background-position: 0 -4300%; animation-delay: 4.3s; }
        .one44 { background-position: 0 -4400%; animation-delay: 4.4s; }
        .one45 { background-position: 0 -4500%; animation-delay: 4.5s; }
        .one46 { background-position: 0 -4600%; animation-delay: 4.6s; }
        .one47 { background-position: 0 -4700%; animation-delay: 4.7s; }
        .one48 { background-position: 0 -4800%; animation-delay: 4.8s; }
        .one49 { background-position: 0 -4900%; animation-delay: 4.9s; }

        .form-content {
            flex: 1; /* Take up remaining space */
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            color: #eef3f3; /* Light gray label color */
            text-align: left; /* Align labels to the left */
            display: block; /* Make labels block elements */
            margin-bottom: 5px; /* Add space between labels */
        }

        input[type="text"], input[type="password"], button {
            margin: 10px 0;
            padding: 12px; /* Adjusted padding */
            width: 100%;
            border: 1px solid #f5f8f9; /* Light gray border */
            border-radius: 5px;
            font-size: 16px; /* Increased font size */
            background-color: #1e1e1e; /* Dark gray background for input and button */
            color: #ffffff; /* White text color for input and button */
            transition: box-shadow 0.3s, transform 0.3s;
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
            font-size: 18px; /* Increased font size */
            padding: 12px 24px; /* Adjusted padding for button */
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
    <h2>Reset Password</h2>
    
    <div class="form-container">
        <div class="image-container">
            <img src="https://img.freepik.com/free-vector/forgot-password-concept-illustration_114360-1095.jpg" alt="Password Reset Illustration">
        </div>
        
        <div class="form-content">
            <label for="accountNo">Account Number:</label>
            <input type="text" id="accountNo" name="accountNo" required>
            
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
            
            <button type="submit">Reset Password</button>
        </div>
    </div>
</body>
</html>
