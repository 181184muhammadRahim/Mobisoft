??<%@page import="bean.RegisterDao"%>
<jsp:useBean id="obj" class="bean.register"/>


<jsp:setProperty property="*" name="obj"/>


<%
int status=RegisterDao.updateUser(obj);
if(status>0)
out.print("user successfully updated");




%>

