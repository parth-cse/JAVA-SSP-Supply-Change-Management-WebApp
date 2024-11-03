import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IndexServlet extends HttpServlet {

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Fetch basic information and data
        try {
            // Replace with your actual database connection details
        	Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded Successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "parthcse");

            // Fetch stock in and stock out counts
            PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) AS stock_in_count FROM stock_in");
            ResultSet rs = stmt.executeQuery();
            rs.next();
            int stockInCount = rs.getInt("stock_in_count");
            rs.close();
            stmt.close();

            stmt = conn.prepareStatement("SELECT COUNT(*) AS stock_out_count FROM stock_out");
            rs = stmt.executeQuery();
            rs.next();
            int stockOutCount = rs.getInt("stock_out_count");
            rs.close();
            stmt.close();

            // Set attributes for index.jsp
            request.setAttribute("stockInCount", stockInCount);
            request.setAttribute("stockOutCount", stockOutCount);

            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Handle errors gracefully
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}