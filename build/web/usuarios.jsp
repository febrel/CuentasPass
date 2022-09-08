<%-- 
    Document   : usuarios
    Created on : 02-jun-2019, 17:40:13
    Author     : Febre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/centrar.css">

        <!-- Favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="img/bloqueado.png" />

        <title>Agregar Usuario</title>
    </head>
    <body>

    <center>

        <div class="modal-dialog text-center">
            <div class="abs-center" >
                <div class="modal-content text-dark ">

                    <div class="text-center text-dark font-italic " >
                        <h3>Agregar Nuevo Usuario</h3>

                    </div>
                    <div>
                        <form method="post" action="Ejecuta">

                            <div class="padding p-3">

                                <input class="form-control" type="text" name="txtCedula" placeholder="Cédula" autocomplete="off"> <br>


                                <input class="form-control" type="text" name="txtNombre" placeholder="Nombres" autocomplete="off"> <br>


                                <input class="form-control" type="text" name="txtUsuario" placeholder="Usuario" autocomplete="off" > <br>


                                <input class="form-control" type="password" name="txtPass" placeholder="Contraseña" autocomplete="off"> <br>


                                <input class="form-control" type="mail" name="txtCorreo" placeholder="Correo" autocomplete="off"> <br>

                                <input class="form-control btn btn-success" type="submit"  name="realiza" value="Agregar"> <br>                         

                            </div>
                        </form>
                    </div>
                </div>
            </div>

    </center>

</body>
</html>

