<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="javax.sql.DataSource" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Items</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        h2 {
            color: #4CAF50;
            margin-top: 20px;
        }

        .items-table {
            width: 80%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .items-table th, .items-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .items-table th {
            background-color: #4CAF50;
            color: white;
        }

        .items-table tr:hover {
            background-color: #f1f1f1;
        }

        .back-btn {
            margin-top: 20px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<h2>Inventory Items</h2>

<table class="items-table">
    <thead>
        <tr>
            <th>Item ID</th>
            <th>Item Name</th>
            <th>Description</th>
            <th>Quantity</th>
            <th>Price</th>
        </tr>
    </thead>
    <tbody>
        <%
            
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/inventery"; 
            String user = "root"; 
            String password = ""; 

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                String query = "SELECT * FROM items"; // Make sure this matches your table name
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();

                // Loop through the result set and display items in the table
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("itemId") %></td>
                        <td><%= rs.getString("itemName") %></td>
                        <td><%= rs.getString("description") %></td>
                        <td><%= rs.getInt("quantity") %></td>
                        <td>Rs.<%= rs.getDouble("price") %></td>
                    </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='5'>Error retrieving items: " + e.getMessage() + "</td></tr>");
            } finally {
                // Close resources
                if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                if (ps != null) try { ps.close(); } catch (SQLException ignored) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
            }
        %>
    </tbody>
</table>

<a href="inventory.jsp" class="back-btn">Back to Dashboard</a>

</body>
</html>
