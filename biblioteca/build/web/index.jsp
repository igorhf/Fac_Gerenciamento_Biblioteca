<%-- 
    Document   : index
    Created on : 08/12/2018, 19:31:04
    Author     : Ig0r
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
        <%           
        if(session.getAttribute("id") != null){        
        %>
        <div class="login-cadastro">
                <div>
                    <ul>
                       <li><a href="deslogin.jsp">Deslogin</a></li> 
                    </ul> 
                </div>
                <div>
                    <ul>
                       <li><a href="Formulario.jsp">Cadastro de primeiro login</a></li> 
                    </ul> 
                </div>           
        </div>
        <nav>
            <div class="usuario">
                <p>USUARIO</p>
                <ul>
                    <%
                    String nome = session.getAttribute("nome").toString();                    
                    %>
                    <li><a class="use" href="#"><%out.print(nome.toUpperCase());%></a></li>
                    <li><a href="buscaUsuario.jsp">Busca de dados de um usuário</a></li>
                    <li><a href="alterarUsuario.jsp">Alteração de dados de um usuário</a></li>
                    <li><a href="removeUsuario.jsp">Remoção de um usuário</a></li>            
                </ul>
            </div>
            <div class="biblioteca">
                <p>BIBLIOTECA</p>
                <ul>
                    <li><a href="CadastroLivro.jsp">Cadastro de Livros</a></li>
                    <li><a href="alterarLivro.jsp">Alteração de dados de livros</a></li>
                    <li><a href="removeLivro.jsp">Remoção de Livros</a></li>
                    <li><a href="emprestimoLivro.jsp">Empréstimo de livro a um usuário</a></li>
                </ul>
            </div>    
        </nav>
        <%
        }else{
        %>
        <div class="login-cadastro">
            <form action="login.jsp" method="get">
                <div>
                <label>Usuario: </label><input type="text" name="usuario">
                <label>Senha: </label><input type="password" name="senha">
                <input type="submit" name="btn_salvar" value="Enviar">
                </div>
                <div>
                    <ul>
                       <li><a href="Formulario.jsp">Cadastro de primeiro login</a></li> 
                    </ul> 
                </div>
            </form>
        </div>
        <nav>
            <div class="usuario">
                <p>USUARIO</p>
                <ul>
                    <li><a href="buscaUsuario.jsp">Busca de dados de um usuário</a></li>
                    <li><a href="alterarUsuario.jsp">Alteração de dados de um usuário</a></li>
                    <li><a href="removeUsuario.jsp">Remoção de um usuário</a></li>            
                </ul>
            </div>
            <div class="biblioteca">
                <p>BIBLIOTECA</p>
                <ul>
                    <li><a href="CadastroLivro.jsp">Cadastro de Livros</a></li>
                    <li><a href="alterarLivro.jsp">Alteração de dados de livros</a></li>
                    <li><a href="removeLivro.jsp">Remoção de Livros</a></li>
                    <li><a href="emprestimoLivro.jsp">Empréstimo de livro a um usuário</a></li>
                </ul>
            </div>    
        </nav>
        <%
        }        
        %>
    </body>
</html>

