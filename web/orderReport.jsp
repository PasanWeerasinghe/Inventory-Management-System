<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Generate Order Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #3a6073, #16222a);
            color: white;
            padding: 20px;
            
            
            
        }

        h2 {
            text-align: center;
            color: #00d4ff;
        }

        .report-container {
            max-width: 600px;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            color: black;
        }

        .report-container table {
            width: 100%;
            border-collapse: collapse;
        }

        .report-container th, .report-container td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        .report-container th {
            background-color: #00d4ff;
            color: white;
        }
        

        .back-btn {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            margin: 10px;
            
        }

        
    </style>
</head>
<body>
<h2>Order Report</h2>
<div class="report-container">
    <table>
        <%
            int orderId = Integer.parseInt(request.getParameter("orderId"));

            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventery", "root", "");

                String query = "SELECT * FROM orders WHERE order_id = ?";
                ps = conn.prepareStatement(query);
                ps.setInt(1, orderId);
                rs = ps.executeQuery();

                if (rs.next()) {
        %>
        <tr>
            <th>Order ID</th>
            <td><%= rs.getInt("order_id") %></td>
        </tr>
        <tr>
            <th>Customer Name</th>
            <td><%= rs.getString("customer_name") %></td>
        </tr>
        <tr>
            <th>Order Date</th>
            <td><%= rs.getDate("order_date") %></td>
        </tr>
        <tr>
            <th>Status</th>
            <td><%= rs.getString("status") %></td>
        </tr>
        <tr>
            <th>Total</th>
            <td>Rs.<%= rs.getDouble("total") %></td>
        </tr>
        <%
                } else {
                    out.println("<p>Order not found.</p>");
                }
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            }
        %>
    </table>
    
</div>
    <a href="ordermanage.jsp" class="back-btn">Back to Order Management</a>
</body>
</html>
