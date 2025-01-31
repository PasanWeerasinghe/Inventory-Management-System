<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Inventory</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            margin: auto;
            margin-top: 20px;
        }

        h2 {
            text-align: center;
            color: #6a1b9a;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        table th {
            background-color: #6a1b9a;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .form-container input, .form-container textarea, .form-container button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-container button {
            background-color: #6a1b9a;
            color: white;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #4e1173;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .btn-edit, .btn-delete {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

        .btn-edit {
            background-color: #4CAF50;
        }

        .btn-edit:hover {
            background-color: #45A049;
        }

        .btn-delete {
            background-color: #F44336;
        }

        .btn-delete:hover {
            background-color: #D32F2F;
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
    <div class="container">
        <h2>Manage Inventory</h2>

<!--         Form to Add Item 
        <div class="form-container">
            <h3>Add New Item</h3>
            <form action="AddItemServlet" method="post">
                <input type="text" name="itemName" placeholder="Item Name" required>
                <textarea name="description" rows="3" placeholder="Description" required></textarea>
                <input type="number" name="quantity" placeholder="Quantity" min="0" required>
                <input type="number" name="price" placeholder="Price" step="0.01" min="0" required>
                <button type="submit">Add Item</button>
            </form>
        </div>-->

        <!-- Inventory Items Table -->
        <table>
            <thead>
                <tr>
                    <th>Item ID</th>
                    <th>Item Name</th>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    String url = "jdbc:mysql://localhost:3306/inventery"; // Replace with your database URL
                    String user = "root"; // Replace with your database username
                    String password = ""; // Replace with your database password

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection(url, user, password);
                        String query = "SELECT * FROM items"; // Replace with your table name
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
                            <td>
                                <div class="action-buttons">
                                    <form action="EditItemServlet" method="get" style="display: inline;">
                                        <input type="hidden" name="itemId" value="<%= rs.getInt("itemId") %>">
                                        <button type="submit" class="btn-edit">Edit</button>
                                    </form>
                                    <form action="DeleteItemServlet" method="post" style="display: inline;">
                                        <input type="hidden" name="itemId" value="<%= rs.getInt("itemId") %>">
                                        <button type="submit" onclick="return confirm('Are you sure you want to delete this item?')"
                                                class="btn-delete">Delete</button>
                                    </form>
                                </div>
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
    <a href="inventory.jsp" class="btn btn-update">Back to Dashboard</a>

    </div>
            
</body>
</html>
