package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

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
      out.write(" \n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("    <head>\n");
      out.write("        <title>Login</title>\n");
      out.write("        <meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <!-- FRAMEWORK BOOTSTRAP para el estilo de la pagina-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("\n");
      out.write("        <!-- Los iconos tipo Solid de Fontawesome-->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://use.fontawesome.com/releases/v5.0.8/css/solid.css\">\n");
      out.write("\n");
      out.write("        <!-- Nuestro css-->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/index.css\" th:href=\"@{css/index.css}\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"modal-dialog text-center\">\n");
      out.write("            <div class=\"col-sm-8 main-section\">\n");
      out.write("                <div class=\"modal-content\">\n");
      out.write("                    <div class=\"col-12 user-img\">\n");
      out.write("                        <img src=\"img/bloqueado.png\" />\n");
      out.write("                    </div>\n");
      out.write("                    <form class=\"col-12\"  method=\"post\" placeholder=\"Id\" action=\"Ingresar\">\n");
      out.write("                        <div class=\"form-group\" id=\"user-group\">\n");
      out.write("                            <input type=\"text\" class=\"form-control\" placeholder=\"Usuario\" name=\"username\"/>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\" action=\"Ingresar\" id=\"contrasena-group\">\n");
      out.write("                            <input type=\"password\" class=\"form-control\" placeholder=\"Contraseña\" name=\"password\"/>\n");
      out.write("                        </div>\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-primary\" name=\"btnIniciar\" ><i class=\"fas fa-sign-in-alt\"></i>  Ingresar </button>\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("                    ");

                        // Para verificar si hay sesiones activas 
                        HttpSession sesion = request.getSession();

                        // Con esto se encamina las respuestas al servlet
                        int ingreso;

                        // Para ver si tienes los parametros del servlet
                        if (request.getAttribute("ingreso") != null) {
                            ingreso = (int) request.getAttribute("ingreso");

                            // Aqui se crea la session por primera vez
                            if (ingreso == 1) {
                                sesion.setAttribute("ingreso", ingreso); // Se necesita 2 parametros 
                                sesion.setAttribute("usuario", request.getAttribute("usuario")); // Se necesita 2 parametros y recupero del servlet

                                response.sendRedirect("cuentas.jsp");
                            }

                        }

                        //Cuando cierra secion como php destruye la secion
                        if (request.getParameter("cerrar") != null) {
                            sesion.invalidate();

                        }


                    
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
