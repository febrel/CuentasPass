<%-- 
    Document   : mostrar
    Created on : 04-abr-2019, 11:10:32
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
<html lang="es">
    <head>

        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/centrar.css">
        
        <!-- Favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="img/bloqueado.png" />
        <title>Mostrar</title>
    </head>
    <body>


        <%            Conexion cone = new Conexion();
            PreparedStatement pre = null;
            ResultSet rs = null;

            // Creo un objeto de clase consultas para acceder a sus metodos
            Consultas objConsul = new Consultas();

        %>

        <div class=" text-center text-light font-italic">
            <h3>Contraseña Desencriptada</h3>
        </div>

        <div class="container mt-1  "> 
            <div class="card text-light bg-dark">

                <div class="padding  p-3"> 


                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                                <tr>

                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Usuario</th>
                                    <th>Contraseña</th>

                                </tr>
                            </thead>
                            <tbody>   

                                <tr>
                                    <td >${cuentas.getId_cuentas()}</td>
                                    <td >${cuentas.getNombre()}</td>
                                    <td >${cuentas.getUsuario()}</td>
                                    <td >${cuentas.getArreglo()}</td>

                                </tr>

                            </tbody>           
                        </table>

                    </div>
                </div>
            </div>
    </body>
</html>
