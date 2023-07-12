<%@page import="java.util.Map"%>
<%@page import="bean.CompositeKey"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.accessory" %>
<%@ page import="bean.mobile" %>
<%@page import="bean.register"%>
<html>
    <head>
        <title>Cart Page</title>
        <style>
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
        </style>
    </head>
    <body>
        <% register activeUser = (register) session.getAttribute("user");
            Map<CompositeKey, Integer> productQuantityCart = (Map<CompositeKey, Integer>) session.getAttribute("productQuantity");%>

        <%
// Check if the user is logged in
            if (session.getAttribute("user") == null) {
                // Redirect to the login page or display an access denied message
                response.sendRedirect("login.jsp");
                return;
            }
            if (session.getAttribute("role") != "Customer") {
                response.sendRedirect("dashboard.jsp");
            }
        %>
        <h1>Cart Page</h1>

        <h2>Mobiles:</h2>
        <table>
            <tr>
                <th>Make</th>
                <th>Model</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
            <% ArrayList<mobile> mobileList = (ArrayList<mobile>) session.getAttribute("mobileCart");
                if (mobileList != null) {
                    for (mobile item : mobileList) {%>
            <tr>
                <td><%= item.getMake()%></td>
                <td><%= item.getModel()%></td>
                <td><%= item.getPrice()%></td>
                <td><%= productQuantityCart.get(new CompositeKey("mobile", item.getId()))%></td>
            </tr>
            <%      }
                }%>
        </table>
        <% double mobileSum = mobileList.stream().mapToDouble(mobile -> mobile.getPrice() * productQuantityCart.get(new CompositeKey("mobile", mobile.getId()))).sum();%>
        <h2>Total Mobile Sum = <%= mobileSum%></h2>

        <h2>Accessories:</h2>
        <table>
            <tr>
                <th>Name</th>

                <th>Price</th>
                <th>Quantity</th>
            </tr>
            <% ArrayList<accessory> accessoryList = (ArrayList<accessory>) session.getAttribute("accessoryCart");
                if (accessoryList != null) {
                    for (accessory item : accessoryList) {%>
            <tr>
                <td><%= item.getName()%></td>

                <td><%= item.getPrice()%></td>
                <td><%= productQuantityCart.get(new CompositeKey("accessory", item.getId()))%></td>
            </tr>
            <%      }
                }%>
        </table>
        <%double accessorySum = accessoryList.stream().mapToDouble(accessory -> accessory.getPrice() * productQuantityCart.get(new CompositeKey("accessory", accessory.getId()))).sum();%>
        <h2>Total Accessory Sum = <%= accessorySum%></h2>
        <h2>Total Sum = <%= mobileSum + accessorySum%></h2>
        
        <form action="processCart.jsp" method = "post">
            <input type="submit" value="Checkout">
        </form>
    </body>
</html>
