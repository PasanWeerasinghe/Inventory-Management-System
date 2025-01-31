<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inventory Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            color: #6a1b9a;
            text-align: center;
            padding: 20px;
        }

        h2 {
            margin-bottom: 20px;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 10px;
            border: 1px solid #ddd;
            color: #333;
            background-color: #fff;
        }

        table th {
            background-color: #6a1b9a;
            color: white;
        }

        .btn {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            margin: 10px;
        }

        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Inventory Report</h2>
    <table>
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
                // Database connection
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                String url = "jdbc:mysql://localhost:3306/inventery";
                String user = "root";
                String password = "";

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);
                    String query = "SELECT * FROM items";
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();

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
                    out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                }
            %>
        </tbody>
    </table>
    <a href="GenerateReportServlet" class="btn">Download Report</a>
    
    <a href="inventory.jsp" class="btn btn-update">Back to Dashboard</a>

</body>
</html>
