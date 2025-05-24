/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.ArrayList;

/**
 *
 * @author Camilo
 */
public class EmpleadoDAO {

    public static ArrayList<Empleado> empleados = new ArrayList<Empleado>();

    public static boolean existeCedula(String cedula) {
        for (Empleado emp : empleados) {
            if (emp != null && emp.getCedula() != null && emp.getCedula().equals(cedula)) {
                return true;
            }
        }
        return false;
    }

    public static Empleado buscarPorCedula(String cedula) {
        for (Empleado emp : empleados) {
            if (emp != null && emp.getCedula() != null && emp.getCedula().equals(cedula)) {
                return emp;
            }
        }
        return null;
    }
    
    public static boolean agregarEmpleado(Empleado empleado) {
        if (!existeCedula(empleado.getCedula())) {
            empleados.add(empleado);
            return true;
        }
        return false;
    }
}
