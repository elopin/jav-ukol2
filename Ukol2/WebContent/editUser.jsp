<%-- 
    Document   : editUser
    Created on : 24.4.2014, 22:16:51
    Author     : elopin
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
                } else {
           
            
                DataRepository repository = new DataRepository();
                
                String id = request.getParameter("edit");
                if(id != null) {
                    UserBean repUser = repository.getUserById(Long.parseLong(id));
                    
                    if(repUser != null) {
                        user.setId(repUser.getId());
                        user.setName(repUser.getName());
                        user.setSurname(repUser.getSurname());
                        user.setYear(repUser.getYear());
                    }
                }
                        
                        
		if (request.getParameter("id") != null) {	
	%>
		    <jsp:setProperty name="user" property="*"/>
	 <%
	 		repository.updateUser(user);
	 		response.sendRedirect("usersList.jsp");
	 	} else {
	
	            request.getRequestDispatcher("userForm.jsp").forward(request, response);
                }
            }    
	 %>
        
    </body>
</html>
