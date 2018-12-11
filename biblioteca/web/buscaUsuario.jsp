<%-- 
    Document   : buscaUsuario
    Created on : 09/12/2018, 00:54:07
    Author     : Ig0r
--%>

<%@page import="utilitarios.Conecta_Banco"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Busca de Usuario</title>
    </head>
    <body>
            <%
            Conecta_Banco conn = new Conecta_Banco();
            Connection conecxao = conn.conectaMysql("db_biblioteca");
            %>
            <form name="formul" action="buscaUsuario.jsp" method="get">
            <p>BUSCAR USUARIO</p>
            <label>NOME: </label><input type="text" name="nome" required><label>  Informe um nome !!!</label><br><br>            
            <input type="submit" name="btn_busca" value="Consultar" />
            <a style="text-decoration: none; padding: 5px 12px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>
            </form>            
            <%            
            if(request.getParameter("btn_busca") != null){ 
            Statement stm;
            stm = conecxao.createStatement();
            String n = request.getParameter("nome");
            String select = "SELECT * FROM usuario where nome='"+n+"'";            
            ResultSet rs;
            rs = stm.executeQuery(select);
            %>
            
            <%
            while(rs.next()){
            String id = rs.getString("id");
            String nome = rs.getString("nome");
            String cpf = rs.getString("cpf");
            %>
            <p>ID: <%out.print(id);%>, NOME: <%out.print(nome);%>, CPF: <%out.print(cpf);%></p>                
            <%
                }
            rs.close();
            }
            %>
    </body>
</html>
