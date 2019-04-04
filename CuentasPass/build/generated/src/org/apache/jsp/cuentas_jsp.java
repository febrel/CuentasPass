package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import clases.Consultas;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import clases.Conexion;

public final class cuentas_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("        <meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/centrar.css\">\n");
      out.write("        <title>Cuentas</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");
            Conexion cone = new Conexion();
            PreparedStatement pre = null;
            ResultSet rs = null;

            // Creo un objeto de clase consultas para acceder a sus metodos
            Consultas objConsul = new Consultas();

        
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\" text-center text-light font-italic\">\n");
      out.write("            <h3>Cuentas del usuario <var class=\"text-primary font-italic\"> ");
      out.print( sesion.getAttribute("usuario"));
      out.write(" </var></h3>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"container mt-1  \"> \n");
      out.write("            <div class=\"card text-light bg-dark\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"padding  p-3\"> \n");
      out.write("                    <form action=\"Ejecuta\"  method=\"post\" >\n");
      out.write("\n");
      out.write("                        ");

                            String usuarioId = (String) sesion.getAttribute("usuario");
                            String idCli = objConsul.retornarId_Usuario(usuarioId);
                        
      out.write("\n");
      out.write("                        <input type=\"hidden\" name =\"idCliente\" value=\"");
      out.print(idCli);
      out.write("\">\n");
      out.write("                        <input class=\"btn btn-success\" type=\"submit\"  name=\"realiza\" value=\"Nuevo\"> <br>\n");
      out.write("                        <br>\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("                    <div class=\"card-body\">\n");
      out.write("                        <table class=\"table table-hover\">\n");
      out.write("                            <thead>\n");
      out.write("                                <tr>\n");
      out.write("\n");
      out.write("                                    <th>ID</th>\n");
      out.write("                                    <th>Nombre</th>\n");
      out.write("                                    <th>Usuario</th>\n");
      out.write("                                    <th>Contraseña</th>\n");
      out.write("                                    <th>Acciones</th>\n");
      out.write("\n");
      out.write("                                </tr>\n");
      out.write("                            </thead>\n");
      out.write("                            <tbody>   \n");
      out.write("\n");
      out.write("                                ");

                                    //Capturo y trasformo a string
                                    // String usuario =String.valueOf(sesion.getAttribute("externo"));

                                    String usuario = (String) sesion.getAttribute("usuario");

                                    String id = objConsul.retornarId_Usuario(usuario);

                                    if (id != null) {

                                        // String sql = "SELECT cu.id_cuentas, cu.nombre, cu.usuario, cu.pass  FROM cuentas cu , usuarios usu where cu.id_usuario_fk = usu.id_usuario and usu.id_usuario = " + id + ";";
                                        String sql = "SELECT * FROM cuentas cu , usuarios usu where cu.id_usuario_fk = usu.id_usuario and usu.id_usuario = " + id + ";";
                                        PreparedStatement ps = cone.getConnection().prepareStatement(sql);
                                        rs = ps.executeQuery();

                                        while (rs.next()) {

                                
      out.write("   \n");
      out.write("                                <tr>\n");
      out.write("                                    <td >");
      out.print(rs.getString("id_cuentas"));
      out.write("</td>\n");
      out.write("                                    <td >");
      out.print(rs.getString("nombre"));
      out.write("</td>\n");
      out.write("                                    <td >");
      out.print(rs.getString("usuario"));
      out.write("</td>\n");
      out.write("                                    <td >");
      out.print(rs.getString("pass"));
      out.write("</td>\n");
      out.write("                                    <td>\n");
      out.write("                                        <form method=\"post\" action=\"Ejecuta\">\n");
      out.write("\n");
      out.write("                                            <input type=\"hidden\" name =\"id\" value=\"");
      out.print(rs.getString("id_cuentas"));
      out.write("\">\n");
      out.write("\n");
      out.write("                                            <input class=\"btn btn-warning\" type=\"submit\" name =\"realiza\" value=\"Editar\">\n");
      out.write("                                            <input class=\"btn btn-danger\" type=\"submit\" name =\"realiza\"  value=\"Eliminar\">\n");
      out.write("                                            <input class=\"btn text-dark\" type=\"submit\" name =\"realiza\"  value=\"Ver\">\n");
      out.write("                                        </form>\n");
      out.write("                                    </td>\n");
      out.write("                                </tr>\n");
      out.write("                                ");

                                        }
                                    }
                                
      out.write("\n");
      out.write("\n");
      out.write("                            </tbody>           \n");
      out.write("                        </table>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"container padding mt-2\">\n");
      out.write("                <a class=\"btn  btn-danger float-left\" href=\"index.jsp?cerrar=true\">Cerrar</a>\n");
      out.write("                <a class=\"btn btn-primary float-right\">Exportar</a>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
