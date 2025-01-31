

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateOrderServlet")
public class UpdateOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String orderIdStr = request.getParameter("orderId");
        String status = request.getParameter("status");

        // Validate input
        if (orderIdStr == null || status == null || orderIdStr.isEmpty() || status.isEmpty()) {
            response.getWriter().println("Invalid input. Please try again.");
            return;
        }

        int orderId;
        try {
            orderId = Integer.parseInt(orderIdStr);
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid Order ID.");
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventery", "root", "");

            // Update order status in the database
            String updateQuery = "UPDATE orders SET status = ? WHERE order_id = ?";
            ps = conn.prepareStatement(updateQuery);
            ps.setString(1, status);
            ps.setInt(2, orderId);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
//                response.getWriter().println("Order status updated successfully.");
                response.sendRedirect("ordermanage.jsp"); // Redirect to order management page
            } else {
                response.getWriter().println("No order found with the specified ID.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
