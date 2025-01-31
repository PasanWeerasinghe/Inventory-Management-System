

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditItemServlet")
public class EditItemServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        String url = "jdbc:mysql://localhost:3306/inventery"; // Replace with your database URL
        String user = "root"; // Replace with your database username
        String password = ""; // Replace with your database password

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String query = "SELECT * FROM items WHERE itemId = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, itemId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                request.setAttribute("itemId", rs.getInt("itemId"));
                request.setAttribute("itemName", rs.getString("itemName"));
                request.setAttribute("description", rs.getString("description"));
                request.setAttribute("quantity", rs.getInt("quantity"));
                request.setAttribute("price", rs.getDouble("price"));
            }

            // Forward to the edit form
            request.getRequestDispatcher("editItem.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        String itemName = request.getParameter("itemName");
        String description = request.getParameter("description");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        String url = "jdbc:mysql://localhost:3306/inventery"; // Replace with your database URL
        String user = "root"; // Replace with your database username
        String password = ""; // Replace with your database password

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            String query = "UPDATE items SET itemName = ?, description = ?, quantity = ?, price = ? WHERE itemId = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, itemName);
            ps.setString(2, description);
            ps.setInt(3, quantity);
            ps.setDouble(4, price);
            ps.setInt(5, itemId);

            ps.executeUpdate();

            // Redirect back to the manage inventory page
            response.sendRedirect("manageInventory.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
