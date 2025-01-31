<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
</head>
<body>

<%
    String userId = request.getParameter("id");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String role = request.getParameter("role");

    Connection conn = null;
    PreparedStatement ps = null;
    String url = "jdbc:mysql://localhost:3306/inventery"; // Replace with your database details
    String user = "root"; // Replace with your database username
    String password = ""; // Replace with your database password
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String updateQuery = "UPDATE users SET username = ?, email = ?, role = ? WHERE id = ?";
        ps = conn.prepareStatement(updateQuery);
        ps.setString(1, username);
        ps.setString(2, email);
        ps.setString(3, role);
        ps.setInt(4, Integer.parseInt(userId));

        int result = ps.executeUpdate();

        if (result > 0) {
            out.println("<h2>User updated successfully!</h2>");
        } else {
            out.println("<h2>Error updating user.</h2>");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (ps != null) try { ps.close(); } catch (SQLException ignored) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
    }
%>

<a href="usermanage.jsp">Back to User Management</a>

</body>
</html>
