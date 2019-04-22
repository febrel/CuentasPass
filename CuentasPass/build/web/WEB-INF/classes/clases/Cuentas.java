package clases;

/**
 *
 * @author Febre
 */
public class Cuentas {

    // LLamo al algoritmo
    Algoritmo objAl = new Algoritmo();

    private String id_cuentas;
    private String nombre;
    private String usuario;
    private String pass;
    private String arreglo;
    private int id_suaruio_fk;

    // Metodos - Funciones
    public String getId_cuentas() {
        return id_cuentas;
    }

    public void setId_cuentas(String id_cuentas) {
        this.id_cuentas = id_cuentas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    // Retorna la contraseña Desencriptada
    public String getArreglo() {

        // Creamos un arreglo para almacenar la cadena
        int arregloC[] = objAl.ConvCadenaArreglo(this.arreglo);

        // Desencriptamos y retornamos el valor
        String contraseñaDese = objAl.desencriptar(arregloC);

        return contraseñaDese;
    }

    public void setArreglo(String arreglo) {
        this.arreglo = arreglo;
    }

    public int getId_suaruio_fk() {
        return id_suaruio_fk;
    }

    public void setId_suaruio_fk(int id_suaruio_fk) {
        this.id_suaruio_fk = id_suaruio_fk;
    }

}
