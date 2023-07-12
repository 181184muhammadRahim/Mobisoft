??<%@page import="bean.ProductDao"%>
<jsp:useBean id="obj" class="bean.accessory"/>


<jsp:setProperty property="*" name="obj"/>


<%
int status=ProductDao.setAccessory(obj);
if(status>0)
out.print("accessory add successfully");




%>