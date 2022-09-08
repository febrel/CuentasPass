package servlets;

import clases.Algoritmo;
import clases.Consultas;
import clases.Cuentas;
import java.util.List;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Febre
 */
public class Ejecuta extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Objetos
        Algoritmo objAl = new Algoritmo();

        Consultas objConsul = new Consultas();

        String realiza = request.getParameter("realiza");

        try {

            switch (realiza) {
                case "Nuevo":
                    // Captura el id enviado desde jsp
                    String ideClie = request.getParameter("idCliente");
                    request.setAttribute("cliente", ideClie);

                    request.getRequestDispatcher("agregar.jsp").forward(request, response);

                    break;
                case "Guardar":

                    // Variables utitlizadas
                    String nombre = request.getParameter("txtNombre");
                    String usuario = request.getParameter("txtUsuario");
                    String contraseña = request.getParameter("txtPass");
                    int idClien = Integer.parseInt(request.getParameter("txtCli"));

                    // Se envia la contraseña para encriptar
                    String pass = objAl.generaPass(contraseña);

                    // Envio contraseña y genero codigo ASCII
                    int contenedor[] = objAl.transformaASCIINumero(contraseña);

                    // Lleno un arreglo con mas valores 
                    int contenedorRelle[] = objAl.retornaArregloRelleno(contenedor);

                    // Convierto el Arreglo para subirlo
                    String subirArreglo = objAl.ConvArregloCadena(contenedorRelle);

                    // Envia el sql
                    objConsul.AgregarCuenta(nombre, usuario, pass, subirArreglo, idClien);

                    // Enviar siempre asi para cuando se refresque no se vuelva a enviar el formulario
                    response.sendRedirect("cuentas.jsp");
                    break;

                case "Editar":

                    String ide = request.getParameter("id");

                    Cuentas cu = objConsul.listarId(ide);

                    //Enviamos objeto cuentas request
                    request.setAttribute("cuentas", cu);

                    request.getRequestDispatcher("editar.jsp").forward(request, response);
                    break;

                case "Agregar":
                    // Variables utitlizadas
                    String cedulaUsu = request.getParameter("txtCedula");
                    String nombresUsu = request.getParameter("txtNombre");
                    String usuarioUsu = request.getParameter("txtUsuario");
                    String contraseñaUsu = request.getParameter("txtPass");
                    String correoUsu = request.getParameter("txtCorreo");

                    // Se envia la contraseña para encriptar
                    String passUsu = objAl.generaPass(contraseñaUsu);

                    // Envio contraseña y genero codigo ASCII
                    int contenedorUsu[] = objAl.transformaASCIINumero(contraseñaUsu);

                    // Lleno un arreglo con mas valores 
                    int contenedorRelleUsu[] = objAl.retornaArregloRelleno(contenedorUsu);

                    // Convierto el Arreglo para subirlo
                    String subirArregloUsu = objAl.ConvArregloCadena(contenedorRelleUsu);

                    // Envia el sql
                    objConsul.AgregarUsuario(cedulaUsu, nombresUsu, usuarioUsu, passUsu, subirArregloUsu, correoUsu);

                    // Enviar siempre asi para cuando se refresque no se vuelva a enviar el formulario
                    response.sendRedirect("index.jsp");

                    break;

                case "Actualizar":

                    // Variables utitlizadas
                    int id2 = Integer.parseInt(request.getParameter("txtId")); //Recupero id cliente
                    String nombre2 = request.getParameter("txtNombre");
                    String usuario2 = request.getParameter("txtUsuario");
                    String contraseña2 = request.getParameter("txtPass");

                    // Se envia la contraseña para encriptar
                    String pass2 = objAl.generaPass(contraseña2);

                    // Envio contraseña y genero codigo ASCII
                    int contenedor2[] = objAl.transformaASCIINumero(contraseña2);

                    // Lleno un arreglo con mas valores 
                    int contenedorRelle2[] = objAl.retornaArregloRelleno(contenedor2);

                    // Convierto el Arreglo para subirlo
                    String subirArreglo2 = objAl.ConvArregloCadena(contenedorRelle2);

                    String retornoPass = objConsul.retornaPass(id2);

                    //Condicional para actualizar
                    if (retornoPass.equals(contraseña2)) {

                        // Envia el sql
                        objConsul.modificarCuentas(nombre2, usuario2, id2);

                    } else {

                        // Envia el sql
                        objConsul.modificarCuentasCompleto(nombre2, usuario2, pass2, subirArreglo2, id2);

                    }

                    response.sendRedirect("cuentas.jsp");

                    break;

                case "Eliminar":
                    // Capturo el id 
                    int ide2 = Integer.parseInt(request.getParameter("id"));

                    objConsul.eliminarCuenta(ide2);
                    request.getRequestDispatcher("cuentas.jsp").forward(request, response);

                    break;

                case "Buscar":
                    
                    // Captura el buscar
                    String buscar = request.getParameter("txtBuscar");
                   
                    
                     objConsul.devuelveBusqueda(buscar);
                     
                     //Enviamos objeto cuentas request
               
                     response.sendRedirect("cuentas.jsp");

                    break;

                case "Ver":

                    String ide3 = request.getParameter("id");

                    //Enviamos objeto cuentas request
                    Cuentas cu2 = objConsul.listarId(ide3);

                    //Enviamos objeto cuentas request
                    request.setAttribute("cuentas", cu2);

                    request.getRequestDispatcher("mostrar.jsp").forward(request, response);

                    break;

                default:

                    break;

            }

        } catch (Exception e) {
            response.sendRedirect("error.jsp");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
