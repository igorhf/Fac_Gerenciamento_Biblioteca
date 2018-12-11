<%-- 
    Document   : deslogin
    Created on : 08/12/2018, 20:59:33
    Author     : Ig0r
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deslogin</title>
    </head>
    <body>
        <%
        session.invalidate();        
        response.sendRedirect("index.jsp");
        %>
    </body>
</html>
