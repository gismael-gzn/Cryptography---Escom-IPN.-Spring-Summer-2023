<%@
		page contentType="text/html;charset=UTF-8" language="java" session="false"
%>
<%@ page import="function.Me" %>

<%
	String saysomething = "", other = "";
	HttpSession ses = request.getSession(false);

	if(ses != null) {
		if(Me.compareCookies_Request_Session(Me.brownie, request, ses)) {
				if(Me.compareCookies_Request_Session(Me.idAuth, request, ses)) {
					Cookie newBrownie = Me.bakeBrownie(Integer.MAX_VALUE), brownie = Me.findCookie(Me.brownie, request);
					Cookie auth = Me.findCookie(Me.idAuth, request), newAuth = Me.idAuthGen(Integer.MAX_VALUE);

					saysomething = String.format("your [%s] cookie %s is now %s", brownie.getName(), brownie.getValue(), newBrownie.getValue());
					other = String.format("your [%s] cookie %s is now %s", auth.getName(), auth.getValue(), newAuth.getValue());

					brownie.setMaxAge(0);
					brownie.setValue(null);
					auth.setMaxAge(0);
					auth.setValue(null);

					response.addCookie(newBrownie);
					response.addCookie(newAuth);

					ses.setAttribute(Me.brownie, newBrownie);
					ses.setAttribute(Me.idAuth, newAuth);
				}
				else {
					System.out.println("d");
					response.sendRedirect(Me.errorHtml);
				}
		}
		else {
			System.out.println("e");
			response.sendRedirect(Me.errorHtml);
		}
	}
	else {
		System.out.println("f");
		response.sendRedirect(Me.errorHtml);
	}
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Garzon - Developer</title>
    <link rel="stylesheet" href="css/real.css">
    <script src="js/index.js"></script>

    <meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="Cache-Control" content="private, no-store" />

    <link rel="apple-touch-icon" sizes="57x57" href="img/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="img/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="img/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="img/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="img/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="img/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="img/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="img/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
    <link rel="manifest" href="img/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="img/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

