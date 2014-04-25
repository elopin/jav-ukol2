<%@page import="ukol2.beans.UserBean"%>
<%@page import="ukol2.connection.DataRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Seznam uživatelů</title>
</head>
<body>
        <%
            DataRepository repository = new DataRepository();
            
            if(request.getParameter("back") != null) {
                response.sendRedirect("index.jsp");
            }
            
            String delete = request.getParameter("delete");
            if(delete != null) {
                repository.deleteUser(Long.parseLong(delete));
            }
            
            String edit = request.getParameter("edit");
            if( edit != null) {
                response.sendRedirect("editUser.jsp?edit="+edit);
            }
        %>    
    
    
	<h1>Seznam registrovaných uživatelů</h1>
        <form action="" method="post">
        <table border="1"><tr><th>Id</th><th>Jméno</th><th>Příjmení</th><th>Rok narození</th></tr>
	<%
            
		for(UserBean user : repository.getUsers()) {
	%> 
            <tr> 
                <td>
        <%          
                    out.print(user.getId()); 
        %>      
                </td>
                <td>
        <%
                    out.print(user.getName()); 
        %>      
                </td>
                <td>
        <% 
                    out.print(user.getSurname()); 
        %>
                </td>
                <td>
        <% 
                    out.print(user.getYear()); 
        %>
                </td>
                <td>
                    <button type="submit" name="edit" value="<% out.print(user.getId());%>">Editovat</button>
                </td>
                <td>
                    <button type="submit" name="delete" value="<% out.print(user.getId());%>">Odstranit</button>
                </td>
            </tr>
        <%
		}
	%>
        </table>
            <input type="submit" name="back" value="Zpět"/>
        </form>
</body>
</html>