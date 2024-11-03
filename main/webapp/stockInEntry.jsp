<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Stock Entry</title>
    <style>
        body {
            margin: 0px;
            font-family: Google Sans, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh
        }

        /* Login Form Container */
        .add-material-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 20px auto;
            width: 300px;
            padding: 50px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
        }

        /* Login Form Heading */
        h1 {
            text-align: center;
            margin-bottom: 30px; /* Reduced margin-bottom */
        }

        /* Login Form Labels */
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        /* Login Form Inputs */
        select,
        input[type="number"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 5px;
        }

        /* Login Form Buttons */
        .button-container {
            display: flex;
            gap: 10px;
        }

        /* Login Form Submit Button */
                input[type="submit"], input[type="button"] {
            background-color: #ADD8E6; /* Light Blue from index.jsp */
           
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
		
		input[type="button"]{
			background-color: #FFB6C1
		}
        /* Login Form Submit Button Hover */
        input[type="submit"]:hover {
            background-color: #FFB6C1; /* Lighter blue on hover */
        }
        
        input[type="button"]:hover {
            background-color: #ADD8E6; /* Lighter blue on hover */
        }
        /* Logo */
        .logo {
            text-align: center; /* Adjust as needed */
        }

        .logo img {
            width: 250px; /* Adjust width as needed */
        }
    </style>
</head>
<body>
    <div class="logo">
        <img src="https://i.postimg.cc/qRrK02jb/rb-24.png" alt="Your Logo">
    </div>

    <form action="StockInServlet" method="post" class="add-material-form">
        <h1>Stock Entry</h1>
        <select name="productId" id="productId">
        <option disabled selected value>Select Product</option>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "parthcse");

                    // Fetch product names from the database
                    String sql = "SELECT product_id, product_name FROM products Where category='raw_material'";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery();

                    while (rs.next()) {
                        int productId = rs.getInt("product_id");
                        String productName = rs.getString("product_name");
                        %>
                        <option value="<%= productId %>"><%= productName %></option>
                        <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
            %>
        </select><br>

        <input type="number" name="quantity" placeholder="Qauntity" required><br>
        <input type="date" name="date" required><br>
        <div class="button-container">
            <input type="button" value="Cancel" onclick="window.location.href='./stock_in_details.jsp'">
            <input type="submit" value="Submit">
        </div>
    </form>
</body>
</html>