<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    int orderId = Integer.parseInt(request.getParameter("orderId"));

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventery", "root", "");

        String query = "DELETE FROM orders WHERE order_id = ?";
        ps = conn.prepareStatement(query);
        ps.setInt(1, orderId);

        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            out.println("<script>alert('Order deleted successfully.'); window.location.href='ordermanage.jsp';</script>");
        } else {
            out.println("<script>alert('Order not found.'); window.location.href='ordermanage.jsp';</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('Error: " + e.getMessage() + "'); window.location.href='ordermanage.jsp';</script>");
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
