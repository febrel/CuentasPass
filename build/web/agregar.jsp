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
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/centrar.css">
        
        <!-- JS-->
        <script src="js/jquery_3.2.1min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        
        <!-- Favicon-->
        <link rel="shortcut icon" type="image/x-icon" href="img/bloqueado.png" />
        
        <title>Agregar</title>
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


       
        <div class="mx-auto" style="width: 40%;">
            
            <div class="col-auto text-center mt-4" >
                <div class="modal-content text-dark">

                    <div class="text-center text-dark font-italic " >
                        <h3>Agregar Cuenta</h3>

                    </div>
                    
                    <div>
                        <form method="post" action="Ejecuta">

                            <div class="form-control padding p-3">
                               
                                <input class="form-control" type="hidden" name="txtCli" placeholder="Id" value="${cliente}"readonly="readonly" autocomplete="off"> <br>
                        
                                <label for="exampleInputEmail1" class="float-left">Cuenta</label>
                                <input class="form-control" type="text" name="txtNombre" placeholder="Nombre" autocomplete="off" required> <br>
                          

                                <label for="exampleInputEmail1" class="float-left">Usuario - Correo</label>
                                <input class="form-control" type="text" name="txtUsuario" placeholder="Usuario - Correo" autocomplete="off" required> <br>
                         
                                <label for="exampleInputEmail1" class="float-left">Contraseña</label>
                                <input class="form-control" type="text" name="txtPass" placeholder="Contraseña" autocomplete="off" required> <br>
                        
                                <input class="form-control btn btn-primary" type="submit"  name="realiza" value="Guardar"> <br>                         
                            
                            </div>
                        </form>
                    </div>
                </div>
            </div>
                           
                        
                                



</body>
</html>
