/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Camilo
 */
public class NominaDAO {
    public static ArrayList<Nomina> nominas = new ArrayList<Nomina>();
    
    public static void agregarNomina(Nomina nomina) {
        nominas.add(nomina);
    }
    
    public static List<Nomina> getNominasPorEmpleado(String cedula) {
        List<Nomina> result = new ArrayList<>();
        for (Nomina n : nominas) {
            if (n.getCedula().equals(cedula)) {
                result.add(n);
            }
        }
        return result;
    }
    
    public static List<Nomina> getNominas() {
        return new ArrayList<>(nominas); 
    }
}
