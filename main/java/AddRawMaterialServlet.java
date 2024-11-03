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


@WebServlet("/AddRawMaterialServlet")
public class AddRawMaterialServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String materialName = request.getParameter("materialName");
        String description = request.getParameter("description");

        try {
            // Replace with your actual database connection details
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "parthcse");

            // Insert the new raw material into the products table
            String sql = "INSERT INTO products (product_name, product_description, category) VALUES (?, ?, 'raw_material')";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, materialName);
            stmt.setString(2, description);
            stmt.executeUpdate();

            stmt.close();
            conn.close();

            // Redirect to raw_material_details.jsp after successful insertion
            response.sendRedirect("raw_material_details.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Handle errors gracefully
        }
    }
}