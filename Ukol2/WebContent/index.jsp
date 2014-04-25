<%@page import="ukol2.connection.DataRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="page" class="ukol2.beans.UserBean"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Registrace</title>
</head>
<body>
    <h2>Registrace nového uživatele</h2>

	<%
                if(request.getParameter("list") != null) {
                    response.sendRedirect("usersList.jsp");
                }
           
            
		if (request.getParameter("id") != null) {	
	%>
		    <jsp:setProperty name="user" property="*"/>
	 <%
	 		DataRepository repository = new DataRepository();
	 		repository.addUser(user);
	 		response.sendRedirect("usersList.jsp");
	 	}
	
		
	 %>

         <jsp:include page="userForm.jsp"/>
 
</body>
</html>