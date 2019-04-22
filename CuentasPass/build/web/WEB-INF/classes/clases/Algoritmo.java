package clases;

/**
 *
 * @author Febre
 */
public class Algoritmo {

    public int[] transformaASCIINumero(String pass) {

        char caracterPass[] = pass.toCharArray();

        int[] valor = new int[pass.length()];

        // Bucle rrellena arreglo 
        for (int i = 0; i < caracterPass.length; i++) {
            valor[i] = (int) caracterPass[i];
        }

        return valor;

    }

    public int[] retornaArregloRelleno(int arreglo[]) {
        // Variables
        int j = 0;

        // Arreglo
        int nuevoArreglo[] = new int[arreglo.length];
        int arregloRelleno[] = new int[arreglo.length * 2];

        // Bucle para rrellenar el arreglo nuevo
        for (int i = 0; i < nuevoArreglo.length; i++) {
            nuevoArreglo[i] = generarAleatorio();
        }

        // Bucle para mezclar arreglo
        for (int i = 0; i < arreglo.length; i++) {
            arregloRelleno[j] = nuevoArreglo[i];
            j++;
            arregloRelleno[j] = arreglo[i] + 6; // Le sumo 6 para cambiar
            j++;
        }

        return arregloRelleno;
    }

    public int generarAleatorio() {
        int generado = (int) Math.round(Math.random() * (33 - 122) + 122);
        return generado;
    }

    public int generarAleatorioMenor() {
        int generado = (int) Math.round(Math.random() * (1 - 3) + 3);
        return generado;
    }

    public String ConvArregloCadena(int arreglo[]) {
        String cadena = "";

        for (int i = 0; i < arreglo.length; i++) {
            cadena = cadena + arreglo[i] + "-";

        }

        return cadena;
    }

    public int[] ConvCadenaArreglo(String cadena) {

        // Variables
        int contador = 0;

        // Para saber el tamaño del arreglo
        for (int i = 0; i < cadena.length(); i++) {
            if (cadena.charAt(i) == '-') {
                contador++;
            }
        }

        String contenedor[] = cadena.split("-");
        int arreglo[] = new int[contador];

        // Para cambiar de valor
        for (int i = 0; i < contador; i++) {
            arreglo[i] = Integer.parseInt(contenedor[i]);
        }

        return arreglo;
    }

    public String desencriptar(int arreglo[]) {
        String pass = "";
        char palabra[] = new char[arreglo.length];

        // Para almacenar arreglo
        for (int i = 0; i < arreglo.length; i++) {
            palabra[i] = (char) (arreglo[i] - 6);// Le resto 6 para desencriptar

            if (i % 2 != 0) {
                pass = pass + palabra[i];
            }
        }

        return pass;

    }

    public String generaPass(String pass) {

        String contra = "";
        char palabra[] = new char[pass.length() + generarAleatorioMenor()];

        for (int i = 0; i < palabra.length; i++) {
            palabra[i] = (char) generarAleatorio();
            contra = contra + palabra[i];
        }

        return contra;

    }

}
