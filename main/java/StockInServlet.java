import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StockInServlet")
public class StockInServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String date = request.getParameter("date");
        int pId = Integer.parseInt(productId);

        try {
            // Replace with your actual database connection details
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "parthcse");

            // Update stock quantity for the selected product
            String sql = "Insert into stock_in (product_id, quantity, date_in) Values (?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, pId);
            stmt.setInt(2, quantity);
            stmt.setString(3, date);
            stmt.executeUpdate();

            stmt.close();
            
            String sql2 = "Update inventory SET quantity = quantity + ? Where product_id = ?";
            PreparedStatement stmt2 = conn.prepareStatement(sql2);
            stmt2.setInt(1, quantity);
            stmt2.setInt(2, pId);
            stmt2.executeUpdate();
            stmt2.close();
            
            conn.close();

            // Redirect to success page (or display success message)
            response.sendRedirect("stock_in_details.jsp"); // Update redirect URL

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Handle errors gracefully
        }
    }
}