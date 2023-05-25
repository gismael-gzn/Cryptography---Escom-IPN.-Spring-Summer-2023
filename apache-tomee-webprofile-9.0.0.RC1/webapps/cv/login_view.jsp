<%@
		page contentType="text/html;charset=UTF-8" language="java" session="false"
%>
<%@ page import="function.Me" %>

<%
	HttpSession ses = request.getSession(false);
	if(ses != null) {
		if(Me.compareCookies_Request_Session(Me.brownie, request, ses)) {
			if(Me.compareCookies_Request_Session(Me.idAuth, request, ses)) {
                response.sendRedirect(Me.crypto);
            }
			response.sendRedirect(Me.token);
		}
	}

	String retry = request.getParameter(Me.params.email),
    exists = request.getParameter(Me.DB.exists);
	if(exists != null) {
		exists = "Usuario y correo ya estan en uso...";
    }
	else {
		exists = "";
    }
	if(retry == null) {
		retry = "";
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <link rel="stylesheet" href="css/log_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Practica 4</title>

</head>

<body>
    <div class="wrapper">
        <div class="form-wrapper sign-in">
            <form action="<%=Me.loginsrv%>" method="post" autocomplete="off">
                <h2>Iniciar Sesión</h2>
                <div class="input-group">
                    <input name="<%=Me.params.name%>" type="text" required>
                    <label for="">Usuario</label>
                </div>
                <div class="input-group">
                    <input name="<%=Me.params.pass%>" type="password" minlength="8" required>
                    <label for="">Contraseña</label>
                </div>
                <button type="submit">Acceder</button>
                <div class="signUp-link">
                    <p>¿No estás registrado? <a href="#" class="signUpBtn-link">Registrate</a></p>
                </div>
                <div class="signUp-link">
                    <p>¿Olvidaste tu contraseña? <a href="pass_url.jsp" >Recuperar</a></p>
                </div>
                <div class="social-media">
                    <p>Iniciar sesión con:</p>
                    <div class="social-icons">
                        <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#"><i class="fa-brands fa-google"></i></a>
                        <a href="#"><i class="fa-brands fa-twitter"></i></a>
                    </div>
                </div>
            </form>
        </div>
        <!---Aquí empieza el código para pantalla de registro-->
        <div class="form-wrapper sign-up">
            <form action="<%= Me.signinsrv %>" method="post" autocomplete="off">
                <h2>Registro</h2>
                <div class="input-group">
                    <input name="name" type="text" placeholder="<%=exists%>" required>
                    <label for="">Usuario</label>
                </div>
                <div class="input-group">
                    <input name="email" type="email" placeholder="<%=exists%>" required value="<%=retry%>">
                    <label for="">Correo</label>
                </div>
                <div class="input-group">
                    <input name="pass" type="password" minlength="8" required>
                    <label for="">Contraseña</label>
                </div>
                <button type="submit">Registrar</button>
                <div class="signUp-link">
                    <p>¿Ya tienes una cuenta? <a href="#" class="signInBtn-link">Iniciar sesión</a></p>
                </div>
            </form>
        </div>

        <!--Aquí empieza el código para la ventana de recuperación-->
    </div>
    <script>
        const signUpBtnLink = document.querySelector('.signUpBtn-link');
        const signInBtnLink = document.querySelector('.signInBtn-link');
        const wrapper = document.querySelector('.wrapper');

        signUpBtnLink.addEventListener('click', () => {
            wrapper.classList.toggle('active');
        });


        signInBtnLink.addEventListener('click', () => {
            wrapper.classList.toggle('active');
        });

       
    </script>
</body>

</html>