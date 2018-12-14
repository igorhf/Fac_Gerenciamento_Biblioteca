<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utilitarios.Conecta_Banco"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : Formulario
    Created on : 05/12/2018, 18:52:02
    Author     : Ig0r
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
    </head>
    <body>
        <%
        Conecta_Banco conn = new Conecta_Banco();
        Connection conecxao = conn.conectaMysql("db_biblioteca");
        %>
        <form name="formul" action="Formulario.jsp" method="get">
            <p>CADASTRO USUARIO</p>
            <label>NOME: </label><input type="text" name="nome" required><br><br>
            <label>CPF: </label><input type="text" name="cpf" required><br><br>
            <input type="submit" name="btn_salvar" value="Salvar" />
            <a style="text-decoration: none; padding: 5px 12px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>
        </form> 
        <%        
        if(conecxao != null){
            String nome = request.getParameter("nome");
            String cpf = request.getParameter("cpf");
            if(nome != null && cpf != null){            
            Statement st;
            String sql = "INSERT INTO usuario(nome,cpf)VALUES('"+nome+"','"+cpf+"')";
            st = conecxao.createStatement();
            st.executeUpdate(sql);             
            out.print("dados salvo com sucesso");
            }else{
                out.print("todos os campos deve ser preenchido");
            }            
            }else{
            out.print("sistema não conectado");
            }        
        %>
    </body>
</html>
