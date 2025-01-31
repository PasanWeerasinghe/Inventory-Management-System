<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Order</title>
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

        .form-container {
            max-width: 400px;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            color: black;
        }

        .form-container label {
            font-weight: bold;
        }

        .form-container input, .form-container select, .form-container button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-container button {
            background-color: #00d4ff;
            color: white;
            font-weight: bold;
            border: none;
        }

        .form-container button:hover {
            background-color: #007bff;
        }
    </style>
</head>
<body>
<h2>Update Order</h2>
<div class="form-container">
    <%
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String status = "";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventery", "root", "");

            String query = "SELECT status FROM orders WHERE order_id = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();

            if (rs.next()) {
                status = rs.getString("status");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    %>

    <form action="UpdateOrderServlet" method="post">
    <input type="hidden" name="orderId" value="<%= orderId %>" />

    <label for="status">Update Status:</label>
    <select name="status" id="status">
        <option value="Pending">Pending</option>
        <option value="Processed">Processed</option>
        <option value="Shipped">Shipped</option>
        <option value="Delivered">Delivered</option>
    </select>
    <button onclick="return confirm('Order status updated successfully.')" type="submit">Update</button>
</form>
</div>
</body>
</html>
