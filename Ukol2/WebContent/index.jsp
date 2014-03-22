<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="page" class="ukol2.beans.UserBean"/>
<jsp:useBean id="users" scope="application" class="ukol2.beans.UsersBean"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Registrace</title>
</head>
<body>


	<%
		if (request.getParameter("register") != null) {	
	%>
		<jsp:setProperty name="user" property="*"/>
	 <%
	 		user.setId(System.currentTimeMillis());
	 		users.getUsers().add(user);
	 		response.sendRedirect("usersList.jsp");
	 	}
	
		
	 %>

	 <h2>Registrační formulář</h2>
 <form action="" method="post">
 <table>
  <tr>
  <td><label>Jméno:</label></td><td><input type="text" name="name" value="elopin"/></td>
  </tr>
  <tr>
  <td><label>Příjmení: </label></td><td><input type="text" name="surname" value="elopinovič"/></td>
  </tr>
  <tr>
  <td><label>Rok narození: </label></td><td><input type="text" name="year" value="1982"/></td>
  </tr>
  <tr>
  <td/><td><input type="submit" name="register" value="Uložit"></td>
  </tr>
  </table>
 </form>
</body>
</html>