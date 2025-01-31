<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Styles -->
    <style>
        .container {
            max-width: 600px;
            margin-top: 50px;
        }
        .card {
            padding: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
    </style>
</head>
<body>

<%
    String userId = request.getParameter("id");
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String url = "jdbc:mysql://localhost:3306/inventery"; // Replace with your database details
    String user = "root"; // Replace with your database username
    String password = ""; // Replace with your database password

    String username = "";
    String email = "";
    String role = "";

    if (userId != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            String query = "SELECT * FROM users WHERE id = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(userId));
            rs = ps.executeQuery();

            if (rs.next()) {
                username = rs.getString("username");
                email = rs.getString("email");
                role = rs.getString("role");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
            if (ps != null) try { ps.close(); } catch (SQLException ignored) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
        }
    }
%>

<div class="container">
    <div class="card">
        <h2 class="card-title text-center">Edit User</h2>
        <form action="updateUser.jsp" method="post">
            <input type="hidden" name="id" value="<%= userId %>" />
            
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" value="<%= username %>" required />
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required />
            </div>

            <div class="form-group">
                <label for="role">Role:</label>
                <select class="form-control" name="role" required>
                    <option value="Admin" <%= role.equals("Admin") ? "selected" : "" %>>Admin</option>
                    <option value="User" <%= role.equals("User") ? "selected" : "" %>>User</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Update User</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS and dependencies (jQuery, Popper.js) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
