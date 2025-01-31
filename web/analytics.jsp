<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inventory Analytics</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #2193b0, #6dd5ed);
            color: #fff;
            text-align: center;
            padding: 20px;
        }

        h2 {
            margin-top: 20px;
        }
        .btn {
            background-color: #4CAF50;
            padding: 5px 10px;
            color: white;
            text-decoration: none;
            border-radius: 3px;
            margin: 0 5px;
        }

        .analytics-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 30px;
        }

        .analytics-card {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
            width: 300px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: left;
        }

        .analytics-card h3 {
            margin: 0 0 10px 0;
            color: #fff;
        }

        .analytics-card p {
            margin: 5px 0;
        }
        .btn:hover {
            opacity: 0.9;
        }

        .actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>Inventory Analytics</h2>
    <div class="actions">
    <a href="inventory.jsp" class="btn btn-update">Back to Dashboard</a>
</div>

    <div class="analytics-container">
        <%
            // Database connection setup
            String url = "jdbc:mysql://localhost:3306/inventery";
            String user = "root";
            String password = "";
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            // Analytics data placeholders
            int totalItems = 0;
            double totalValue = 0.0;
            double highestPrice = 0.0;
            String highestPricedItem = "";
            double lowestPrice = Double.MAX_VALUE;
            String lowestPricedItem = "";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                stmt = conn.createStatement();

                // Total items and total value
                rs = stmt.executeQuery("SELECT COUNT(*) AS totalItems, SUM(price * quantity) AS totalValue FROM items");
                if (rs.next()) {
                    totalItems = rs.getInt("totalItems");
                    totalValue = rs.getDouble("totalValue");
                }

                // Highest priced item
                rs = stmt.executeQuery("SELECT itemName, price FROM items ORDER BY price DESC LIMIT 1");
                if (rs.next()) {
                    highestPricedItem = rs.getString("itemName");
                    highestPrice = rs.getDouble("price");
                }

                // Lowest priced item
                rs = stmt.executeQuery("SELECT itemName, price FROM items ORDER BY price ASC LIMIT 1");
                if (rs.next()) {
                    lowestPricedItem = rs.getString("itemName");
                    lowestPrice = rs.getDouble("price");
                }

            } catch (Exception e) {
                out.println("<p>Error retrieving analytics data: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException ignored) { }
            }
        %>

        <!-- Display Analytics -->
        <div class="analytics-card">
            <h3>Total Items</h3>
            <p><%= totalItems %></p>
        </div>
        <div class="analytics-card">
            <h3>Total Inventory Value</h3>
            <p>Rs. <%= String.format("%.2f", totalValue) %></p>
        </div>
        <div class="analytics-card">
            <h3>Highest Priced Item</h3>
            <p><strong><%= highestPricedItem %></strong> - Rs. <%= String.format("%.2f", highestPrice) %></p>
        </div>
        <div class="analytics-card">
            <h3>Lowest Priced Item</h3>
            <p><strong><%= lowestPricedItem %></strong> - Rs. <%= String.format("%.2f", lowestPrice) %></p>
        </div>
    </div>
</body>
</html>

