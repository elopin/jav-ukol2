<%--
    JSP stránka pro zachytávání výjimek.
--%>
<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chyba registrace</title>
    </head>
    <body>
        <h1>Chyba při vyplnění registračních údajů uživatele.</h1>
        Zpráva:
        <%=exception.getMessage() %>
    </body>
</html>
