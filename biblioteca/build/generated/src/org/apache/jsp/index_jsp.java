package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import utilitarios.Conecta_Banco;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"pt-br\">\n");
      out.write("    <head>\n");
      out.write("        <title>Pagina Principal</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"menu.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
           
        if(session.getAttribute("id") != null){        
        
      out.write("\n");
      out.write("        <div class=\"login-cadastro\">\n");
      out.write("                <div>\n");
      out.write("                    <ul>\n");
      out.write("                       <li><a href=\"deslogin.jsp\">Deslogin</a></li> \n");
      out.write("                    </ul> \n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <ul>\n");
      out.write("                       <li><a href=\"Formulario.jsp\">Cadastro de primeiro login</a></li> \n");
      out.write("                    </ul> \n");
      out.write("                </div>           \n");
      out.write("        </div>\n");
      out.write("        <nav>\n");
      out.write("            <div class=\"usuario\">\n");
      out.write("                <p>USUARIO</p>\n");
      out.write("                <ul>\n");
      out.write("                    ");

                    String nome = session.getAttribute("nome").toString();                    
                    
      out.write("\n");
      out.write("                    <li><a class=\"use\" href=\"#\">");
out.print(nome.toUpperCase());
      out.write("</a></li>\n");
      out.write("                    <li><a href=\"\">Busca de dados de um usuário</a></li>\n");
      out.write("                    <li><a href=\"alterarUsuario.jsp\">Alteração de dados de um usuário</a></li>\n");
      out.write("                    <li><a href=\"\">Remoção de um usuário</a></li>            \n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"biblioteca\">\n");
      out.write("                <p>BIBLIOTECA</p>\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"CadastroLivro.jsp\">Cadastro de Livros</a></li>\n");
      out.write("                    <li><a href=\"\">Alteração de dados de livros</a></li>\n");
      out.write("                    <li><a href=\"\">Remoção de Livros</a></li>\n");
      out.write("                    <li><a href=\"\">Empréstimo de livro a um usuário</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>    \n");
      out.write("        </nav>\n");
      out.write("        ");

        }else{
        
      out.write("\n");
      out.write("        <div class=\"login-cadastro\">\n");
      out.write("            <form action=\"login.jsp\" method=\"get\">\n");
      out.write("                <div>\n");
      out.write("                <label>Usuario: </label><input type=\"text\" name=\"usuario\">\n");
      out.write("                <label>Senha: </label><input type=\"password\" name=\"senha\">\n");
      out.write("                <input type=\"submit\" name=\"btn_salvar\" value=\"Enviar\">\n");
      out.write("                </div>\n");
      out.write("                <div>\n");
      out.write("                    <ul>\n");
      out.write("                       <li><a href=\"Formulario.jsp\">Cadastro de primeiro login</a></li> \n");
      out.write("                    </ul> \n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("        <nav>\n");
      out.write("            <div class=\"usuario\">\n");
      out.write("                <p>USUARIO</p>\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"index.jsp\">Busca de dados de um usuário</a></li>\n");
      out.write("                    <li><a href=\"alterarUsuario.jsp\">Alteração de dados de um usuário</a></li>\n");
      out.write("                    <li><a href=\"index.jsp\">Remoção de um usuário</a></li>            \n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"biblioteca\">\n");
      out.write("                <p>BIBLIOTECA</p>\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"CadastroLivro.jsp\">Cadastro de Livros</a></li>\n");
      out.write("                    <li><a href=\"index.jsp\">Alteração de dados de livros</a></li>\n");
      out.write("                    <li><a href=\"index.jsp\">Remoção de Livros</a></li>\n");
      out.write("                    <li><a href=\"index.jsp\">Empréstimo de livro a um usuário</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>    \n");
      out.write("        </nav>\n");
      out.write("        ");

        }        
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
