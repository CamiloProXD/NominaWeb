/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Camilo
 */
public class Nomina extends Empleado {
    public int diasTrabajados;
    public static double auxTransporte = 200000;
    public double comisiones;

    public Nomina() {
    }

    public Nomina(int diasTrabajados, double comisiones) {
        this.diasTrabajados = diasTrabajados;
        this.comisiones = comisiones;
    }

    public int getDiasTrabajados() {
        return diasTrabajados;
    }

    public void setDiasTrabajados(int diasTrabajados) {
        this.diasTrabajados = diasTrabajados;
    }

    public static double getAuxTransporte() {
        return auxTransporte;
    }

    public static void setAuxTransporte(double auxTransporte) {
        Nomina.auxTransporte = auxTransporte;
    }

    public double getComisiones() {
        return comisiones;
    }

    public void setComisiones(double comisiones) {
        this.comisiones = comisiones;
    }
    
    
}
