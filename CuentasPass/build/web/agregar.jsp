<%-- 
    Document   : agregar
    Created on : 21-mar-2019, 16:05:39
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
        <title>Agregar</title>
    </head>
    <body>

    <center>

        <div class="modal-dialog text-center">
            <div class="abs-center" >
                <div class="modal-content text-light bg-dark">

                    <div class="text-center text-light font-italic " >
                        <h3>Agregar Cuenta</h3>

                    </div>
                    <div>
                        <form method="post" action="Ejecuta">

                            <img src="img/carnet2.png" />
                            <input type="text" name="txtCli" placeholder="Id" value="${cliente}"readonly="readonly"> <br>
                            <br>

                            <img src="img/usuario2.png" />
                            <input type="text" name="txtNombre" placeholder="Nombre"> <br>
                            <br>

                            <img src="img/email2.png" />
                            <input type="text" name="txtUsuario" placeholder="Usuario" > <br>
                            <br>

                            <img src="img/clave2.png" />
                            <input type="text" name="txtPass" placeholder="Contraseña"> <br>
                            <br>

                            <input class="btn btn-primary" type="submit"  name="realiza" value="Guardar"> <br>
                            <br>
                        </form>
                    </div>
                </div>
            </div>

    </center>

</body>
</html>
