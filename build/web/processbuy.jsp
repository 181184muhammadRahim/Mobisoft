<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
??<%@page import="bean.ProductDao"%>
<%@page import="bean.accessory"%>
<%@page import="bean.mobile"%>
<%@page import="bean.CompositeKey"%>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="obj" class="bean.productQuantity"/>


<jsp:setProperty property="*" name="obj"/>


<%
    if (ProductDao.getProductInventoryDetail(obj.getId(), obj.getType(), obj.getQuantity())) {
        Map<CompositeKey, Integer> productQuantityCart = (Map<CompositeKey, Integer>) session.getAttribute("productQuantity");
        if (obj.getType().equals("mobile")) {
            CompositeKey key = new CompositeKey("mobile", obj.getId());
            if (productQuantityCart == null) {
               productQuantityCart = new HashMap<>();
            }
            if (productQuantityCart.get(key) != null) {
                productQuantityCart.put(key, productQuantityCart.get(key) + obj.getQuantity());
            } else {
                mobile mymobile = ProductDao.getMobileDetail(obj.getId());
                ArrayList<mobile> mobileCart = (ArrayList<mobile>) session.getAttribute("mobileCart");
                mobileCart.add(mymobile);
                productQuantityCart.put(key, 0 + obj.getQuantity());
                session.setAttribute("mobileCart", mobileCart);
            }
            session.setAttribute("productQuantity", productQuantityCart);
            response.sendRedirect("mobile.jsp");
        } else {
            CompositeKey key = new CompositeKey("accessory", obj.getId());
            if (productQuantityCart.get(key) != null) {
                productQuantityCart.put(key, productQuantityCart.get(key) + obj.getQuantity());
            } else {
                accessory myaccessory = ProductDao.getAccessoryDetail(obj.getId());
                ArrayList<accessory> accessoryCart = (ArrayList<accessory>) session.getAttribute("accessoryCart");
                accessoryCart.add(myaccessory);
                productQuantityCart.put(key, 0 + obj.getQuantity());
                session.setAttribute("accessoryCart", accessoryCart);
            }
            session.setAttribute("productQuantity", productQuantityCart);
            response.sendRedirect("accessory.jsp");
        }

    } else {
        out.print("product not available in specified quantity");
    }


%>
