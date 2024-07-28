<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Future of Digital Banking</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #0e0e0e;
            color: #ffffff;
            overflow: hidden; /* Prevent scrollbars due to animations */
        }
        header {
            position: relative;
            height: 100vh; /* Makes the header occupy the entire viewport height */
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://media.licdn.com/dms/image/D5612AQHZbnxf_vAqtg/article-cover_image-shrink_720_1280/0/1684958850351?e=2147483647&v=beta&t=Ca6AVbyij9eU5KtbumTYJF-2Ijn7DXIse-jlFeSwg-M') no-repeat center center;
            background-size: cover;
            z-index: 1;
            opacity: 0.7;
            animation: backgroundMotion 30s infinite alternate; /* Apply background animation */
        }
        @keyframes backgroundMotion {
            0% {
                transform: scale(1) translateY(0);
                background-position: center;
            }
            50% {
                transform: scale(1.1) translateY(-10%);
                background-position: center 10%;
            }
            100% {
                transform: scale(1) translateY(0);
                background-position: center;
            }
        }
        .header-content {
            position: relative;
            z-index: 2;
            text-align: center;
            padding: 0 20px;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: #eef3f3;
            animation: fadeIn 3s ease-in-out; /* Apply fade-in animation */
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
        .header-content h1 {
            font-size: 5em;
            margin: 0.5em 0;
            position: relative;
            overflow: hidden;
            border: 2px solid #f5f8f9;
            padding: 10px;
            animation: combinedSlideOut 4s ease-out; /* Apply combined slide-out animation */
        }
        @keyframes combinedSlideOut {
            0% {
                clip-path: inset(0 100% 0 0);
                border-width: 2px 2px 2px 2px;
            }
            25% {
                clip-path: inset(0 0 0 100%);
                border-width: 2px 2px 2px 2px;
            }
            50% {
                clip-path: inset(100% 0 0 0);
                border-width: 2px 2px 2px 2px;
            }
            75% {
                clip-path: inset(0 100% 100% 0);
                border-width: 2px 2px 2px 2px;
            }
            100% {
                clip-path: inset(0 0 0 0);
                border-width: 2px 2px 2px 2px;
            }
        }
        .header-content a {
            display: inline-block;
            padding: 15px 30px;
            margin: 10px;
            text-decoration: none;
            color: #ffffff;
            background-color: #1e1e1e;
            border: 2px solid #00e5ff;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease; /* Add transition for scale effect */
            animation: pulse 2s infinite; /* Apply pulse animation */
        }
        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }
        .header-content a:hover {
            background-color: #00e5ff;
            color: #1e1e1e;
            transform: scale(1.05); /* Slightly enlarge on hover */
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <h1>Future of Digital Banking</h1>
            <a href="admin/login.jsp" class="button">Admin Login</a>
            <a href="customer/login.jsp" class="button">Customer Login</a>
        </div>
    </header>
</body>
</html>