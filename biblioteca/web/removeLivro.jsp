<%-- 
    Document   : removeLivro
    Created on : 09/12/2018, 00:57:12
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
        <title>Remover Livro</title>
    </head>
    <body>
        <%
            Conecta_Banco conn = new Conecta_Banco();
            Connection conecxao = conn.conectaMysql("db_biblioteca");
        if(session.getAttribute("id") !=null){
            if(conecxao != null){
                %>
                    <h2>REMOVER LIVRO</h2>
                    <form action="removeLivro.jsp" method="get">
                            <div>
                                <label>ID: </label><input type="text" name="id" required><label> Informer um ID</label><br><br>
                                
                                <input type="submit" name="btn_alterar" value="Remover">
                                <a style="text-decoration: none; padding: 5px 13px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>
                            </div>                
                    </form>
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
                                
                    <%
                if(request.getParameter("btn_alterar") != null){                   
                    String id = request.getParameter("id");
                    if(id != null){            
                        Statement st;
                        String sql = "DELETE FROM livros where id="+id+"";
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
            out.print("<h1>VOCÊ PRECISA ESTÁ LOGADO PARA REALIZAR A REMOÇÃO DO LIVROS</h1>");
            %>
            <a style="text-decoration: none; padding: 5px 13px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>        
            <%
        }    
        %>
    </body>
</html>
