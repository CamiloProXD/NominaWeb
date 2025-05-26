<%-- 
    Document   : exitoRegistro
    Created on : 23/05/2025, 8:10:23 p. m.
    Author     : Camilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Exitoso</title>
        <style>
            .success-box {
                border: 2px solid #4CAF50;
                background-color: #f8f9fa;
                padding: 20px;
                margin: 20px auto;
                max-width: 500px;
                text-align: center;
                border-radius: 5px;
            }         
        </style>
    </head>
    <body>
        <div class="success-box">
            <h1>¡Registro Exitoso!</h1>
            <p>El empleado con cédula <strong>${param.cedula}</strong> ha sido registrado correctamente.</p>

            <div style="margin-top: 20px;">
                <a href="NominaCTO?accion=crear" style="padding: 10px 15px; background: #4CAF50; color: white; text-decoration: none; border-radius: 4px;">
                    Registrar otro empleado
                </a>
                <a href="index.jsp" style="padding: 10px 15px; background: #2196F3; color: white; text-decoration: none; border-radius: 4px; margin-left: 10px;">
                    Volver al inicio
                </a>
            </div>
        </div>
    </body>
</html>