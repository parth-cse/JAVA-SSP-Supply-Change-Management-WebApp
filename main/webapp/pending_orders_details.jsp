<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Pending Orders</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #ADD8E6;
        }

        .logo img {
            width: 250px; /* Adjust the width as needed */
        }

        .user-info {
            display: flex;
            align-items: center;
        }

        .user-info h2 {
            margin-right: 20px;
        }

        footer {
            text-align: center;
            padding: 10px;
            background-color: #ADD8E6;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 18px;
            font-weight: bold;
        }

        .user-info a {
            padding: 10px 20px;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-decoration: none;
            color: #333;
        }

        .user-info a:hover {
            background-color: #ccc;
        }

        /* Style for inventory tables */
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #ADD8E6;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }
		.inventory-container{
			margin: 20px;
			display: flex;
			gap: 20px;
			justify-content: space-around;
		}
		.return{
			display: flex;
			justify-content: center;
			margin: 30px;
			gap: 20px
		}
		
		.return a{
			font-weight: 500;
			color: red
		}
    </style>
</head>
<body>
<%
    HttpSession userSession = request.getSession(false);
    String username = "";
    if (userSession != null && userSession.getAttribute("username") != null) {
        username = (String) userSession.getAttribute("username");
    } else {
        response.sendRedirect("login.jsp");
    }
%>
    <header>
        <div class="logo">
            <img src="https://i.postimg.cc/qRrK02jb/rb-24.png" alt="Your Logo">
        </div>
        <div class="user-info">
            <h2>Welcome, <%= username %>!</h2>
            <a href="LogoutServlet">Logout</a>
        </div>
    </header>
	<div class="inventory-container"><div>
    <h1>Pending Orders</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Product Name</th>
            <th>Customer Name</th>
            <th>Date</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Replace with your JDBC driver class
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "parthcse"); // Replace with your credentials
                String sql = "SELECT o.order_id, p.product_name, o.customer_name, o.order_date FROM orders o JOIN products p ON o.product_id = p.product_id WHERE order_status='pending';";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    int productId = rs.getInt("order_id");
                    String productName = rs.getString("product_name");
                    String availableQuantity = rs.getString("customer_name");
                    String date = rs.getString("Order_date");
        %>
        <tr>
            <td><%= productId %></td>
            <td><%= productName %></td>
            <td><%= availableQuantity %></td>
            <td><%= date %></td>
</tr>
            <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace(); // Log the error for debugging
                out.println("Error retrieving data"); // Display a user-friendly message
            }
        %>
    </table>
</div>
</div>
<div class="return"><p>Return <a href="/Project/">Home</a></p><p></div>
    <footer>
        Made with Love by 3Tigada
    </footer>
</body>
</html>