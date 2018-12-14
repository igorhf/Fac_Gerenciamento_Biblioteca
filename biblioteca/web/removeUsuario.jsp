<%-- 
    Document   : removeUsuario
    Created on : 09/12/2018, 00:55:26
    Author     : Ig0r
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="utilitarios.Conecta_Banco"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remover Usuario</title>
    </head>
    <body>
        <%
        Conecta_Banco conn = new Conecta_Banco();
            Connection conecxao = conn.conectaMysql("db_biblioteca");
            if(conecxao != null){
                %>
                    <h2>REMOVER USUARIO</h2>
                    <form action="removeUsuario.jsp" method="get">
                            <div>
                                <label>INFORMER UM ID: </label><input type="text" name="id"><br><br>                                
                                <input type="submit" name="btn_remove" value="Remover">
                                <a style="text-decoration: none; padding: 5px 13px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>
                            </div>                
                    </form>
                    <hr>
                              
                                
                    <%
            Statement stm;
            stm = conecxao.createStatement();
            String select = "SELECT * FROM usuario";            
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
            <hr>
            <%
                }
            rs.close();        
                if(request.getParameter("btn_remove") != null){                   
                    String id = request.getParameter("id");
                    if(id != null){            
                        Statement st;
                        String sql = "DELETE FROM usuario where id="+id+"";
                        st = conecxao.createStatement();
                        st.executeUpdate(sql);
                        response.sendRedirect("removeUsuario.jsp");
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
