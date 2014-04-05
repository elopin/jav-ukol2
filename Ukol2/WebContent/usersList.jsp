<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="users" scope="application" class="ukol2.beans.UsersBean" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Seznam uživatelů</title>
</head>
<body>
        <%
            if(request.getAttribute("back") != null) {
                response.sendRedirect("index.jsp");
            }
        %>    
    
    
	<h1>Seznam registrovaných uživatelů</h1>
        <table border="1"><tr><th>Id</th><th>Jméno</th><th>Příjmení</th><th>Rok narození</th></tr>
	<%
		for(int i = 0; i < users.getUsers().size(); i++) {
	%> 
            <tr> 
                <td>
        <%          
                    out.print(users.getUsers().get(i).getId()); 
        %>      
                </td>
                <td>
        <%
                    out.print(users.getUsers().get(i).getName()); 
        %>      
                </td>
                <td>
        <% 
                    out.print(users.getUsers().get(i).getSurname()); 
        %>
                </td>
                <td>
        <% 
                    out.print(users.getUsers().get(i).getYear()); 
        %>
                </td>
            </tr>
        <%
		}
	%>
        </table>
        <form action="" method="post">
            <input type="submit" name="back" value="Zpět"/>
        </form>
</body>
</html>