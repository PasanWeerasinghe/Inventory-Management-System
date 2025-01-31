<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Inventory Management System</title>
    <style>
        /* Global Styles */
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

        /* Main Content Styling */
        .main-content {
            max-width: 800px;
            padding: 20px;
            margin: 40px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .main-content h2 {
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .main-content p {
            font-size: 16px;
            color: #666;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        /* Benefits Section Styling */
        .benefits {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }

        .benefit-item {
            background: #f9fafb;
            padding: 15px;
            border-radius: 8px;
            width: 90%;
            max-width: 600px;
            text-align: left;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
        }

        .benefit-item h3 {
            font-size: 18px;
            color: #333;
            margin-bottom: 10px;
        }

        .benefit-item p {
            font-size: 14px;
            color: #555;
            margin: 0;
        }

        /* Back Button Styling */
        .back-button {
            margin-top: 30px;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
        }

        .back-button:hover {
            background-color: #388E3C;
        }

        /* Footer styling */
        .footer {
            margin-top: 40px;
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
        <h1>About Inventory Management System</h1>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2>Our Mission</h2>
        <p>
            The Inventory Management System is designed to streamline and simplify the way you manage your inventory. 
            Our goal is to provide a reliable, user-friendly, and powerful solution that meets the diverse needs of 
            businesses in various industries.
        </p>

        <h2>Features & Benefits</h2>
        <div class="benefits">
            <div class="benefit-item">
                <h3>Real-Time Inventory Tracking</h3>
                <p>Stay updated on stock levels and monitor inventory movements in real-time, ensuring optimal stock availability.</p>
            </div>
            <div class="benefit-item">
                <h3>Efficient Management of Orders</h3>
                <p>Manage purchase orders, sales orders, and stock transfers with ease, reducing operational bottlenecks.</p>
            </div>
            <div class="benefit-item">
                <h3>Data-Driven Insights</h3>
                <p>Analyze inventory trends, generate reports, and make data-driven decisions to enhance your business operations.</p>
            </div>
            <div class="benefit-item">
                <h3>Secure and Scalable</h3>
                <p>Our system is built with top security practices and can scale as your business grows.</p>
            </div>
        </div>

        <!-- Back Button -->
        <a href="index.jsp" class="back-button">Back to Home</a>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Inventory Management System. All Rights Reserved.</p>
    </div>

</body>
</html>
