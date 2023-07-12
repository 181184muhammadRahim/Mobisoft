<%@page import="bean.register"%>
<%@page import="bean.OrderDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="bean.ProductDao"%>
<%@page import="bean.accessory"%>
<%@page import="bean.mobile"%>
<%@page import="bean.order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>List of Mobiles</title>
        <style>
            /* CSS styles for the table */
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }

            /* Other CSS styles */
            h1 {
                color: blue;
            }
        </style>

    </head>
    <body>

        <% register activeUser = (register) session.getAttribute("user"); %>

        <%
// Check if the user is logged in
            if (activeUser == null) {
                // Redirect to the login page or display an access denied message
                response.sendRedirect("login.jsp");
                return;
            }else if (!OrderDao.checkOrderBelongsToUser(activeUser.getId(), Integer.parseInt(request.getParameter("orderid")))) {
               response.sendRedirect("dashboard.jsp");
            }
        %>  
        <h1>List of Mobiles</h1>

        <%-- Declare an array of mobile objects --%>
        <%
            int orderId = Integer.parseInt(request.getParameter("orderid")); // Retrieve the order ID from the URL parameter
            Map<Integer, Integer> mobileQuantities = new HashMap<>();
            Map<Integer, Integer> accessoryQuantities = new HashMap<>();
            ArrayList<accessory> accessories = OrderDao.getOrderAccessory(orderId, accessoryQuantities);
            ArrayList<mobile> mobiles = OrderDao.getOrderMobile(orderId, mobileQuantities);
        %>

        <%-- Display the mobiles in a table --%>
        <table>
            <tr>
                <th>Make</th>
                <th>Model</th>
                <th>Price ($)</th>
                <th>Quantity</th>
            </tr>
            <% for (mobile mob : mobiles) {%>
            <tr>
                <td><%= mob.getMake()%></td>
                <td><%= mob.getModel()%></td>
                <td><%= mob.getPrice()%></td>
                <td><%= mobileQuantities.get(mob.getId())%></td>
            </tr>
            <% }%>
        </table>
        <h1>List of Accessories</h1>
        <table>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Price ($)</th>
                <th>Quantity</th>
            </tr>
            <% for (accessory obj : accessories) {%>
            <tr>
                <td><%= obj.getName()%></td>
                <td><%= obj.getDescription()%></td>
                <td><%= obj.getPrice()%></td>
                <td><%= accessoryQuantities.get(obj.getId())%></td>
            </tr>
            <% }%>
        </table>

    </body>
</html>
