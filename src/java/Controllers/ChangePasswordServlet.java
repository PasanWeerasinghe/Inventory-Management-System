import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username"); // Assuming username is stored in session

        if (newPassword.equals(confirmPassword)) {
            Connection conn = null;
            PreparedStatement ps = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventery", "root", "");
                String query = "UPDATE users SET password = ? WHERE username = ? AND password = ?";
                ps = conn.prepareStatement(query);
                ps.setString(1, newPassword);
                ps.setString(2, username);
                ps.setString(3, currentPassword);

                int updated = ps.executeUpdate();
                if (updated > 0) {
                    response.getWriter().println("Password updated successfully.");
                } else {
                    response.getWriter().println("Invalid current password.");
                }
            } catch (Exception e) {
                response.getWriter().println("Error: " + e.getMessage());
            } finally {
                try {
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (SQLException ignored) {}
            }
        } else {
            response.getWriter().println("New passwords do not match.");
        }
    }
}
