<%@page import="bean.CompositeKey"%>
<%@page import="java.util.HashMap"%>
<%@page import="bean.accessory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.mobile"%>
<% 
    
    session.setAttribute("user", null); 
    session.setAttribute("mobileCart", new ArrayList<mobile>());
    session.setAttribute("accessoryCart", new ArrayList<accessory>());
    session.setAttribute("productQuantity", new HashMap<CompositeKey,Integer>());
    response.sendRedirect("login.jsp");

%>;