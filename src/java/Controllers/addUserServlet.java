

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addUserServlet")
public class addUserServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/inventery"; // Update with your database URL
    private static final String DB_USER = "root"; // Replace with your database username
    private static final String DB_PASSWORD = ""; // Replace with your database password

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve user inputs from the form
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish the database connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare the SQL query
            String query = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(query);

            // Set the parameter values
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, role);

            // Execute the query
            int rowsInserted = ps.executeUpdate();

            // Redirect based on the result
            if (rowsInserted > 0) {
                response.sendRedirect("usermanage.jsp?message=User+added+successfully");
            } else {
                response.sendRedirect("addUser.jsp?error=Failed+to+add+user");
            }
        } catch (Exception e) {
            // Handle exceptions and redirect to the form with an error message
            response.sendRedirect("addUser.jsp?error=" + e.getMessage());
        } finally {
            // Close database resources
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ignored) {}
        }
    }
}
