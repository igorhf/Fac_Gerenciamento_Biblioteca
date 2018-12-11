<%-- 
    Document   : alterarUsuario
    Created on : 08/12/2018, 21:48:16
    Author     : Ig0r
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="utilitarios.Conecta_Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Usuario</title>
    </head>
    <body>
        <%
            Conecta_Banco conn = new Conecta_Banco();
            Connection conecxao = conn.conectaMysql("db_biblioteca");
        if(session.getAttribute("id") !=null){
            if(conecxao != null){
                %>
                    <h2>ALTERAR USUARIO</h2>
                    <form action="alterarUsuario.jsp" method="get">
                            <div>
                                <label>NOME: </label><input type="text" name="nome" required>
                                <label>CPF: </label><input type="password" name="cpf" required>
                                <input type="submit" name="btn_alterar" value="Alterar">
                                <a style="text-decoration: none; padding: 5px 12px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>
                            </div>                
                    </form>
                    <hr>
                    <p>Será permitido só alteração dos dados do usuario logado.</p>
                    <%
                if(request.getParameter("btn_alterar") != null){                    
                    String nome = request.getParameter("nome");
                    String cpf = request.getParameter("cpf");
                    String id = session.getAttribute("id").toString();
                    if(nome != null && cpf != null){            
                        Statement st;
                        String sql = "UPDATE usuario set nome='"+nome+"',cpf='"+cpf+"' where id="+id+"";
                        st = conecxao.createStatement();
                        st.executeUpdate(sql);             
                        response.sendRedirect("index.jsp");            
                }else{
                    out.print("todos os campos deve ser preenchido");
                }
            }            
            }else{
            out.print("sistema não conectado");
            }      
        }else{
            out.print("<h1>VOCÊ PRECISA ESTÁ LOGADO PARA REALIZAR AS ALTERAÇÕES</h1>");
            %>
            <a style="text-decoration: none; padding: 5px 13px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>        
            <%
        }    
        %>        
    </body>
</html>
