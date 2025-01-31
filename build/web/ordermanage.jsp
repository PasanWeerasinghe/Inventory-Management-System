<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #3a6073, #16222a);
            color: white;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #00d4ff;
        }

        .order-table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: white;
            color: black;
            border-radius: 5px;
            overflow: hidden;
        }

        .order-table th, .order-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .order-table th {
            background-color: #00d4ff;
            color: white;
        }

        .order-table tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            
            padding: 5px 10px;
            color: white;
            text-decoration: none;
            border-radius: 3px;
            margin: 0 5px;
        }

        .btn-update {
            background-color: #28a745;
        }

        .btn-report {
            background-color: #007bff;
        }

        .btn-delete {
            background-color: #dc3545;
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

<h2>Order Management</h2>

<table class="order-table">
    <thead>
    <tr>
        <th>Order ID</th>
        <th>Customer Name</th>
        <th>Order Date</th>
        <th>Status</th>
        <th>Total</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String dbURL = "jdbc:mysql://localhost:3306/inventery"; // Replace with your DB URL
        String dbUser = "root"; // Replace with your DB username
        String dbPassword = ""; // Replace with your DB password

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String query = "SELECT * FROM orders"; // Make sure this matches your table name
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("order_id") %></td>
        <td><%= rs.getString("customer_name") %></td>
        <td><%= rs.getDate("order_date") %></td>
        <td><%= rs.getString("status") %></td>
        <td>Rs.<%= rs.getDouble("total") %></td>
        <td>
            <a href="orderUpdate.jsp?orderId=<%= rs.getInt("order_id") %>" class="btn btn-update">Update</a>
            <a href="orderReport.jsp?orderId=<%= rs.getInt("order_id") %>" class="btn btn-report">Report</a>
            <a href="orderDelete.jsp?orderId=<%= rs.getInt("order_id") %>" 
               onclick="return confirm('Are you sure you want to delete this order?')" 
               class="btn btn-delete">Delete</a>
        </td>
    </tr>
    <%
            }
        } catch (Exception e) {
            out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
            if (ps != null) try { ps.close(); } catch (SQLException ignored) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
        }
    %>
    </tbody>
</table>

<div class="actions">
    <a href="inventory.jsp" class="btn btn-update">Back to Dashboard</a>
</div>

</body>
</html>
