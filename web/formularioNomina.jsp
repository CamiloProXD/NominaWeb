<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="Modelo.Empleado"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Nómina</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                line-height: 1.6;
            }
            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f9f9f9;
            }
            h2 {
                color: #2c3e50;
                border-bottom: 2px solid #3498db;
                padding-bottom: 10px;
            }
            .empleado-info {
                background-color: #e8f4fc;
                padding: 15px;
                border-radius: 5px;
                margin-bottom: 20px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }
            input[type="number"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .btn {
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }
            .btn-primary {
                background-color: #3498db;
                color: white;
            }
            .btn-secondary {
                background-color: #95a5a6;
                color: white;
                text-decoration: none;
                display: inline-block;
                margin-left: 10px;
            }
            .error {
                color: #e74c3c;
                margin-bottom: 15px;
            }
            .info-note {
                font-size: 0.9em;
                color: #7f8c8d;
                margin-top: 5px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Registrar Nómina</h2>

            <%-- Mostrar mensaje de error si existe --%>
            <% if (request.getAttribute("error") != null) {%>
            <div class="error"><%= request.getAttribute("error")%></div>
            <% } %>

            <%-- Información del empleado --%>
            <div class="empleado-info">
                <%
                    Empleado empleado = (Empleado) request.getAttribute("empleado");
                    if (empleado != null) {
                        NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("es", "CO"));
                %>
                <h3><%= empleado.getNombres() + " " + empleado.getApellidos()%></h3>
                <p><strong>Cédula:</strong> <%= empleado.getCedula()%></p>
                <p><strong>Cargo:</strong> <%= empleado.getCargo()%></p>
                <p><strong>Salario Base:</strong> <%= nf.format(empleado.getSalarioBase())%></p>
                <p><strong>Valor Hora Normal:</strong> <%= nf.format(empleado.getSalarioBase() / 240)%></p>
                <p><strong>Auxilio Transporte:</strong> 
                    <%= empleado.getSalarioBase() <= 2847000 ? nf.format(200000) : "No aplica"%>
                </p>
                <% } else { %>
                <p class="error">No se encontró información del empleado</p>
                <% }%>
            </div>

            <%-- Formulario de nómina --%>
            <form action="NominaCTO" method="POST">
                <input type="hidden" name="accion" value="guardarNomina">
                <input type="hidden" name="txt_cedula" value="<%= empleado != null ? empleado.getCedula() : ""%>">

                <div class="form-group">
                    <label for="diasTrabajados">Días Trabajados:</label>
                    <input type="number" id="diasTrabajados" name="diasTrabajados" 
                           min="1" max="30" required value="30">
                </div>

                <div class="form-group">
                    <label for="horasExtras">Horas Extras:</label>
                    <input type="number" id="horasExtras" name="horasExtras" 
                           min="0" step="0.5" value="0" required>
                    <p class="info-note">Las horas extras se pagan con un recargo del 25% sobre el valor de la hora normal</p>
                </div>

                <div class="form-group">
                    <label for="comisiones">Comisiones:</label>
                    <input type="number" id="comisiones" name="comisiones" 
                           min="0" step="1000" value="0" required>
                </div>

                <div class="form-group">
                    <label>Descuentos Automáticos:</label>
                    <%
                        NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("es", "CO"));
                    %>
                    <p>Salud (4%): <%= empleado != null ? nf.format(empleado.getSalarioBase() * 0.04) : "$0"%></p>
                    <p>Pensión (4%): <%= empleado != null ? nf.format(empleado.getSalarioBase() * 0.04) : "$0"%></p>
                </div>

                <button type="submit" class="btn btn-primary">Guardar Nómina</button>
                <a href="index.jsp" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </body>
</html>