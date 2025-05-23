/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Camilo
 */
public class Empleado extends Persona {
    public String cargo;
    public int nContrato;
    public double salarioBase;

    public Empleado() {
    }

    public Empleado(String cargo, int nContrato, double salarioBase) {
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

    public int getnContrato() {
        return nContrato;
    }

    public void setnContrato(int nContrato) {
        this.nContrato = nContrato;
    }

    public double getSalarioBase() {
        return salarioBase;
    }

    public void setSalarioBase(double salarioBase) {
        this.salarioBase = salarioBase;
    }
    
    
}
