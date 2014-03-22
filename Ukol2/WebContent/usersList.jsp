<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="users" scope="application" class="ukol2.beans.UsersBean" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Seznam uživatelů</title>
</head>
<body>
	<h1>Seznam registrovaných uživatelů</h1>
	<ul>
	<%
		for(int i = 0; i < users.getUsers().size(); i++) {
			
			%> <li> <% out.println(users.getUsers().get(i).getName());
		}
	%>
	</ul>
</body>
</html>