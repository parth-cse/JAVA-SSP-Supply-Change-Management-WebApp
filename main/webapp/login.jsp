<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
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
        .login-form {
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

        /* Login Form Labels (removed) */

        /* Login Form Inputs */
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 2px solid #ccc;
            border-radius: 5px;
        }

        /* Login Form Submit Button */
        input[type="submit"] {
            background-color: #ADD8E6; /* Light Blue from index.jsp */
           
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        /* Login Form Submit Button Hover */
        input[type="submit"]:hover {
            background-color: #FFB6C1; /* Lighter blue on hover */
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

    <form action="/Project/LoginServlet" method="post" class="login-form">
        <h1>Login</h1>
        <input type="text" id="username" placeholder="Username" name="username" required><br>
        <input type="password" id="password" placeholder="Password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>