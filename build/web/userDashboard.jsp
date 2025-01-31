<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    

    if (session == null || session.getAttribute("customerName") == null) {
        // Redirect to sign-in page if the session is invalid or userName is null
        response.sendRedirect("signin.jsp");
        return;
    }

    // Get the user's name from the session
    String customerName = (String) session.getAttribute("customerName");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            color: white;
            margin: 0;
            padding: 0;
        }

        .dashboard {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
        }

        .greeting {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .card {
            background: white;
            color: black;
            padding: 20px;
            margin: 10px 0;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            margin-top: 0;
            color: #0072ff;
        }

        .actions a {
            text-decoration: none;
            color: white;
            background: #0072ff;
            padding: 10px 15px;
            border-radius: 5px;
            margin: 5px 0;
            display: inline-block;
        }

        .actions a:hover {
            background: #005bb5;
        }

        .logout {
            position: absolute;
            top: 10px;
            right: 10px;
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .logout:hover {
            color: #ffcccc;
        }
    </style>
</head>
<body>
<a href="logout.jsp" class="logout">Logout</a>
<div class="dashboard">
    <div class="greeting">
        Welcome, <%= customerName %>!
    </div>

    <div class="card">
        <h3>Your Orders</h3>
        <table border="1" width="100%" cellspacing="0" cellpadding="10">
            <tr>
                <th>Order ID</th>
                <th>Customer Name</th>
                <th>Order Date</th>
                <th>Status</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventery", "root", "");

                    String query = "SELECT order_id, order_date, status, total FROM orders WHERE customer_name = ?";
                    ps = conn.prepareStatement(query);
                    ps.setString(1, customerName);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        int orderId = rs.getInt("order_id");
                        
                        Date orderDate = rs.getDate("order_date");
                        String status = rs.getString("status");
                        double total = rs.getDouble("total");
            %>
            <tr>
                <td><%= orderId %></td>
                <td><%= customerName %></td>
                <td><%= orderDate %></td>
                
                <td><%= status %></td>
                <td>Rs.<%= total %></td>
                <td>
                    <a href="generateReport.jsp?orderId=<%= orderId %>">View</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='5'>Error loading orders: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                }
            %>
        </table>
    </div>

    <div class="card">
        <h3>Notifications</h3>
        <p>You have no new notifications.</p>
    </div>

    <div class="card">
        <h3>Profile</h3>
        <p>Manage your personal details.</p>
        <div class="actions">
            <a href="editUser.jsp">Edit Profile</a>
        </div>
    </div>
</div>
</body>
</html>

