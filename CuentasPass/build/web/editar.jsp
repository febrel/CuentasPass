<%-- 
    Document   : editar
    Created on : 22-mar-2019, 12:12:38
    Author     : Febre
--%>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/centrar.css">
        <title>Editar</title>
    </head>
    <body>



        <div class="modal-dialog text-center">

            <div class="abs-center" >

                <div class="modal-content text-light bg-dark">

                    <div class="text-center text-light font-italic">
                        <h3>Editar Cuenta</h3>
                    </div>

                    <form  method="post" action="Ejecuta">

                        <img src="img/carnet2.png" />
                        <input class="form-group" type="text" name="txtId" placeholder="Id" value="${cuentas.getId_cuentas()}" readonly="readonly"> <br>

                        <img src="img/usuario2.png" />
                        <input class="form-group" type="text" name="txtNombre" placeholder="Nombre" value="${cuentas.getNombre()}"> <br>


                        <img src="img/email2.png" />
                        <input class="form-group" type="text" name="txtUsuario" placeholder="Usuario" value="${cuentas.getUsuario()}"> <br>


                        <img src="img/clave2.png" />
                        <input class="form-group" type="text" name="txtPass" placeholder="Contraseña" value="${cuentas.getPass()}"> <br>

                        <input   class="btn btn-primary" type="submit"  name="realiza" value="Actualizar">  <br>
                        <br>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
