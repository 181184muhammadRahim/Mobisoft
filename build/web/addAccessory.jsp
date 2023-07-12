<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="bean.register"%>

<html>
    <head>
        <title>Add Accessory</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            h1 {
                color: #333;
            }

            form {
                width: 300px;
                margin: 20px auto;
            }

            label {
                display: block;
                margin-bottom: 10px;
            }

            input[type="text"],
            input[type="number"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            input[type="submit"] {
                width: 100%;
                padding: 8px;
                border: none;
                background-color: #4CAF50;
                color: white;
                font-weight: bold;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
     
        
        <%
// Check if the user is logged in
if (session.getAttribute("user") == null ) {
    // Redirect to the login page or display an access denied message
    response.sendRedirect("login.jsp");
    return;
}
if(session.getAttribute("role")!="Admin"){
    response.sendRedirect("dashboard.jsp");}
%>
        <h1>Add Accessory</h1>

        <form action="processAddAccessory.jsp" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br><br>

            <label for="type">Description:</label>
            <input type="text" id="description" name="description" required><br><br>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" min="0" step="0.01" required><br><br>
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" min="0"  required><br><br>

            <input type="submit" value="Add">
        </form>
    </body>
</html>
