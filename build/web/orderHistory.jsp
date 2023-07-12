<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.order"%>
<%@page import="bean.OrderDao"%>
<%@page import="bean.register"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order List</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            a {
                text-decoration: none;
                color: #0066cc;
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
            }%>
        <h1>Order List</h1>
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Order Time</th>
                </tr>
            </thead>
            <tbody>
                <% ArrayList<order> orderList = OrderDao.getOrderList(activeUser.getId()); %>
                <% for (order order : orderList) {%>
                <tr>
                    <td><a href="orderDetails.jsp?orderid=<%= order.getOrderId()%>"><%= order.getOrderId()%></a></td>
                    <td><%= order.getTimestamp()%></td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </body>
</html>
