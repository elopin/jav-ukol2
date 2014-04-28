<%-- 
    JSP stránka pro editaci uživatele.
--%>

<%@page import="ukol2.beans.UserBean"%>
<%@page import="ukol2.connection.DataRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="request" class="ukol2.beans.UserBean"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editace uživatele</title>
    </head>
    <body> 
        <%
                if(request.getParameter("list") != null) {
                    response.sendRedirect("usersList.jsp");
                } 
                
                UserBean u = (UserBean)session.getAttribute("editUser");
                if(u != null) {
                    user.setId(u.getId());
                    user.setName(u.getName());
                    user.setSurname(u.getSurname());
                    user.setYear(u.getYear());
                }
                    
                DataRepository repository = new DataRepository();
                         
		if (request.getParameter("id") != null) {	
	%>
		    <jsp:setProperty name="user" property="*"/>
	 <%
	 		repository.updateUser(user);
	 		response.sendRedirect("usersList.jsp");
	 	}    
	 %>
                <jsp:include page="userForm.jsp"/>
    </body>
</html>
