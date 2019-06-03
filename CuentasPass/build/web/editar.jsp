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
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/centrar.css">
        
        <!-- Favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="img/bloqueado.png" />
        
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
                        
                        <div class="padding p-3">
                            <label for="exampleInputEmail1" class="float-left">Id</label>
                            <input class="form-control "  type="text" name="txtId" placeholder="Id" autocomplete="off" value="${cuentas.getId_cuentas()}" readonly="readonly"> <br>
                       
                            <label for="exampleInputEmail1" class="float-left">Cuenta</label>
                            <input class="form-control" type="text" name="txtNombre" placeholder="Nombre" autocomplete="off" value="${cuentas.getNombre()}"> <br>
                    
                            <label for="exampleInputEmail1" class="float-left">Usuario - Correo</label>
                            <input class="form-control" type="text" name="txtUsuario" placeholder="Usuario" autocomplete="off" value="${cuentas.getUsuario()}"> <br>
                         
                            <label for="exampleInputEmail1" class="float-left">Contraseña</label>
                            <input class="form-control" type="text" name="txtPass" placeholder="Contraseña" autocomplete="off" value="${cuentas.getPass()}"> <br>
                            
                            <input   class="btn btn-primary" type="submit"  name="realiza" value="Actualizar">  <br>
                        </div>
                            
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
