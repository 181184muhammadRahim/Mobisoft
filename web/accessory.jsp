<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="bean.ProductDao"%>
<%@page import="bean.accessory"%>
<%@page import="bean.register"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Accessory Listing</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
                margin-bottom: 20px;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }

            .search-bar {
                width: 300px;
                margin-bottom: 10px;
            }

            .buy-button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 5px 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin-bottom: 5px;
                cursor: pointer;
                border-radius: 3px;
            }
        </style>
        <script>
            function searchProducts() {
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("searchInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("productTable");
                tr = table.getElementsByTagName("tr");

                for (i = 0; i < tr.length; i++) {
                    var tdName = tr[i].getElementsByTagName("td")[0]; // Index 0 corresponds to the make column
                    

                    if (tdName) {
                        var nameValue = tdName.textContent || tdName.innerText;
                        var searchValue = nameValue;

                        if (searchValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }
        </script>
    </head>
    <body>
           <% register activeUser = (register) session.getAttribute("user"); %>
        
        <%
// Check if the user is logged in
if (session.getAttribute("user") == null ) {
    // Redirect to the login page or display an access denied message
    response.sendRedirect("login.jsp");
    return;
}
if(session.getAttribute("role")!="Customer"){
    response.sendRedirect("dashboard.jsp");}
%>
        <h1>Accessories Listing</h1>
        <input class="search-bar" type="text" id="searchInput" onkeyup="searchProducts()" placeholder="Search by name">

        <table id="productTable">
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <%-- Add product data dynamically from an ArrayList --%>
            <% ArrayList<accessory> productList = ProductDao.getAccessories(); %>
            <% for (accessory product : productList) {%>
            <tr>
                <td><%= product.getName()%></td>
                <td><%= product.getDescription()%></td>
                <td><%= product.getPrice()%></td>
                <td><a href="buy.jsp?productId=<%= product.getId()%>&productType=accessory"class="buy-button">Buy</a></td>
            </tr>
            <% }%>
        </table>
    </body>
</html>
