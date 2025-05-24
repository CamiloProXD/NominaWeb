<%-- 
    Document   : ViewCrearEmpleado
    Created on : 23/05/2025, 5:35:48 p. m.
    Author     : Camilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Empleado</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <header>
            <h1>Ingrese Los Datos Del Empleado</h1>   
        </header>
        <form action="NominaCTO" method="post">
            <fieldset>
                <label for="txt_cedula">Cedula:</label>
                <input type="text" id="txt_cedula" name="txt_cedula" required>
                <br><br>
                <label for="txt_nombres">Nombres:</label>
                <input type="text" id="txt_nombres" name="txt_nombres" required>
                <br><br>
                <label for="txt_apellidos">Apellidos:</label>
                <input type="text" id="txt_apellidos" name="txt_apellidos" required>
                <br><br>
                <label for="txt_tel">Teléfono Móvil:</label>
                <input type="tel" id="txt_tel" name="txt_tel" placeholder="311 1112211" 
                       pattern="[0-9]{3} [0-9]{7}" required>
                <br><br>
                <label for="txt_correo">Correo:</label>
                <input type="email" id="txt_correo" name="txt_correo" required>
                <br><br>
                <label for="txt_cargo">Cargo:</label>
                <input type="text" id="txt_cargo" name="txt_cargo" required>
                <br><br>
                <label for="txt_nContrato">Numero De Contrato:</label>
                <input type="text" id="txt_nContrato" name="txt_nContrato" required>
                <br><br>
                <label for="txt_salarioBase">Salario Base</label>
                <input type="number" step="0.01" id="txt_salarioBase" name="txt_salarioBase" required>
                <br><br>
            </fieldset>
            <br>
            <input type="hidden" name="accion" value="crearEmpleado">
            <input type="submit" id="btn_registrar" value="Registrar">
            <input type="reset" id="btn_limpiar" value="Limpiar">
        </form>
    </body>
</html>
