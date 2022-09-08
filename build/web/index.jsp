<%-- 
    Document   : index
    Created on : 21-mar-2019, 15:53:18
    Author     : Febre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %> 
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Login</title>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <!-- FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Los iconos tipo Solid de Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">

        <!-- Nuestro css-->
        <link rel="stylesheet" type="text/css" href="css/index.css" th:href="@{css/index.css}">

        <!-- Favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="img/bloqueado.png" />

    </head>
    <body>
        <div class="modal-dialog text-center">
            <div class="col-sm-8 main-section">
                <div class="modal-content">
                    <div class="col-12 user-img">
                        <img src="img/bloqueado.png" />
                    </div>
                    <form class="col-12"  method="post" placeholder="Id" action="Ingresar">
                        <div class="form-group" id="user-group">
                            <input type="text" class="form-control" placeholder="Usuario" name="username" autocomplete="off"/>
                        </div>
                        <div class="form-group" action="Ingresar" id="contrasena-group">
                            <input type="password" class="form-control" placeholder="Contraseña" name="password"/>
                        </div>
                        
                        
                        <button type="submit" class="form-control btn btn-primary" name="btnIniciar" ><i class="fas fa-sign-in-alt"></i>  Ingresar </button>
                      

                        <div class="col forgot ">
                           <a   href="usuarios.jsp">Registrate</a>
                        </div>


                    </form>

                    <%
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

                    %>


                </div>
            </div>
        </div>

    </body>
</html>
