??<%@page import="bean.RegisterDao"%>
<jsp:useBean id="obj" class="bean.register"/>


<jsp:setProperty property="*" name="obj"/>


<%
int status=RegisterDao.deleteUser(obj.getId());
if(status>0)
out.print("user successfully deleted");




%>

