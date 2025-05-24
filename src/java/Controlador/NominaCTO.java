package Controlador;

import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Modelo.Nomina;
import Modelo.NominaDAO;

public class NominaCTO extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        switch (accion) {
            case "crear": {
                request.getRequestDispatcher("ViewCrearEmpleado.jsp").forward(request, response);
                break;
            }

            case "crearEmpleado": {
                crearEmpleado(request, response);
                break;
            }

            case "buscarParaNomina": {
                buscarParaNomina(request, response);
                break;
            }

            case "guardarNomina": {
                guardarNomina(request, response);
                break;
            }

            case "ver": {
                verNominas(request, response);
                break;
            }

            default: {
                response.sendRedirect("index.jsp");
            }
        }
    }

    private void crearEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String cedula = request.getParameter("txt_cedula");
            String nombres = request.getParameter("txt_nombres");
            String apellidos = request.getParameter("txt_apellidos");
            String telefono = request.getParameter("txt_tel");
            String correo = request.getParameter("txt_correo");
            String cargo = request.getParameter("txt_cargo");
            String nContrato = request.getParameter("txt_nContrato");
            double salarioBase = Double.parseDouble(request.getParameter("txt_salarioBase"));

            if (EmpleadoDAO.existeCedula(cedula)) {
                request.setAttribute("error", "La cédula ya está registrada");
                request.setAttribute("empleadoTemp", new Empleado(
                        cedula, nombres, apellidos, telefono, correo,
                        cargo, nContrato, salarioBase
                ));
                request.getRequestDispatcher("ViewCrearEmpleado.jsp").forward(request, response);
                return;
            }

            Empleado nuevoEmpleado = new Empleado(
                    cedula, nombres, apellidos, telefono, correo,
                    cargo, nContrato, salarioBase
            );
            EmpleadoDAO.agregarEmpleado(nuevoEmpleado);
            response.sendRedirect("exitoRegistro.jsp?cedula=" + cedula);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "El salario debe ser un número válido");
            request.getRequestDispatcher("ViewCrearEmpleado.jsp").forward(request, response);
        }
    }

    private void buscarParaNomina(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cedula = request.getParameter("txt_cedula");

        if (cedula == null || cedula.trim().isEmpty()) {
            request.setAttribute("error", "La cédula es obligatoria");
            request.getRequestDispatcher("buscarEmpleado.jsp").forward(request, response);
            return;
        }

        Empleado empleado = EmpleadoDAO.buscarPorCedula(cedula);
        if (empleado == null) {
            request.setAttribute("error", "No se encontró empleado con cédula " + cedula);
            request.getRequestDispatcher("buscarEmpleado.jsp").forward(request, response);
        } else {
            request.setAttribute("empleado", empleado);
            request.getRequestDispatcher("formularioNomina.jsp").forward(request, response);
        }
    }

    private void guardarNomina(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String cedula = request.getParameter("txt_cedula");
            Empleado empleado = EmpleadoDAO.buscarPorCedula(cedula);

            if (empleado != null) {
                Nomina nomina = new Nomina(
                        request.getParameter("diasTrabajados"),
                        request.getParameter("comisiones"),
                        empleado.getCedula(),
                        empleado.getNombres(),
                        empleado.getApellidos(),
                        empleado.getTel(),
                        empleado.getEmail(),
                        empleado.getCargo(),
                        empleado.getnContrato(),
                        empleado.getSalarioBase()
                );

                // Agregar esta línea para guardar las horas extras
                nomina.setHorasExtras(request.getParameter("horasExtras"));

                NominaDAO.agregarNomina(nomina);
                request.setAttribute("nomina", nomina);
                request.getRequestDispatcher("detalleNomina.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Empleado no encontrado");
                request.getRequestDispatcher("buscarEmpleado.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error al guardar nómina: " + e.getMessage());
            request.getRequestDispatcher("buscarEmpleado.jsp").forward(request, response);
        }
    }

    private void verNominas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("listaNominas", NominaDAO.getNominas());
        request.getRequestDispatcher("ViewVerNomina.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
