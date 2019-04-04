package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class editar_jsp extends org.apache.jasper.runtime.HttpJspBase
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


    // Para verificar si hay sesiones activas 
    HttpSession sesion = request.getSession();

    // En caso de nivel es null
    if (sesion.getAttribute("ingreso") == null) {
        response.sendRedirect("index.jsp");

    } else {// Si paso por variable logueo
        String nivel = session.getAttribute("ingreso").toString();

        // Si no es administrador se va a inicio
        if (!nivel.equals("1")) {
            response.sendRedirect("index.jsp");
        }
    }


      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/centrar.css\">\n");
      out.write("        <title>Editar</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"modal-dialog text-center\">\n");
      out.write("\n");
      out.write("            <div class=\"abs-center\" >\n");
      out.write("\n");
      out.write("                <div class=\"modal-content text-light bg-dark\">\n");
      out.write("\n");
      out.write("                    <div class=\"text-center text-light font-italic\">\n");
      out.write("                        <h3>Editar Cuenta</h3>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <form  method=\"post\" action=\"Ejecuta\">\n");
      out.write("\n");
      out.write("                        <img src=\"img/carnet2.png\" />\n");
      out.write("                        <input class=\"form-group\" type=\"text\" name=\"txtId\" placeholder=\"Id\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cuentas.getId_cuentas()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" readonly=\"readonly\"> <br>\n");
      out.write("\n");
      out.write("                        <img src=\"img/usuario2.png\" />\n");
      out.write("                        <input class=\"form-group\" type=\"text\" name=\"txtNombre\" placeholder=\"Nombre\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cuentas.getNombre()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"> <br>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <img src=\"img/email2.png\" />\n");
      out.write("                        <input class=\"form-group\" type=\"text\" name=\"txtUsuario\" placeholder=\"Usuario\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cuentas.getUsuario()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"> <br>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <img src=\"img/clave2.png\" />\n");
      out.write("                        <input class=\"form-group\" type=\"text\" name=\"txtPass\" placeholder=\"Contraseña\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${cuentas.getPass()}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\"> <br>\n");
      out.write("\n");
      out.write("                        <input   class=\"btn btn-primary\" type=\"submit\"  name=\"realiza\" value=\"Actualizar\">  <br>\n");
      out.write("                        <br>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
