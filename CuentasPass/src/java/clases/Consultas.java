package clases;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Febre
 */
public class Consultas {

    Conexion db = new Conexion();

    // Consultas
    public int autenticar(String usuarioI) {
        PreparedStatement pre = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM usuarios WHERE username = ? ";
            pre = db.getConnection().prepareStatement(sql);

            pre.setString(1, usuarioI);
            rs = pre.executeQuery();

            // Si se ejecuta retorna verdadero
            if (rs.absolute(1)) {
                return 1;

            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return 0;
    }

    //cambia
    public String retornaArreglo(String usuario) {
        String respuesta = null;
        String sql = "SELECT arreglo FROM usuarios WHERE username = '" + usuario + "';";
        try {
            PreparedStatement ps = db.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            // Recorre hasta que encuentre el valor si existe
            while (rs.next()) {
                respuesta = String.valueOf(rs.getString("arreglo"));
            }

        } catch (Exception e) {
            System.err.println(e);
        }

        return respuesta;

    }

    public String retornarId_Usuario(String usuario) {
        String respuesta = null;
        String sql = "SELECT id_usuario FROM usuarios WHERE username =  '" + usuario + "';";
        try {
            PreparedStatement ps = db.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            // Recorre hasta que encuentre el valor si existe
            while (rs.next()) {
                respuesta = String.valueOf(rs.getString("id_usuario"));
            }

        } catch (Exception e) {
            System.err.println(e);
        }

        return respuesta;
    }

    public String retornaPass(int id) {
        String respuesta = null;
        String sql = "SELECT pass FROM cuentas WHERE id_cuentas = '" + id + "';";
        try {
            PreparedStatement ps = db.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            // Recorre hasta que encuentre el valor si existe
            while (rs.next()) {
                respuesta = String.valueOf(rs.getString("pass"));
            }

        } catch (Exception e) {
            System.err.println(e);
        }

        return respuesta;

    }

    public Cuentas listarId(String usuario) {
        String respuesta = null;
        Cuentas c = new Cuentas();
        String sql = "SELECT * FROM cuentas WHERE id_cuentas = '" + usuario + "';";
        try {
            PreparedStatement ps = db.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            // Recorre hasta que encuentre el valor si existe
            while (rs.next()) {
                c.setId_cuentas(rs.getString(1));
                c.setNombre(rs.getString(2));
                c.setUsuario(rs.getString(3));
                c.setPass(rs.getString(4));
                c.setArreglo(rs.getString(5));

            }

        } catch (Exception e) {
            System.err.println(e);
        }

        return c;
    }

    // Ingresar
    public void AgregarCuenta(String nombreI, String usuarioI, String passI, String arregloI, int clienteI) {

        String sql = "INSERT INTO cuentas (id_cuentas, nombre, usuario, pass, arreglo, id_usuario_fk) VALUES( default,?, ?, ?, ? ,?)";

        try {
            PreparedStatement ps = db.getConnection().prepareStatement(sql);

            ps.setString(1, nombreI);
            ps.setString(2, usuarioI);
            ps.setString(3, passI);
            ps.setString(4, arregloI);
            ps.setInt(5, clienteI);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void AgregarUsuario(String cedulaI, String nombreI, String usuarioI, String passI, String arregloI, String correoI) {

        String sql = "INSERT INTO usuarios (id_usuario, cedula, nombres, username, pass, arreglo, correo) VALUES( default,? ,? ,? ,? ,? ,?)";

        try {
            PreparedStatement ps = db.getConnection().prepareStatement(sql);

            ps.setString(1, cedulaI);
            ps.setString(2, nombreI);
            ps.setString(3, usuarioI);
            ps.setString(4, passI);
            ps.setString(5, arregloI);
            ps.setString(6, correoI);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // Modificar
    public int modificarCuentasCompleto(String nombre, String usuario, String pass, String arreglo, int id) {
        int retorno = 0;

        String sql = ("UPDATE cuentas SET nombre=?, usuario=?, pass=?, arreglo=? WHERE id_cuentas =?");

        try {

            PreparedStatement pst = db.AbrirConexion().prepareStatement(sql);
            pst.setString(1, nombre);
            pst.setString(2, usuario);
            pst.setString(3, pass);
            pst.setString(4, arreglo);
            pst.setInt(5, id);
            retorno = pst.executeUpdate();
            pst.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return retorno;
    }

    public int modificarCuentas(String nombre, String usuario, int id) {
        int retorno = 0;

        String sql = ("UPDATE cuentas SET nombre=?, usuario=? WHERE id_cuentas =?");

        try {

            PreparedStatement pst = db.AbrirConexion().prepareStatement(sql);
            pst.setString(1, nombre);
            pst.setString(2, usuario);
            pst.setInt(3, id);
            retorno = pst.executeUpdate();
            pst.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return retorno;
    }

    // Eliminar
    public void eliminarCuenta(int id) {
        String sql = "DELETE FROM cuentas WHERE id_cuentas = ?";

        try {
            PreparedStatement pst = db.AbrirConexion().prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }

    }

}
