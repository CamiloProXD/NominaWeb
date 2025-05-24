/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import Modelo.Nomina;

/**
 *
 * @author Camilo
 */
public class NominaCTO extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        switch (accion) {
            case "crear": {
                request.getRequestDispatcher("ViewCrearEmpleado.jsp").forward(request, response);
                break;
            }
            case "crearEmpleado": {
                String cedula = request.getParameter("txt_cedula");
                String nombres = request.getParameter("txt_nombres");
                String apellidos = request.getParameter("txt_apellidos");
                String telefono = request.getParameter("txt_tel");
                String correo = request.getParameter("txt_correo");
                String cargo = request.getParameter("txt_cargo");
                String nContrato = request.getParameter("txt_nContrato");
                double salarioBase = Double.parseDouble(request.getParameter("txt_salarioBase"));

                if (EmpleadoDAO.existeCedula(cedula)) {
                    request.setAttribute("error", "La cédula " + cedula + " ya está registrada");
                    request.getRequestDispatcher("ViewCrearEmpleado.jsp").forward(request, response);
                    return;
                }
                try {
                    Empleado nuevoEmpleado = new Empleado(
                            cedula, nombres, apellidos, telefono, correo,
                            cargo, nContrato, salarioBase
                    );
                    EmpleadoDAO.agregarEmpleado(nuevoEmpleado);

                    response.sendRedirect("exitoRegistro.jsp");
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "El salario debe ser un número válido");
                    request.getRequestDispatcher("ViewCrearEmpleado.jsp").forward(request, response);
                }
                break;
            }
            case "ver": {
                request.getRequestDispatcher("ViewVerNomina.jsp").forward(request, response);
                break;
            }

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
