<%-- 
    Document   : index
    Created on : 08/12/2018, 19:31:04
    Author     : Ig0r
--%>

<%@page import="java.sql.Connection"%>
<%@page import="utilitarios.Conecta_Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Pagina Principal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="menu.css">
    </head>
    <body>
        <h1 style="text-align: center;color:  lightseagreen">GERENCIAMENTO DE BIBLIOTECA</h1>        

        <nav>
            <div class="usuario">
                <p>USUARIO</p>
                <ul>
                    <li><a href="Formulario.jsp">Cadastro de primeiro login</a></li> 
                    <li><a href="buscaUsuario.jsp">Busca de dados de um usuário</a></li>
                    <li><a href="alterarUsuario.jsp">Alteração de dados de um usuário</a></li>
                    <li><a href="removeUsuario.jsp">Remoção de um usuário</a></li>            
                </ul>
            </div>
            <div class="biblioteca">
                <p>LIVROS</p>
                <ul>
                    <li><a href="CadastroLivro.jsp">Cadastro de Livros</a></li>
                    <li><a href="alterarLivro.jsp">Alteração de dados de livros</a></li>
                    <li><a href="removeLivro.jsp">Remoção de Livros</a></li>
                    <li><a href="emprestimoLivro.jsp">Empréstimo de livro a um usuário</a></li>
                </ul>
            </div>    
        </nav>       
            <%
            Conecta_Banco conn = new Conecta_Banco();
            Connection conecxao = conn.conectaMysql("db_biblioteca");
            if(conecxao != null){
                %>
                <p style="color: green"><%out.print("BANCO DE DADOS CONECTADO");%></p>
                <%
            }else{
                %>
                <p style="color: red"><%out.print("BANCO DE DADOS DESCONECTADO");%></p>
                <%
            }
            %>        
    </body>
</html>

