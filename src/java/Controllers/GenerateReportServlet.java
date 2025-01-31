import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/GenerateReportServlet")
public class GenerateReportServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=InventoryReport.csv");

        try (PrintWriter out = response.getWriter()) {
            // Write CSV header
            out.println("Item ID,Item Name,Description,Quantity,Price");

            // Database connection
            String url = "jdbc:mysql://localhost:3306/inventery";
            String user = "root";
            String password = "";
            Connection conn = DriverManager.getConnection(url, user, password);
            String query = "SELECT * FROM items";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            // Write data rows
            while (rs.next()) {
                out.printf("%d,%s,%s,%d,%.2f%n",
                        rs.getInt("itemId"),
                        rs.getString("itemName"),
                        rs.getString("description"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"));
            }

            // Close resources
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
