package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Febre
 */
public class Conexion {

    public static Connection con;//obj tipo Conexión

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        String driver = "com.mysql.jdbc.Driver";/*Driver para conectar "Driver de clase"*/
        String user = "root";
        String password = "";
        String url = "jdbc:mysql://localhost:3306/crud?autoReconnect=true&useSSL=false";/*URL para conectar "DATABASE URL"*/
        Class.forName(driver);//Diver jdbc para trabajr con access
        con = DriverManager.getConnection(url, user, password);
        return con;//retorna la cioneccion url+ruta bd
    }

    //Objeto tipo Connection para majenar la conecion
    public Connection AbrirConexion() throws ClassNotFoundException, SQLException {
        con = getConnection();
        return con;
    }

    //Cerrar la coneccion 
    public void CerrarConexion() throws SQLException {
        con.close();
    }

    public void desconectar() {
        con = null;
    }
}
