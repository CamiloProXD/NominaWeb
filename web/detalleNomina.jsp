<%@page import="Modelo.Nomina"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de Nómina</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: #f5f5f5;
            }
            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: white;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            h1 {
                color: #2c3e50;
                border-bottom: 2px solid #3498db;
                padding-bottom: 10px;
                text-align: center;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #3498db;
                color: white;
            }
            .total {
                font-weight: bold;
                background-color: #e8f4fc;
            }
            .descuento {
                color: #e74c3c;
            }
            .beneficio {
                color: #27ae60;
            }
            .horas-extras {
                color: #f39c12;
            }
            .btn {
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                text-decoration: none;
                display: inline-block;
                margin: 10px 5px;
            }
            .btn-primary {
                background-color: #3498db;
                color: white;
            }
            .btn-secondary {
                background-color: #95a5a6;
                color: white;
            }
            .error {
                color: #e74c3c;
                font-weight: bold;
                text-align: center;
            }
            .empleado-info {
                background-color: #f8f9fa;
                padding: 15px;
                border-radius: 5px;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Comprobante Detallado de Nómina</h1>
            
            <% 
                Nomina nomina = (Nomina) request.getAttribute("nomina");
                NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("es", "CO"));
                
                if (nomina != null) { 
                    double salarioProporcional = (nomina.getSalarioBase() / 30) * Double.parseDouble(nomina.getDiasTrabajados());
                    double comisiones = nomina.getComisiones() != null ? Double.parseDouble(nomina.getComisiones()) : 0;
                    double descuentoSalud = salarioProporcional * 0.04;
                    double descuentoPension = salarioProporcional * 0.04;
                    double totalDescuentos = descuentoSalud + descuentoPension;
                    double auxTransporte = nomina.calcularAuxilioTransporte();
                    double horasExtrasValor = 0;
                    if (nomina.getHorasExtras() != null && !nomina.getHorasExtras().isEmpty()) {
                        double horasExtras = Double.parseDouble(nomina.getHorasExtras());
                        double valorHoraNormal = nomina.getSalarioBase() / 240; 
                        horasExtrasValor = horasExtras * valorHoraNormal * 1.25; 
                    }

                    double totalNeto = salarioProporcional - totalDescuentos + auxTransporte + comisiones + horasExtrasValor;
            %>
            
            <div class="empleado-info">
                <h2><%= nomina.getNombres() %> <%= nomina.getApellidos() %></h2>
                <p><strong>Cédula:</strong> <%= nomina.getCedula() %></p>
                <p><strong>Fecha de pago:</strong> <%= new java.util.Date() %></p>
                <p><strong>Días trabajados:</strong> <%= nomina.getDiasTrabajados() %></p>
                <% if (nomina.getHorasExtras() != null && !nomina.getHorasExtras().isEmpty()) { %>
                    <p><strong>Horas extras:</strong> <%= nomina.getHorasExtras() %> horas</p>
                <% } %>
            </div>
            
            <table>
                <tr>
                    <th>Concepto</th>
                    <th>Detalle</th>
                    <th>Valor</th>
                </tr>
                <tr>
                    <td>Salario Base</td>
                    <td><%= nomina.getDiasTrabajados() %> días trabajados</td>
                    <td><%= nf.format(salarioProporcional) %></td>
                </tr>
                <% if (horasExtrasValor > 0) { %>
                <tr class="horas-extras">
                    <td>Horas Extras</td>
                    <td>
                        <%= nomina.getHorasExtras() %> horas extras<br>
                        (Valor hora: <%= nf.format(nomina.getSalarioBase() / 240) %> + 25% recargo)
                    </td>
                    <td>+ <%= nf.format(horasExtrasValor) %></td>
                </tr>
                <% } %>
                <% if (comisiones > 0) { %>
                <tr>
                    <td>Comisiones</td>
                    <td>Ingresos adicionales</td>
                    <td>+ <%= nf.format(comisiones) %></td>
                </tr>
                <% } %>
                
                <!-- Descuentos -->
                <tr class="descuento">
                    <td>Descuento Salud</td>
                    <td>4% del salario</td>
                    <td>- <%= nf.format(descuentoSalud) %></td>
                </tr>
                <tr class="descuento">
                    <td>Descuento Pensión</td>
                    <td>4% del salario</td>
                    <td>- <%= nf.format(descuentoPension) %></td>
                </tr>
                
                <!-- Auxilio de transporte -->
                <% if (auxTransporte > 0) { %>
                <tr class="beneficio">
                    <td>Auxilio Transporte</td>
                    <td>Beneficio legal</td>
                    <td>+ <%= nf.format(auxTransporte) %></td>
                </tr>
                <% } %>
                
                <!-- Total neto -->
                <tr class="total">
                    <td colspan="2"><strong>TOTAL NETO A PAGAR</strong></td>
                    <td><strong><%= nf.format(totalNeto) %></strong></td>
                </tr>
            </table>
            
            <div style="text-align: center; margin-top: 20px;">
                <a href="javascript:window.print()" class="btn btn-primary">Imprimir Comprobante</a>
                <a href="index.jsp" class="btn btn-secondary">Volver al Inicio</a>
            </div>
            
            <% } else { %>
                <p class="error">No se encontró información de la nómina</p>
                <div style="text-align: center; margin-top: 20px;">
                    <a href="index.jsp" class="btn btn-secondary">Volver al Inicio</a>
                </div>
            <% } %>
        </div>
    </body>
</html>