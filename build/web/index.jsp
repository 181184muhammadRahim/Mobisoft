<%@page import="bean.accessory"%>
<%@page import="bean.mobile"%>
<%@page import="bean.CompositeKey"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Signup and Login</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
            }

            h1 {
                text-align: center;
                color: #333;
            }

            p {
                text-align: center;
            }

            ul {
                list-style-type: none;
                padding: 0;
                margin: 20px auto;
                width: 200px;
                background-color: #fff;
                border: 1px solid #ccc;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            li {
                padding: 10px;
            }

            li a {
                text-decoration: none;
                color: #333;
            }

            li a:hover {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <%
            ArrayList<mobile> mobileCart = new ArrayList<mobile>();
            ArrayList<accessory> accessoryCart = new ArrayList<accessory>();
            Map<CompositeKey, Integer> productQuantity = new HashMap<>();

            // Set the empty ArrayList in the session attribute
            session.setAttribute("mobileCart", mobileCart);
            session.setAttribute("accessoryCart", accessoryCart);
            session.setAttribute("user", null);
            session.setAttribute("productQuantity", productQuantity);
        %>
        <h1>Welcome to Mobisoft</h1>
        <p>Please select an option:</p>
        <ul>
            <li><a href="register.jsp">Signup</a></li>
            <li><a href="login.jsp">Login</a></li>
        </ul>
    </body>
</html>
