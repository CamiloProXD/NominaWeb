/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.Objects;

/**
 *
 * @author Camilo
 */
public class Nomina extends Empleado {

    public String diasTrabajados;
    private static double auxilioTransporte = 200000;
    public String comisiones;
    private String horasExtras;
    private static final double salud = 0.04;
    private static final double pension = 0.04;
    private static final double horaExtra = 1.25;

    public Nomina() {
    }

    public Nomina(String diasTrabajados, String auxTransporte, String comisiones) {
        this.diasTrabajados = diasTrabajados;
        this.comisiones = comisiones;
    }

    public Nomina(String diasTrabajados, String comisiones, String cedula, String nombres, String apellidos, String telefono, String correo, String cargo, String nContrato, double salarioBase) {
        super(cedula, nombres, apellidos, telefono, correo, cargo, nContrato, salarioBase);
        this.diasTrabajados = diasTrabajados;
        this.comisiones = comisiones;
    }

    public boolean tieneDerechoTransporte() {
        return getSalarioBase() <= 2847000;
    }

    public double calcularAuxilioTransporte() {
        if (tieneDerechoTransporte()) {
            double dias = Double.parseDouble(diasTrabajados);
            return (auxilioTransporte / 30) * dias;
        }
        return 0;
    }

    public double calcularDescuentos() {
        double salarioDias = (getSalarioBase() / 30) * Double.parseDouble(diasTrabajados);
        return salarioDias * (salud + pension);
    }

    public double calcularTotalNeto() {
        double salarioProporcional = (getSalarioBase() / 30) * Double.parseDouble(diasTrabajados);
        double comision = comisiones != null ? Double.parseDouble(comisiones) : 0;
        return salarioProporcional - calcularDescuentos() + calcularAuxilioTransporte() + comision + calcularValorHorasExtras();
    }

    public double calcularValorHorasExtras() {
        if (horasExtras == null || horasExtras.isEmpty()) {
            return 0;
        }
        double horas = Double.parseDouble(horasExtras);
        double valorHoraNormal = (getSalarioBase() / 240); // 240 horas laborales mensuales
        return horas * valorHoraNormal * horaExtra;
    }

    public String getDiasTrabajados() {
        return diasTrabajados;
    }

    public void setDiasTrabajados(String diasTrabajados) {
        this.diasTrabajados = diasTrabajados;
    }

    public String getComisiones() {
        return comisiones;
    }

    public void setComisiones(String comisiones) {
        this.comisiones = comisiones;
    }

    public static double getAuxilioTransporte() {
        return auxilioTransporte;
    }

    public static void setAuxilioTransporte(double auxilioTransporte) {
        Nomina.auxilioTransporte = auxilioTransporte;
    }

    public String getHorasExtras() {
        return horasExtras;
    }

    public void setHorasExtras(String horasExtras) {
        this.horasExtras = horasExtras;
    }
    
    

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 41 * hash + Objects.hashCode(this.diasTrabajados);
        hash = 41 * hash + Objects.hashCode(this.comisiones);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Nomina other = (Nomina) obj;
        if (!Objects.equals(this.diasTrabajados, other.diasTrabajados)) {
            return false;
        }
        return Objects.equals(this.comisiones, other.comisiones);
    }

}
