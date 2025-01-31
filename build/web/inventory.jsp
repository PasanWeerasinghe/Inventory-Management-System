<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Inventory Management System</title>
    <style>
        /* Global Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: #eef1f7;
            color: #333;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        /* Navigation Bar */
        .navbar {
            height: 60px;
            background: linear-gradient(135deg, #2d3e50, #4CAF50);
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar h1 {
            font-size: 20px;
        }

        .navbar .links a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
            font-size: 16px;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .navbar .links a:hover {
            color: #ffeb3b;
        }

        /* Main Container */
        .container {
            display: flex;
            flex: 1;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background: #4CAF50;
            padding: 20px;
            color: white;
            display: flex;
            flex-direction: column;
        }

        .sidebar h2 {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .sidebar a {
            text-decoration: none;
            color: white;
            padding: 10px 15px;
            margin: 5px 0;
            border-radius: 5px;
            font-size: 15px;
            font-weight: 500;
            transition: background 0.3s ease;
        }

        .sidebar a:hover {
            background: #388e3c;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 20px;
            background: #f9fafc;
            border-left: 1px solid #ddd;
            overflow-y: auto;
        }

        .main-content h2 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        /* Cards Section */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card h3 {
            font-size: 18px;
            margin-bottom: 10px;
            color: #4CAF50;
        }

        .card p {
            font-size: 16px;
            color: #555;
        }

        /* Footer */
        .footer {
            background: #2d3e50;
            color: white;
            text-align: center;
            padding: 10px 0;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <h1>Inventory Management System</h1>
        <div class="links">
            <a href="inventory.jsp">Dashboard</a>
            <a href="addnewitem.jsp">Add Item</a>
            <a href="viewItems.jsp">View Items</a>
            <a href="report.jsp">Reports</a>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>

    <!-- Main Container -->
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <h2>Quick Links</h2>
            <a href="inventory.jsp">Dashboard</a>
            <a href="manageInventory.jsp">Inventory Management</a>
            <a href="usermanage.jsp">User Management</a>
            <a href="ordermanage.jsp">Order Management</a>
            <a href="analytics.jsp">Analytics</a>
            <a href="notifications.jsp">Notifications</a>
            <a href="settings.jsp">Settings</a>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <h2>Dashboard Overview</h2>

            <!-- Dashboard Cards -->
            <div class="cards">
                <div class="card">
                    <h3>Total Items</h3>
                    <p>20</p>
                </div>
                <div class="card">
                    <h3>Low Stock Items</h3>
                    <p>8</p>
                </div>
                <div class="card">
                    <h3>Recent Sales</h3>
                    <p>Rs. 8,200</p>
                </div>
                <div class="card">
                    <h3>Pending Orders</h3>
                    <p>9</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Inventory Management System. All Rights Reserved.</p>
    </div>
</body>
</html>
