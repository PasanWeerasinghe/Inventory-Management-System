import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddItemServlet")
public class addnewItemController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemName = request.getParameter("itemName");
        String description = request.getParameter("description");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        try {
            // Database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventery", "root", "");


            // SQL query to insert data
            String sql = "{CALL AddItem(?, ?, ?, ?)}";
        CallableStatement stmt = conn.prepareCall(sql);
        stmt.setString(1, itemName);
        stmt.setString(2, description);
        stmt.setInt(3, quantity);
        stmt.setDouble(4, price);

            // Execute query and close connection
            int rowsInserted = stmt.executeUpdate();
            stmt.close();
            conn.close();

            // Redirect or show success message
            if (rowsInserted > 0) {
    System.out.println("Item added successfully through procedure.");
    response.sendRedirect("inventory.jsp"); // Redirect to dashboard
} else {
    System.out.println("Failed to add item.");
    response.getWriter().println("Failed to add item.");
}


        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
        }
    }
}
