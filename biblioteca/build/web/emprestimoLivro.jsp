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
                display: inline-block;
                margin-left:10px;
            }
        </style>
    </head>
    <body>
        <%
            Conecta_Banco conn = new Conecta_Banco();
            Connection conecxao = conn.conectaMysql("db_biblioteca");
        if(session.getAttribute("id") !=null){
            if(conecxao != null){
                %>
        <h2>EMPRESTIMO LIVRO</h2>
                    <form action="emprestimoLivro.jsp" method="get">
                            <div>
                                <label>ID LIVRO: </label><input type="text" name="id" required><label> Informer um ID</label><br><br>                                
                                <input type="submit" name="btn_emprestimo" value="Emprestimo">
                                <a style="text-decoration: none; padding: 5px 13px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>
                            </div>                
                    </form>
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
                        <%            
                        }
                        rss.close();
                        %>
                    </div>
                    <div>
                        <hr>
                        <h2>LIVROS EM EMPRESTIMOS</h2>
                        <%
                        Statement stt;
                        stt = conecxao.createStatement();
                        String livro = "select a.id,b.nome,c.nome from associacao a join usuario b on  b.id=a.idUsuario join livros c on c.id=a.idLivros";            
                        ResultSet rrs;
                        rrs = sta.executeQuery(livro);
                        while(rrs.next()){
                        String id = rrs.getString("id");
                        String nomeU = rrs.getString("b.nome");
                        String nomeL = rrs.getString("c.nome");
                        %>
                        <p><b>ID:</b> <%out.print(id);%>, <b>NOME DO USUARIO:</b> <%out.print(nomeU);%>, <b>NOME DO LIVRO:</b> <%out.print(nomeL);%></p>  
                        <%            
                        }
                        rss.close();
                        %>
                    </div>
                            <%
                if(request.getParameter("btn_emprestimo") != null){                   
                    String id = request.getParameter("id");
                    String id1 = session.getAttribute("id").toString();
                    if(id != null){            
                        Statement st;
                        String sql = "INSERT INTO associacao(idUsuario,idLivros)VALUES('"+id1+"','"+id+"')";
                        st = conecxao.createStatement();
                        st.executeUpdate(sql);                                    
                }else{
                    out.print("todos os campos deve ser preenchido");
                }
            }            
            }else{
            out.print("sistema não conectado");
            }      
        }else{
            out.print("<h1>VOCÊ PRECISA ESTÁ LOGADO PARA REALIZAR O EMPRESTIMO DO LIVRO AO USUARIO</h1>");
            %>
            <a style="text-decoration: none; padding: 5px 13px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>        
            <%
        }    
        %>
    </body>
</html>
