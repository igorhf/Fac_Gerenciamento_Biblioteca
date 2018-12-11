<%-- 
    Document   : removeUsuario
    Created on : 09/12/2018, 00:55:26
    Author     : Ig0r
--%>
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
        if(session.getAttribute("id") !=null){
            if(conecxao != null){
                %>
                    <h2>REMOVER USUARIO</h2>
                    <form action="removeUsuario.jsp" method="get">
                            <div>
                                <label>REMOVER O USUARIO QUE ESTA LOGADO: </label>                                
                                <input type="submit" name="btn_remove" value="Remover">
                                <a style="text-decoration: none; padding: 5px 13px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>
                            </div>                
                    </form>
                    <hr>
                              
                                
                    <%
                if(request.getParameter("btn_remove") != null){                   
                    String id = session.getAttribute("id").toString();
                    if(id != null){            
                        Statement st;
                        String sql = "DELETE FROM usuario where id="+id+"";
                        st = conecxao.createStatement();
                        st.executeUpdate(sql);
                        session.invalidate();
                        response.sendRedirect("index.jsp");
                }else{
                    out.print("todos os campos deve ser preenchido");
                }
            }            
            }else{
            out.print("sistema não conectado");
            }      
        }else{
            out.print("<h1>VOCÊ PRECISA ESTÁ LOGADO PARA REALIZAR A REMOÇÃO DO USUARIO</h1>");
            %>
            <a style="text-decoration: none; padding: 5px 13px; background: lightgreen" href="index.jsp">VOLTAR AO MENU</a>        
            <%
        }    
        %>
        
    </body>
</html>
