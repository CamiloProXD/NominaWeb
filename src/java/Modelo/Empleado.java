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
public class Empleado extends Persona {

    public String cargo;
    public String nContrato;
    public double salarioBase;

    public Empleado() {
    }

    public Empleado(String cedula, String nombres, String apellidos,
            String telefono, String correo, String cargo,
            String nContrato, double salarioBase) {
        super(cedula, nombres, apellidos, telefono, correo);
        this.cargo = cargo;
        this.nContrato = nContrato;
        this.salarioBase = salarioBase;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getnContrato() {
        return nContrato;
    }

    public void setnContrato(String nContrato) {
        this.nContrato = nContrato;
    }

    public Double getSalarioBase() {
        return salarioBase;
    }

    public void setSalarioBase(Double salarioBase) {
        this.salarioBase = salarioBase;
    }
    

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 59 * hash + Objects.hashCode(this.cargo);
        hash = 59 * hash + Objects.hashCode(this.nContrato);
        hash = 59 * hash + Objects.hashCode(this.salarioBase);
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
        final Empleado other = (Empleado) obj;
        if (!Objects.equals(this.cargo, other.cargo)) {
            return false;
        }
        if (!Objects.equals(this.nContrato, other.nContrato)) {
            return false;
        }
        return Objects.equals(this.salarioBase, other.salarioBase);
    }

}
