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
        
        
        <!-- JS-->
        <script src="js/jquery_3.2.1min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        
        <!-- Favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="img/bloqueado.png" />
        <title>Mostrar</title>
    </head>
    <body>
        
        
                
               <style>
  .hello-msg{
    font-size: 18px;
    color: #fff;
    margin-right: 20px;
  }


  .close-msg{
    font-size: 25px;
    color: #fff;
    margin-right: 10px;
  }

  .close-msg:hover{
    font-size: 25px;
    filter: saturate(180%);
    color: #d1545a;
    margin-right: 10px;
  }

</style>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        
        <img class="navbar-brand" width="40" height="45" src="img/clock.svg" alt="">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            
          </ul>
          <div class="form-inline my-2 my-lg-0 mr-sm-1 hello-msg"> 
               Hola,&nbsp; 
              <span class="mr-sm-2 hello-msg text-primary font-italic"> <%= sesion.getAttribute("usuario")%></span>
              <span class="my-2 my-sm-0" ><a class="close-msg"  href="index.jsp?cerrar=true"><img class="navbar-brand" width="40" height="40" src="img/close.svg" alt=""></a></span>
              
             
          </div>
        </div>
      </nav>



        <%            Conexion cone = new Conexion();
            PreparedStatement pre = null;
            ResultSet rs = null;

            // Creo un objeto de clase consultas para acceder a sus metodos
            Consultas objConsul = new Consultas();

        %>

  

        <div class="container mt-4""> 
            <div class="card text-dark ">

                <div class="padding  p-3">
                   <div class=" text-center text-dark font-italic">
                        <h3>Contraseña Desencriptada</h3>
                    </div>


                    <div class="card-body">
                        <div class="table-responsive">
                        <table class="table table-striped table-hover">
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
                                    <td class="bg-success text-white" data-toggle="tooltip" data-placement="left"
              title="Bad weather condition">${cuentas.getArreglo()}</td>

                                </tr>

                            </tbody>           
                        </table>

                    </div>
                 </div>
                </div>
            </div>
    </body>
</html>
