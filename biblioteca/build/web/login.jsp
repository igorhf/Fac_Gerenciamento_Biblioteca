<%-- 
    Document   : login
    Created on : 08/12/2018, 19:53:41
    Author     : Ig0r
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utilitarios.Conecta_Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            Conecta_Banco conn = new Conecta_Banco();
            Connection conecxao = conn.conectaMysql("db_biblioteca");
        
            Statement stm;
            stm = conecxao.createStatement();
            String n = request.getParameter("usuario");
            String c = request.getParameter("senha");
            out.print(n);
            out.print(c);
            String select = "SELECT * FROM usuario where nome='"+n+"' and cpf='"+c+"'";            
            ResultSet rs;
            rs = stm.executeQuery(select);
            while(rs.next()){
            String id = rs.getString("id");
            String nome = rs.getString("nome");
            
            session.setAttribute("id", id);
            session.setAttribute("nome", nome);
                        
            } 
            rs.close();
            response.sendRedirect("index.jsp");
        %>       
    </body>
</html>
