<%-- 
    Document   : CadastroLivro
    Created on : 07/12/2018, 19:26:27
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Conecta_Banco conn = new Conecta_Banco();
        Connection conecxao = conn.conectaMysql("db_biblioteca");
        %>
        <form name="formul" action="CadastroLivro.jsp" method="get">
            <p>CADASTRO LIVROS</p>
            <label>NOME: </label><input type="text" name="nome" required><br><br>
            <label>TIPO:</label>
            <select name="tipo_livro">
            <%
            if(conecxao != null){    
                Statement stm;
                stm = conecxao.createStatement();
                String select = "SELECT * FROM tipo";            
                ResultSet rs;
                rs = stm.executeQuery(select);
                while(rs.next()){
                String tipo = rs.getString("nome");
                %>
                <option><%=tipo%></option>
                <%            
                }
            }else{
                out.print("sistema não conectado");
            }
            %>
            </select><br><br>            
            <input type="submit" name="btn_salvar" value="Salvar" />
            <a style="text-decoration: none; padding: 5px 13px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>
        </form> 
        <%        
        if(conecxao != null){
            String nome = request.getParameter("nome");
            String tipo = request.getParameter("tipo_livro");
            if(nome != null && tipo != null){            
            Statement st;
            String sql = "INSERT INTO livros(nome,tipo_livro)VALUES('"+nome+"','"+tipo+"')";
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
