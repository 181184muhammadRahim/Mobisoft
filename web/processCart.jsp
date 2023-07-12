<%@page import="bean.register"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
??<%@page import="bean.ProductDao"%>
<%@page import="bean.accessory"%>
<%@page import="bean.mobile"%>
<%@page import="bean.CompositeKey"%>

<%
    ArrayList<mobile> mobiles = (ArrayList<mobile>) session.getAttribute("mobileCart");
    ArrayList<accessory> accessories = (ArrayList<accessory>) session.getAttribute("accessoryCart");
    Map<CompositeKey, Integer> productQuantityCart = (Map<CompositeKey, Integer>) session.getAttribute("productQuantity");
    register user = (register) session.getAttribute("user");
    if (ProductDao.performCheckout(mobiles, accessories, productQuantityCart, user)) {
        mobiles.clear();
        accessories.clear();
        productQuantityCart.clear();
        session.setAttribute("mobileCart", mobiles);
        session.setAttribute("accessoryCart", accessories);
        session.setAttribute("productQuantity", productQuantityCart);
        response.sendRedirect("dashboard.jsp");

    }

%>