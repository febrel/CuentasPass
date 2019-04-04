package servlets;

import clases.Algoritmo;
import clases.Consultas;
import clases.Cuentas;
import java.io.IOException;
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

                    // Variablesutitlizadas
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

                case "Actualizar":

                    // Variables utitlizadas
                    int id2 = Integer.parseInt(request.getParameter("txtId"));
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

                    // Envia el sql
                    objConsul.modificarCuentas(nombre2, usuario2, pass2, subirArreglo2, id2);
                    response.sendRedirect("cuentas.jsp");

                    break;

                case "Eliminar":
                    int ide2 = Integer.parseInt(request.getParameter("id"));

                    objConsul.eliminarCuenta(ide2);
                    request.getRequestDispatcher("cuentas.jsp").forward(request, response);

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
