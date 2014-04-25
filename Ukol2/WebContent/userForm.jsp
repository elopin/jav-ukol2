<%-- 
    Document   : userForm
    Created on : 24.4.2014, 22:13:20
    Author     : elopin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="request" class="ukol2.beans.UserBean"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
         
        String id = "";    
        String name = "";
        String surname = "";
        String year = "";
        
        if(user.getId() != null) {
            id = String.valueOf(user.getId());
            name = user.getName();
            surname = user.getSurname();
            year = String.valueOf(user.getYear());
            
            %> <h2>Editace uživatele</h2> <%
        }
        
        %>
        
        <form action="" method="post">
 <table>
  <tr>
      <td><label>Jméno:</label></td><td><input type="text" name="name" value="<% out.print(name);%>"/></td>
  </tr>
  <tr>
      <td><label>Příjmení: </label></td><td><input type="text" name="surname" value="<% out.print(surname);%>"/></td>
  </tr>
  <tr>
      <td><label>Rok narození: </label></td><td><input type="text" name="year" value="<% out.print(year);%>"/></td>
  </tr>
  <tr>
      <td><button type="submit" name="id" value="<% out.print(id);%>">Uložit</button></td><td><button type="submit" name="list" value="list">Seznam uživatelů</button></td>
  </tr>
  </table>
 </form>
    </body>
</html>
