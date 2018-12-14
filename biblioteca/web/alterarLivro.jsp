<%-- 
    Document   : alterarLivro
    Created on : 09/12/2018, 00:56:31
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
            if(conecxao != null){
                %>
                    <h2>ALTERAR LIVRO</h2>
                    <form action="alterarLivro.jsp" method="get">
                            <div>
                                <label>ID: </label><input type="text" name="id" required><label> Informer um ID</label><br><br>
                                <label>NOME: </label><input type="text" name="nome" required><label> Informer um novo nome</label><br><br>
                                <label>TIPO DE LIVRO: </label><select name="tipo_livro">
                                <%
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
                                %>
                                </select><br><br>
                                <input type="submit" name="btn_alterar" value="Alterar">
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
                        <hr>
                        <%            
                        }
                        rss.close();
                        %>            
                                
                    <%
                if(request.getParameter("btn_alterar") != null){                    
                    String nome = request.getParameter("nome");
                    String tipo = request.getParameter("tipo_livro");
                    String id = request.getParameter("id");
                    if(nome != null && tipo != null){            
                        Statement st;
                        String sql = "UPDATE livros set nome='"+nome+"',tipo_livro='"+tipo+"' where id="+id+"";
                        st = conecxao.createStatement();
                        st.executeUpdate(sql);
                        response.sendRedirect("alterarLivro.jsp");
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
