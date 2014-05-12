<%-- 
    JSP stránka pro editaci uživatele.
--%>

<%@page import="ukol3.beans.UserBean"%>
<%@page import="ukol3.connection.DataRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="request" class="ukol3.beans.UserBean"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editace uživatele</title>
    </head>
    <body> 
        <h2>Editace uživatele</h2>
        <%
                if(request.getParameter("list") != null) {
                    response.sendRedirect("usersList.jsp");
                } 
                   
                DataRepository repository = new DataRepository();
                         
		if (request.getParameter("id") != null) {
                    
        %>
		    <jsp:setProperty name="user" property="*"/>
	<%
                    
                    String name = request.getParameter("name");
                    String surname = request.getParameter("surname");
                    String year = request.getParameter("year");
                    if(name == null || name.equals("")) {
                        %><label style="color: red">Vyplňte jméno!</label><%
                    }
                    
                    else if(surname == null || surname.equals("")) {
                        %><label style="color: red">Vyplňte příjmení!</label><%
                    }
                    
                    else if(year == null || year.equals("")) {
                        %><label style="color: red">Vyplňte rok narození!</label><%
                    } else {
	
	 		repository.updateUser(user);
	 		response.sendRedirect("usersList.jsp");
                    }
	 	} else {
                    UserBean u = (UserBean)session.getAttribute("editUser");
                    if(u != null) {
                        user.setId(u.getId());
                        user.setName(u.getName());
                        user.setSurname(u.getSurname());
                        user.setYear(u.getYear());
                    }
                }   
	 %>
                <jsp:include page="userForm.jsp"/>
    </body>
</html>
