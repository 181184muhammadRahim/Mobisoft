??<%@page import="bean.ProductDao"%>
<jsp:useBean id="obj" class="bean.mobile"/>



<jsp:setProperty property="*" name="obj"/>


<%
int status=ProductDao.setMobile(obj);
if(status>0)
out.print("mobile added successfully");
%>