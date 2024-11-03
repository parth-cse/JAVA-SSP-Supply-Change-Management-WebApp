<!DOCTYPE html>
<html>
<head>
    <title>Supply Chain Management System</title>
    <style>
        body {
            margin: 0;
            font-family: Google Sans, sans-serif;
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
        .link-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            height: 100vh; /* Adjust the height as needed */
            margin: 50px;
        }
        .link-button {
            padding: 20px;
            background-color: #f0f0f0;
            border: 2px solid #ccc;
            border-radius: 10px;
            text-decoration: none;
            color: #333;
            text-align: center; /* Center the text within the button */
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: 900;
            font-size: 20px;
        }
        .link-button:nth-child(1) {
            background-color: #FFC0CB; /* Pink */
            border-color: #FFC0CB;
        }
        .link-button:nth-child(1):hover {
            background-color: #FFB6C1;
        }
        .link-button:nth-child(2) {
            background-color: #ADD8E6; /* Light Blue */
            border-color: #ADD8E6;
        }
        .link-button:nth-child(2):hover {
            background-color: #9FC5DE;
        }
        .link-button:nth-child(3) {
            background-color: #F0E68C; /* Light Yellow */
            border-color: #F0E68C;
        }
        .link-button:nth-child(3):hover {
            background-color: #E6DA7A;
        }
        .link-button:nth-child(4) {
            background-color: #90EE90; /* Light Green */
            border-color: #90EE90;
        }
        .link-button:nth-child(4):hover {
            background-color: #7CFC00;
        }
        .link-button:nth-child(5) {
            background-color: #D3BFBF; /* Light Purple */
            border-color: #D3BFBF;
        }
        .link-button:nth-child(5):hover {
            background-color: #B0A0A0;
        }
        .link-button:nth-child(6) {
            background-color: #FADBD8; /* Light Pink */
            border-color: #FADBD8;
        }
        .link-button:nth-child(6):hover {
            background-color: #F08080;
        }
        .link-button:nth-child(7) {
            background-color: #C2C2F0; /* Light Blue */
            border-color: #C2C2F0;
        }
        .link-button:nth-child(7):hover {
            background-color: #9999CC;
        }
        footer {
            text-align: center;
            padding: 10px;
            background-color: #ADD8E6;
            height: 90px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
            font-weight: 900;
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
    <div class="link-container">
        <a href="stock_in_details.jsp" class="link-button">Stock In Details</a>
        <a href="stock_out_details.jsp" class="link-button">Stock Out Details</a>
        <a href="inventory_details.jsp" class="link-button">Inventory Details</a>
        <a href="pending_orders_details.jsp" class="link-button">Pending Orders</a>
        <a href="completed_orders_details.jsp" class="link-button">Completed Orders</a>
        <a href="raw_material_details.jsp" class="link-button">Raw Material Details</a>
    </div>
    <footer>
        Made with Love by 3Tigada
    </footer>
</body>
</html>
