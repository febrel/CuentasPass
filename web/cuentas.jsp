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
        

        <title>Cuentas</title>
    </head>
    <body >
        
       


        <%            
            Conexion cone = new Conexion();
            PreparedStatement pre = null;
            ResultSet rs = null;

            // Creo un objeto de clase consultas para acceder a sus metodos
            Consultas objConsul = new Consultas();

        %>

        
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
        
       

        <div class="container mt-4 mb-2"> 
            <div class="card ">

                <div class="padding  p-3"> 


                    <form action="Ejecuta"  method="post" >

                        <%
                            String usuarioId = (String) sesion.getAttribute("usuario");
                            String idCli = objConsul.retornarId_Usuario(usuarioId);
                        %>
                        
                        
                    
                    <br>

                    </form>
                    
                
                    <form method="post" action="Ejecuta"> 
                            <div class="row">
                              <div class="col">
                                <input type="hidden" name ="idCliente" value="<%=idCli%>">
                                <input class="btn btn-success" type="submit"  name="realiza" value="Nuevo"> <br>
                              </div>
  
                    </form>
                               
                                
                    <form>
                            
                              <div class="col d-flex flex-row-reverse">
                             
                                <input type="text" class="form-control" name="txtBuscar" autocomplete="off">
                                <input type="submit" class="btn btn-info" value="Buscar">
                               
                              </div>
                            </div>
                 
                      </form> 
                  
                        

                    <div class="card-body ">
                        <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>

                                    <th >Nombre</th>
                                    <th>Usuario</th>
                                    <th>Contraseña Temporal</th>
                                    <th class="text-center">Acciones</th>

                                </tr>
                            </thead>
                            <tbody> 
                                
                                

                                <%
                                    //Capturo y trasformo a string
                                    String usuario = (String) sesion.getAttribute("usuario");
                                    String nombreBuscar = request.getParameter("txtBuscar");
                                    
                                    String id = objConsul.retornarId_Usuario(usuario);

                                    if (id != null && nombreBuscar == null) {

                                        String sql = "SELECT * FROM cuentas cu , usuarios usu WHERE cu.id_usuario_fk = usu.id_usuario and usu.id_usuario = " + id + " ORDER BY cu.nombre ASC;";
                                        PreparedStatement ps = cone.getConnection().prepareStatement(sql);
                                        rs = ps.executeQuery();

                                        while (rs.next()) {

                                %>   
                                <tr>

                                    <td ><%=rs.getString("nombre")%></td>
                                    <td ><%=rs.getString("usuario")%></td>
                                    <td ><%=rs.getString("pass")%></td>
                                    <td>
                                        <form method="post" action="Ejecuta">

                                            <input type="hidden" name ="id" value="<%=rs.getString("id_cuentas")%>">
                                            
                                            <input class="btn btn-warning" type="submit" name ="realiza" value="Editar">
                                            <input onclick="return confirm('Está Seguro de Eliminar?')" class="btn btn-danger btn-delete" type="submit" name ="realiza"  value="Eliminar">
                                            <input  class="btn btn-dark" type="submit" name ="realiza"  value="Ver">

                                        </form>
                                    </td>
                                </tr>
                                
                               
                                <%
                                                             
                                        }

                                    } if( nombreBuscar != null){
                             
                                        String sql2 = "SELECT * FROM cuentas cu , usuarios usu WHERE cu.id_usuario_fk = usu.id_usuario and usu.id_usuario = " + id + " and cu.nombre like '%" + nombreBuscar + "%' ORDER BY cu.nombre ASC";

                                        PreparedStatement ps = cone.getConnection().prepareStatement(sql2);
                                        rs = ps.executeQuery();

                                        while (rs.next()) {

                      
                                %>
                                
                                <tr>

                                    <td ><%=rs.getString("nombre")%></td>
                                    <td ><%=rs.getString("usuario")%></td>
                                    <td ><%=rs.getString("pass")%></td>
                                    <td>
                                        <form method="post" action="Ejecuta">

                                            <input type="hidden" name ="id" value="<%=rs.getString("id_cuentas")%>">

                                            <input class="btn btn-warning" type="submit" name ="realiza" value="Editar">
                                            <input onclick="return confirm('Está Seguro de Eliminar?')" class="btn btn-danger btn-delete" type="submit" name ="realiza"  value="Eliminar">
                                            <input  class="btn btn-dark" type="submit" name ="realiza"  value="Ver">

                                        </form>
                                    </td>
                                </tr>
                                
                                <%
                                
                                }
                                
                               }else{
                               System.out.println("Error");
}
                                 %>

                            </tbody>           
                        </table>
                                
                       </div>
                    </div>
                </div>
            </div>

  
    </body>
</html>
