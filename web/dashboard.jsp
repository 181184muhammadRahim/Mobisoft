<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="bean.register"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <style>
            /* Navbar styles */
            nav {
                background-color: #333;
                color: #fff;
            }

            nav ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
            }

            nav ul li {
                display: inline;
                padding: 10px;
            }

            nav ul li a {
                color: #fff;
                text-decoration: none;
            }

            nav ul li a:hover {
                background-color: #555;
            }

            /* Content styles */
            .content {
                margin-top: 20px;
                padding: 20px;
                background-color: #f0f0f0;
            }
        </style>
    </head>
    <body>
         <% register activeUser = (register) session.getAttribute("user"); %>
         
           <%
// Check if the user is logged in
if (session.getAttribute("user") == null) {
    // Redirect to the login page or display an access denied message
    response.sendRedirect("login.jsp");
    return;
}
if(activeUser.getRole()=="Admin"){
    
%>
 <nav>
            <ul>
                <li><a href="adminDashboard.jsp">Home</a></li>
               
                <li><a href="userListing.jsp">Users</a></li>
               
                <li><a href="addMobile.jsp">Add Mobile</a></li>
                <li><a href="addAccessory.jsp">Add Accessory</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
<% }else{
 %>


        <!-- Navbar -->
        <nav>
            <ul>
                <li><a href="dashboard.jsp">Home</a></li>
                <li><a href="mobile.jsp">Mobile Phones</a></li>
                <li><a href="accessory.jsp">Accessories</a></li>
                <li><a href="orderHistory.jsp">Order History</a></li>
                <li><a href="cart.jsp">cart</a></li>

                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
        <%}%>

        <!-- Dashboard Content -->
        <div class="content">
             <h1><%= "Hello " + activeUser.getFirstName()  %></h1>
            <h1>Welcome to the Dashboard</h1>
            <p>This is the main content of your dashboard page.</p>
        </div>

        <!-- Add your JavaScript code here if needed -->
    </body>
</html>
