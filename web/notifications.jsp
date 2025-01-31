<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Notifications</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
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
            max-width: 600px;
        }

        h2 {
            color: #444;
            text-align: center;
            margin-bottom: 20px;
        }

        .notification {
            background-color: #f9f9f9;
            border-left: 4px solid #4facfe;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
        }

        .notification h4 {
            margin: 0 0 5px;
            color: #333;
            font-size: 18px;
        }

        .notification p {
            margin: 0;
            font-size: 14px;
            color: #555;
        }

        .back-btn {
            display: inline-block;
            text-decoration: none;
            color: white;
            background-color: #4facfe;
            padding: 10px 20px;
            border-radius: 5px;
            text-align: center;
            margin-top: 20px;
        }

        .back-btn:hover {
            background-color: #00c2f3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Notifications</h2>

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

                String query = "SELECT title, message, created_at FROM notifications ORDER BY created_at DESC"; 
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();

                if (!rs.isBeforeFirst()) {
        %>
                    <p>No notifications to display.</p>
        <%
                } else {
                    while (rs.next()) {
        %>
                        <div class="notification">
                            <h4><%= rs.getString("title") %></h4>
                            <p><%= rs.getString("message") %></p>
                            <small><%= rs.getTimestamp("created_at") %></small>
                        </div>
        <%
                    }
                }
            } catch (Exception e) {
        %>
                <p>Error retrieving notifications: <%= e.getMessage() %></p>
        <%
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                if (ps != null) try { ps.close(); } catch (SQLException ignored) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
            }
        %>

        <a href="inventory.jsp" class="back-btn">Back to Dashboard</a>
    </div>
</body>
</html>
