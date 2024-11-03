<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Raw Material</title>
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
        input[type="text"],
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
<%
    HttpSession userSession = request.getSession(false);
    String username = "";
    if (userSession != null && userSession.getAttribute("username") != null) {
        username = (String) userSession.getAttribute("username");
    } else {
        response.sendRedirect("login.jsp");
    }
%>
    <div class="logo">
        <img src="https://i.postimg.cc/qRrK02jb/rb-24.png" alt="Your Logo">
    </div>

    <form action="AddRawMaterialServlet" method="post" class="add-material-form">
        <h1>Add Raw Material</h1>
        <input type="text" id="materialName" name="materialName" placeholder="Material Name" required><br>
        <textarea id="description" name="description" rows="4" placeholder="Description" required></textarea><br>
        <div class="button-container">
            <input type="button" value="Cancel" onclick="window.location.href='raw_material_details.jsp'">
            <input type="submit" value="Add Material">
        </div>
    </form>
</body>
</html>