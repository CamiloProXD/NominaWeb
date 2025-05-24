<%-- 
    Document   : buscarEmpleado
    Created on : 23/05/2025, 8:14:24 p. m.
    Author     : Camilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar Empleado</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            .search-container {
                max-width: 500px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f9f9f9;
            }
            .error {
                color: red;
                margin-bottom: 15px;
            }
            input[type="text"] {
                width: 100%;
                padding: 8px;
                margin: 8px 0;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="search-container">
            <h2>Buscar Empleado para Nómina</h2>
            
            <%-- Mostrar mensaje de error si existe --%>
            <% if (request.getAttribute("error") != null) { %>
                <div class="error"><%= request.getAttribute("error") %></div>
            <% } %>
            
            <form action="NominaCTO" method="POST">
                <input type="hidden" name="accion" value="buscarParaNomina">
                
                <label for="txt_cedula">Cédula del Empleado:</label>
                <input type="text" id="txt_cedula" name="txt_cedula" 
                       required pattern="[0-9]+" title="Solo números">
                
                <input type="submit" value="Buscar Empleado">
            </form>
        </div>
    </body>
</html>
