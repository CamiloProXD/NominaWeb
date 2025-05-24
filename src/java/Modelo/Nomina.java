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
    public String auxTransporte;
    public String comisiones;

    public Nomina() {
    }

    public Nomina(String diasTrabajados, String auxTransporte, String comisiones) {
        this.diasTrabajados = diasTrabajados;
        this.auxTransporte = auxTransporte;
        this.comisiones = comisiones;
    }

    public Nomina(String diasTrabajados, String auxTransporte, String comisiones, String cedula, String nombres, String apellidos, String telefono, String correo, String cargo, String nContrato, double salarioBase) {
        super(cedula, nombres, apellidos, telefono, correo, cargo, nContrato, salarioBase);
        this.diasTrabajados = diasTrabajados;
        this.auxTransporte = auxTransporte;
        this.comisiones = comisiones;
    }

    

    

    public String getDiasTrabajados() {
        return diasTrabajados;
    }

    public void setDiasTrabajados(String diasTrabajados) {
        this.diasTrabajados = diasTrabajados;
    }

    public String getAuxTransporte() {
        return auxTransporte;
    }

    public void setAuxTransporte(String auxTransporte) {
        this.auxTransporte = auxTransporte;
    }

    public String getComisiones() {
        return comisiones;
    }

    public void setComisiones(String comisiones) {
        this.comisiones = comisiones;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 41 * hash + Objects.hashCode(this.diasTrabajados);
        hash = 41 * hash + Objects.hashCode(this.auxTransporte);
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
        if (!Objects.equals(this.auxTransporte, other.auxTransporte)) {
            return false;
        }
        return Objects.equals(this.comisiones, other.comisiones);
    }

    
    
    
}
