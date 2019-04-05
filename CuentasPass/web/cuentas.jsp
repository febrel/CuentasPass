<%-- 
    Document   : cuentas
    Created on : 21-mar-2019, 15:58:48
    Author     : Febre
--%>

<%@page import="clases.Consultas"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="clases.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

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

%>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/centrar.css">
        <title>Cuentas</title>
    </head>
    <body>


        <%            Conexion cone = new Conexion();
            PreparedStatement pre = null;
            ResultSet rs = null;

            // Creo un objeto de clase consultas para acceder a sus metodos
            Consultas objConsul = new Consultas();

        %>

        <div class=" text-center text-light font-italic">
            <h3>Cuentas del usuario <var class="text-primary font-italic"> <%= sesion.getAttribute("usuario")%> </var></h3>
        </div>

        <div class="container mt-1  "> 
            <div class="card text-light bg-dark">

                <div class="padding  p-3"> 
                    <form action="Ejecuta"  method="post" >

                        <%
                            String usuarioId = (String) sesion.getAttribute("usuario");
                            String idCli = objConsul.retornarId_Usuario(usuarioId);
                        %>
                        <input type="hidden" name ="idCliente" value="<%=idCli%>">
                        <input class="btn btn-success" type="submit"  name="realiza" value="Nuevo"> <br>
                        <br>

                    </form>

                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                                <tr>

                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Usuario</th>
                                    <th>Contraseña Temporal</th>
                                    <th>Acciones</th>

                                </tr>
                            </thead>
                            <tbody>   

                                <%
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

                                %>   
                                <tr>
                                    <td ><%=rs.getString("id_cuentas")%></td>
                                    <td ><%=rs.getString("nombre")%></td>
                                    <td ><%=rs.getString("usuario")%></td>
                                    <td ><%=rs.getString("pass")%></td>
                                    <td>
                                        <form method="post" action="Ejecuta">

                                            <input type="hidden" name ="id" value="<%=rs.getString("id_cuentas")%>">

                                            <input class="btn btn-warning" type="submit" name ="realiza" value="Editar">
                                            <input class="btn btn-danger" type="submit" name ="realiza"  value="Eliminar">
                                            <input class="btn text-dark" type="submit" name ="realiza"  value="Ver">
                                            
                                        </form>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>

                            </tbody>           
                        </table>

                    </div>
                </div>
            </div>

            <div class="container padding mt-2">
                <a class="btn  btn-danger float-left" href="index.jsp?cerrar=true">Cerrar</a>
                <a class="btn btn-primary float-right">Exportar</a>
            </div>

    </body>
</html>
