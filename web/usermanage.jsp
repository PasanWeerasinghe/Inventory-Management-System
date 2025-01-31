<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 80%;
            max-width: 800px;
        }

        h2 {
            color: #444;
            text-align: center;
            margin-bottom: 20px;
        }

        .user-table {
            width: 100%;
            border-collapse: collapse;
        }

        .user-table th, .user-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .user-table th {
            background-color: #ff7e5f;
            color: white;
        }

        .user-table tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            display: inline-block;
            padding: 8px 15px;
            background-color: #ff7e5f;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            margin: 5px;
            text-align: center;
        }

        .btn:hover {
            background-color: #feb47b;
        }

        .back-btn {
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            padding: 10px 20px;
            border-radius: 5px;
            text-align: center;
            margin-top: 20px;
        }

        .back-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>User Management</h2>

    <table class="user-table">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                String url = "jdbc:mysql://localhost:3306/inventery"; // Replace with your database details
                String user = "root"; // Replace with your database username
                String password = ""; // Replace with your database password

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);

                    String query = "SELECT id, username, email, role FROM users"; // Modify based on your table
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();

                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("username") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("role") %></td>
                            <td>
                                <a href="editUser.jsp?id=<%= rs.getInt("id") %>" class="btn">Edit</a>
                                <a href="deleteUser.jsp?id=<%= rs.getInt("id") %>" class="btn" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                            </td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
            %>
                    <tr><td colspan="5">Error retrieving users: <%= e.getMessage() %></td></tr>
            <%
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                    if (ps != null) try { ps.close(); } catch (SQLException ignored) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
                }
            %>
        </tbody>
    </table>

    <a href="addUser.jsp" class="btn">Add New User</a>
    <a href="inventory.jsp" class="back-btn">Back to Dashboard</a>
</div>

</body>
</html>
