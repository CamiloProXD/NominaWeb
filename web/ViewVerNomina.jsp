<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, Modelo.Nomina"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Nóminas</title>
    <style>
        /* Estilos mejorados */
        .descuento { color: #e74c3c; }
        .beneficio { color: #27ae60; }
        .horas-extras { color: #f39c12; }
        .total-net { font-weight: bold; background-color: #e8f4fc; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px; text-align: left; border: 1px solid #ddd; }
        th { background-color: #3498db; color: white; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Listado Completo de Nóminas</h1>
        
        <table>
            <thead>
                <tr>
                    <th>Empleado</th>
                    <th>Cédula</th>
                    <th>Días</th>
                    <th>Salario Base</th>
                    <th>Horas Extras</th>
                    <th>Comisiones</th>
                    <th>Descuentos</th>
                    <th>Aux. Transporte</th>
                    <th>Total Neto</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Nomina> listaNominas = (List<Nomina>) request.getAttribute("listaNominas");
                    NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("es", "CO"));
                    
                    if (listaNominas != null && !listaNominas.isEmpty()) {
                        for (Nomina nomina : listaNominas) {
                            double salarioProporcional = (nomina.getSalarioBase() / 30) * 
                                Double.parseDouble(nomina.getDiasTrabajados());
                            double horasExtrasValor = nomina.calcularValorHorasExtras();
                            double comisiones = nomina.getComisiones() != null ? 
                                Double.parseDouble(nomina.getComisiones()) : 0;
                            double descuentos = nomina.calcularDescuentos();
                            double auxTransporte = nomina.calcularAuxilioTransporte();
                            double totalNeto = nomina.calcularTotalNeto();
                %>
                <tr>
                    <td><%= nomina.getNombres() %> <%= nomina.getApellidos() %></td>
                    <td><%= nomina.getCedula() %></td>
                    <td><%= nomina.getDiasTrabajados() %></td>
                    <td><%= nf.format(nomina.getSalarioBase()) %></td>
                    <td class="horas-extras">
                        <%= nomina.getHorasExtras() != null ? nomina.getHorasExtras() : "0" %> hrs<br>
                        <%= nf.format(horasExtrasValor) %>
                    </td>
                    <td><%= nf.format(comisiones) %></td>
                    <td class="descuento"><%= nf.format(descuentos) %></td>
                    <td class="beneficio"><%= nf.format(auxTransporte) %></td>
                    <td class="total-net"><%= nf.format(totalNeto) %></td>
                    <td>
                        <a href="detalleNomina.jsp?cedula=<%= nomina.getCedula() %>">Ver Detalle</a>
                    </td>
                </tr>
                <% 
                        }
                    } else { 
                %>
                <tr>
                    <td colspan="10" style="text-align: center;">No hay nóminas registradas</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>