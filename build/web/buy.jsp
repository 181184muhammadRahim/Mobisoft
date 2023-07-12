<%@page import="bean.ProductDao"%>
<%@page import="bean.accessory"%>
<%@page import="bean.mobile"%>
<%@page import="bean.register"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Product Details</title>
        <style>
            /* CSS styles here */
        </style>
        <script>
            function addToCart() {
                var quantity = document.getElementById("quantity").value;
                var productIdd = document.getElementById("productId").value;
                console.log(productIdd);




                // You can perform additional validation here if needed
                // Submit the form
//              window.location.href ="cart.jsp";

                //document.getElementById("addToCartForm").submit();
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
     
        <%            
            String productType = request.getParameter("productType");
            String productId = request.getParameter("productId");
            accessory accessoryProduct = null;
            mobile mobileProduct = null;


        %>
        <%            if (productType.equals("accessory")) {
                accessoryProduct = ProductDao.getAccessoryDetail(Integer.parseInt(productId));
        %>

        <h1>Product Details</h1>

        <div class="product-info">
            <p><strong>Product Name:</strong> <%= accessoryProduct.getName()%></p>
            <p><strong>Description:</strong> <%= accessoryProduct.getDescription()%></p>
            <p><strong>Price:</strong> <%=accessoryProduct.getPrice()%></p>
        </div>
        <%
        } else if (productType.equals("mobile")) {

            mobileProduct = ProductDao.getMobileDetail(Integer.parseInt(productId));


        %>
        <h1>Product Details</h1>

        <div class="product-info">
            <p><strong>Product Name:</strong> <%= mobileProduct.getMake()%></p>
            <p><strong>Product Name:</strong> <%= mobileProduct.getModel()%></p>

            <p><strong>Description:</strong> <%= mobileProduct.getDescription()%></p>
            <p><strong>Price:</strong> <%=mobileProduct.getPrice()%></p>
        </div>
        <%
            }
        %>



        <form id="addToCartForm" action="processbuy.jsp" method="post">
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" min="1" value="1" required>
            <input type="hidden" id="id" name="id" value=<%=productId%>>
            <input type="hidden" id="type" name="type" value=<%=productType%>>
            <input type="submit" class="submit-button" value="Add to Cart"  >
        </form>


    </body>
</html>
