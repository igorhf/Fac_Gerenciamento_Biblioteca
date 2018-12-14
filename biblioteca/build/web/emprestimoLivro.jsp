<%-- 
    Document   : emprestimoLivro
    Created on : 09/12/2018, 15:20:43
    Author     : Ig0r
--%>

<%@page import="java.sql.Connection"%>
<%@page import="utilitarios.Conecta_Banco"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Emprestimo de Livro</title>
        <style>
            div{
                float: left;
                display: table-cell;
                margin-left:10px;
                
            }
            .master{
                width: 100%;
                
            }
        </style>
    </head>
    <body>
        <%
            Conecta_Banco conn = new Conecta_Banco();
            Connection conecxao = conn.conectaMysql("db_biblioteca");
            if(conecxao != null){
                %>
        <h2>EMPRESTIMO DE LIVRO AO USUARIO</h2>
        <div class="master">
                    <form action="emprestimoLivro.jsp" method="get">
                            <div>
                                <label>ID USUARIO: </label><input type="text" name="id_nome" required><label> Informer um ID</label><br><br>                                
                                <label>ID LIVRO: </label><input type="text" name="id" required><label> Informer um ID</label><br><br>                                
                                <input type="submit" name="btn_emprestimo" value="Emprestimo">
                                <a style="text-decoration: none; padding: 5px 13px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>
                            </div>                
                    </form>
        </div>    
                    <div>
                        <hr>
                        <h2>LISTA DE LIVROS</h2>
                        <%
                        Statement sta;
                        sta = conecxao.createStatement();
                        String livros = "SELECT * FROM livros";            
                        ResultSet rss;
                        rss = sta.executeQuery(livros);
                        while(rss.next()){
                        String id = rss.getString("id");
                        String nome = rss.getString("nome");
                        String tipo = rss.getString("tipo_livro");
                        %>
                        <p><b>ID:</b> <%out.print(id);%>, <b>NOME:</b> <%out.print(nome);%>, <b>CATEGORIA:</b> <%out.print(tipo);%></p>  
                        <hr>
                        <%            
                        }
                        rss.close();
                        %>
                    </div>
                    <div>
                        <hr>
                        <h2>TABELA USUARIO</h2>
                        <%
                        Statement sts;
                        sts = conecxao.createStatement();
                        String usuario = "SELECT * FROM usuario";            
                        ResultSet rs;
                        rs = sts.executeQuery(usuario);
                        while(rs.next()){
                        String id = rs.getString("id");
                        String nome = rs.getString("nome");
                        String cpf = rs.getString("cpf");
                        %>
                        <p><b>ID:</b> <%out.print(id);%>, <b>NOME:</b> <%out.print(nome);%>, <b>CPF:</b> <%out.print(cpf);%></p>  
                        <hr>
                        <%            
                        }
                        rs.close();
                        %>
                    </div>
                    <div>
                        <hr>
                        <h2>LIVROS EM EMPRESTIMOS</h2>
                        <%
                        Statement stt;
                        stt = conecxao.createStatement();
                        String livro = "select a.id,b.nome,c.nome from associacao a join usuario b on  b.id=a.idUsuario join livros c on c.id=a.idLivros";            
                        ResultSet rrss;
                        rrss = stt.executeQuery(livro);
                        while(rrss.next()){
                        String id = rrss.getString("id");
                        String nomeU = rrss.getString("b.nome");
                        String nomeL = rrss.getString("c.nome");
                        %>
                        <p><b>ID:</b> <%out.print(id);%>, <b>NOME DO USUARIO:</b> <%out.print(nomeU);%>, <b>NOME DO LIVRO:</b> <%out.print(nomeL);%></p>  
                        <hr>
                        <%            
                        }
                        rrss.close();
                        %>
                    </div>
                            <%
                if(request.getParameter("btn_emprestimo") != null){                   
                    String id = request.getParameter("id");
                    String id1 = request.getParameter("id_nome");
                    if(id != null){            
                        Statement st;
                        String sql = "INSERT INTO associacao(idUsuario,idLivros)VALUES('"+id1+"','"+id+"')";
                        st = conecxao.createStatement();
                        st.executeUpdate(sql);
                        response.sendRedirect("emprestimoLivro.jsp");
                }else{
                    out.print("todos os campos deve ser preenchido");
                }
            }            
            }else{
            out.print("<h1>BANCO DE DADOS DESCONECTADO</h1>");
            %>
            <a style="text-decoration: none; padding: 5px 13px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>        
            <%
            }      
            
        %>
    </body>
</html>
