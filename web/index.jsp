<%-- 
    Document   : ViewPrincipal
    Created on : 23/05/2025, 4:51:35 p. m.
    Author     : Camilo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú Principal - Sistema de Nómina</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
            }
            header {
                background-color: #4CAF50;
                color: white;
                padding: 15px;
                text-align: center;
                border-radius: 5px;
                margin-bottom: 20px;
            }
            .menu-container {
                display: flex;
                justify-content: center;
                gap: 20px;
            }
            .menu-card {
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 20px;
                width: 200px;
                text-align: center;
                transition: transform 0.3s;
            }
            .menu-card:hover {
                transform: scale(1.05);
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            .menu-card a {
                text-decoration: none;
                color: #333;
                font-weight: bold;
                display: block;
                padding: 10px;
            }
            .menu-card img {
                width: 80px;
                height: 80px;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>Sistema de Gestión de Nómina</h1>
        </header>
        
        <div class="menu-container">
            <div class="menu-card">
                <a href="NominaCTO?accion=crear">
                    
                    <div>Registrar Empleado</div>
                </a>
            </div>
            
            <div class="menu-card">
                <a href="NominaCTO?accion=buscarParaNomina">
                    
                    <div>Crear Nómina</div>
                </a>
            </div>
            
            <div class="menu-card">
                <a href="NominaCTO?accion=ver">
                    
                    <div>Ver Nóminas</div>
                </a>
            </div>
        </div>
    </body>
</html>