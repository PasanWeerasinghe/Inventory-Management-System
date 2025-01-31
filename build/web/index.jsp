<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Management System</title>
    <style>
        /* Reset and global styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f3f4f6;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        /* Header styling */
        .header {
            width: 100%;
            padding: 20px;
            background: #4CAF50;
            color: white;
            text-align: center;
        }

        .header h1 {
            font-size: 28px;
            margin: 0;
        }

        /* Welcome section */
        .welcome-section {
            text-align: center;
            margin-top: 40px;
        }

        .welcome-section h2 {
            font-size: 24px;
            color: #4CAF50;
            margin-bottom: 10px;
        }

        .welcome-section p {
            font-size: 16px;
            color: #666;
            max-width: 600px;
            margin: 0 auto 20px;
        }

        /* Quick links styling */
        .quick-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .quick-link {
            background: #fff;
            border-radius: 10px;
            width: 200px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .quick-link:hover {
            transform: translateY(-5px);
        }

        .quick-link a {
            text-decoration: none;
            color: #333;
            font-size: 18px;
            display: block;
            margin-top: 10px;
            color: #4CAF50;
            font-weight: bold;
        }

        /* About section styling */
        .about-section {
            margin-top: 60px;
            max-width: 800px;
            text-align: center;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .about-section h3 {
            font-size: 22px;
            color: #333;
            margin-bottom: 15px;
        }

        .about-section p {
            font-size: 16px;
            color: #666;
            line-height: 1.6;
        }

        /* Footer styling */
        .footer {
            margin-top: auto;
            padding: 15px;
            width: 100%;
            text-align: center;
            background: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h1>Inventory Management System</h1>
    </div>

    <!-- Welcome Section -->
    <div class="welcome-section">
        <h2>Welcome to the Inventory Management System</h2>
        <p>
            A comprehensive solution to track, manage, and streamline your inventory processes.
            Log in to access the dashboard or learn more about our system below.
        </p>
    </div>

    <!-- Quick Links -->
    <div class="quick-links">
        <div class="quick-link">
            <a href="signin.jsp">Sign In</a>
        </div>
        <div class="quick-link">
            <a href="signup.jsp">Sign Up</a>
        </div>
        <div class="quick-link">
            <a href="about.jsp">Learn More</a>
        </div>
    </div>

    <!-- About Section -->
    <div class="about-section">
        <h3>About Our Inventory Management System</h3>
        <p>
            Our Inventory Management System is designed to offer an intuitive and efficient experience for managing your inventory. 
            From tracking items to generating reports, our system empowers you to gain control over your resources. 
            Whether you’re handling products, supplies, or assets, this system simplifies inventory tasks, 
            helping your business stay organized, save time, and make data-driven decisions.
        </p>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Inventory Management System. All Rights Reserved.</p>
    </div>

</body>
</html>