</head>
<body id="index-body">
    
    <header id="home" class="container">
        <h1 id="gismael-gzn">gismael-gzn</h1>        
    </header>

    <header class="contact">
        <ul>
            <li> <img src="img/mail.png" /> <a id="my-mail" href="mailto:ggarzond1600@alumno.ipn.mx"> ggarzond1600@alumno.ipn.mx</a> </li>
            <li> <a target="_blank" href="https://github.com/gismael-gzn"> <img src="img/GitHub_logo.png" /> Github</a> </li>
            <li> <a target="_blank" href="https://www.reddit.com/user/gismael"> <img src="img/reddit-logo-16.png" /> Reddit</a> </li>
            <li> <a target="_blank" href="https://www.youtube.com/channel/UCFSb0zaA0Wl4cVwdQsYOilA"> <img src="img/youtube-clipart-youtube-square-icons-1600x1600.png" /> YouTube</a> </li>
        </ul>
    </header>

    <nav id="navigation" class="container">
        <div class="close"><a href="javascript:close_nav()">X</a></div>

        <details>
            <summary>Tema</summary>
            <em> <a class="theme-selector" href="javascript:void(0)">Day</a> </em> 
            <em> <a class="theme-selector" href="javascript:void(0)">Night</a> </em> 
        </details>

        <details open>
            <summary>Navegar</summary>
            <ul class="index">
                <li> <a onclick="close_nav();" class="index-content" href="#index-body">Inicio</a> </li>
            </ul>
        </details>

        <details open>
            <summary>Tabla de contenidos</summary>
            <ul class="index">
               <li> <a class="index-content" href="#Sobre-mi" onclick="close_nav();">Sobre mi</a> </li>
               <li> <a class="index-content" href="#Formacion-academica" onclick="close_nav();">Formacion academica</a> </li>
               <li> <a class="index-content" href="#Hobbies" onclick="close_nav();">Hobbies</a> </li>
               <li> <a class="index-content" href="#Contactame" onclick="close_nav();">Cont&aacute;ctame</a> </li>
            </ul>
        </details>

    </nav>

    <main class="container">

        <div id="mobile-menu" class="container">
            <a class="btn" href="javascript:open_nav()">Men&uacute;</a>
            <a class="btn" href="javascript:open_main()">Navegar a</a>
         </div>

        <div id="main-menu" class="container">
            <div class="close"><a href="javascript:close_main()">X</a></div>
           <a class="btn" href="<%= Me.Home %>">Home</a>
           <a class="btn" href="<%= Me.Cryptography %>">Cryptography</a>
           <a class="btn" href="<%= Me.Curriculum %>">Curriculum</a>
           <a class="btn" href="https://youtu.be/ZZ5LpwO-An4?t=3" target="_blank">woop woop</a>
        </div>

        <section id="main-content" class="container">
            
            <h2 id="Sobre-mi" class="title">Sobre mi</h2>
            
            
            <div class="info">
                <img id="me" class="inline-img" src="img/2023-03-05 16.50.23.jpg"/>
                <h3 id="Formacion-academica">Formaci&oacute;n acad&eacute;mica</h3>
                <p>
                    Hola, me llamo <em> <b>Gerardo Ismael Garz&oacute;n Dom&iacute;nguez.</b> </em> Soy un estudiante de &uacute;ltimo a&ntilde;o en la carrera de Ingenier&iacute;a en Sistemas Computacionales en la Escuela Superior de C&oacute;mputo (ESCOM) del Instituto Polit&eacute;cnico Nacional (IPN), en M&eacute;xico, cursando actualmente el periodo acad&eacute;mico 2019-presente. Antes de ingresar a la ESCOM, curs&eacute; la carrera t&eacute;cnica en Construcci&oacute;n en el Centro de Estudios Cient&iacute;ficos y Tecnol&oacute;gicos (CECyT) 1 durante la generaci&oacute;n 2016-2019. Me apasiona la programaci&oacute;n y la tecnolog&iacute;a, y siempre estoy buscando nuevas oportunidades para aprender y enfrentar desaf&iacute;os en el campo.
                </p>
                <h3 id="Hobbies">Hobbies</h3>
                <p>
                    Mis hobbies incluyen tocar la guitarra el&eacute;ctrica y aprender piano, lo que me permite expresar mi creatividad y relajarme a trav&eacute;s de la m&uacute;sica. Adem&aacute;s, disfruto hacer ejercicio, lo que me ayuda a mantener un equilibrio saludable entre mente y cuerpo. En mi tiempo libre, me gusta explorar pel&iacute;culas interesantes y surfear en internet para mantenerme actualizado y descubrir nuevos temas que me permitan expandir mi conocimiento y comprensi&oacute;n del mundo que me rodea. <br/>
                    Aqu&iacute; te muestro un par de clips m&iacute;os tocando la guitarra, aunque ya no suelo practicar por la escuela.
                    <iframe src="https://www.youtube.com/embed/s5BibsEMrac" allowfullscreen></iframe>
                    <iframe src="https://www.youtube.com/embed/bXc7_m8Jy7Y" allowfullscreen></iframe>
                </p>
                <h3 id="Contactame">Cont&aacute;ctame</h3>
                <p>
                    Si deseas ponerse en contacto conmigo para hablar sobre proyectos, oportunidades de colaboraci&oacute;n o simplemente intercambiar ideas, no dudes en enviarme un correo electr&oacute;nico a <a href="mailto:ggarzond1600@alumno.ipn.mx">ggarzond1600@alumno.ipn.mx</a> o con&eacute;ctate conmigo a trav&eacute;s de <a href="https://www.reddit.com/user/gismael">Reddit</a>. Estoy siempre abierto a conocer gente nueva, aprender de sus experiencias y compartir conocimientos en el &aacute;mbito de la tecnolog&iacute;a y m&aacute;s all&aacute;.
                </p>
            </div>

        </section>
    </main>

    <footer class="container">
        <p>Footer: all rights reserved to Gerardo Ismael Garzon Dominguez</p>
    </footer>

</body>
</html>