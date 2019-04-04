package servlets;

import clases.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Febre
 */
public class Ingresar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Objeto sql
        Consultas objConsultas = new Consultas();

        // Con esto se encamina las respuestas al servlet
        RequestDispatcher rd = null;

        // Variables
        String usuario;
        String pass;
        int ingreso;

        // Si el boton hace una accion
        if (request.getParameter("btnIniciar") != null) {
            usuario = request.getParameter("username");
            pass = request.getParameter("password");

            // Uso el metodo de consultas para acceder
            ingreso = objConsultas.autenticar(usuario, pass);

            // Para enviar parametros desde el servlet
            request.setAttribute("ingreso", ingreso);
            request.setAttribute("usuario", usuario);

            // Se va comunicar con el index
            rd = request.getRequestDispatcher("index.jsp");

        }// Fin del if

        // Va encaminar respuestas y solicitudes con el index.jsp
        rd.forward(request, response);

    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
