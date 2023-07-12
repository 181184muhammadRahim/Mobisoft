??<%@page import="bean.RegisterDao"%>
<%@page import="bean.register"%>
<jsp:useBean id="obj" class="bean.register"/>


<jsp:setProperty property="*" name="obj"/>


<%
    register user = RegisterDao.login(obj.getUserName(), obj.getPassword());

    if (user.getId() != -1) {
        session.setAttribute("user", user);
        session.setAttribute("role", user.getRole());
   
            
       
            response.sendRedirect("dashboard.jsp");
        

    } else {
        out.print("fail to login");
    }


%>

