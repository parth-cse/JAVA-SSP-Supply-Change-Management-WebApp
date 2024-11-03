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

@WebServlet("/StockOutServlet")
public class StockOutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String date = request.getParameter("date");
        String orderId = request.getParameter("OId");
        int oId = Integer.parseInt(orderId);

        try {
            // Replace with your actual database connection details
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "parthcse");

            // Update stock quantity for the selected product
            String sql = "UPDATE inventory SET quantity = quantity - ? WHERE product_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, quantity);
            stmt.setString(2, productId);
            stmt.executeUpdate();
            stmt.close();

            // Update order status (if applicable)
            if (!orderId.equals("")) { // Check if order ID is selected
                String updateOrderSql = "UPDATE orders SET order_status='completed' WHERE order_id = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateOrderSql);
                updateStmt.setInt(1, oId);
                updateStmt.executeUpdate();
                updateStmt.close();
            }
            
            String addEntry = "Insert into stock_out (product_id, quantity, date_out, order_id) values (?,?,?,?);";
            PreparedStatement addStmt = conn.prepareStatement(addEntry);
            int pId = Integer.parseInt(productId);
            addStmt.setInt(1, pId);
            addStmt.setInt(2, quantity);
            addStmt.setString(3, date);
            addStmt.setInt(4, oId);
            
            addStmt.executeUpdate();
            addStmt.close();
            


            conn.close();

            // Redirect to success page (or display success message)
            response.sendRedirect("stock_out_details.jsp"); // Update redirect URL

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Handle errors gracefully
        }
    }
}