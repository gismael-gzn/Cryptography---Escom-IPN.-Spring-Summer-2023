<%@
		page contentType="text/html;charset=UTF-8" language="java" session="false"
%>
<%@ page import="function.Me" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/log_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Practica 4</title>
</head>

<body>
    <div class="wrapper">
        <!--Aquí empieza el código para la ventana de recuperación-->
        <div class="form-wrapper get-pass">
            <form action="<%=Me.passurlsrv%>" method="post" autocomplete="off">
                <h2>Recuperar contraseña</h2>
                
                <div class="input-group">
                    <input name="<%=Me.params.name%>" type="text" required>
                    <label for="">Nombre de usuario</label>
                </div>
                <button type="submit">Aceptar</button>
                <div class="signUp-link">
                    <p>¿Ya tienes una cuenta? <a href="login_view.jsp" >Iniciar sesión</a></p>
                </div>
            </form>
        </div>

    </div>
    
</body>

</html>