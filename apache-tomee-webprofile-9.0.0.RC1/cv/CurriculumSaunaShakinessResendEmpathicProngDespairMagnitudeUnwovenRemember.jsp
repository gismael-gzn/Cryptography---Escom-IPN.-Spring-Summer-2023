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
					response.sendRedirect(Me.index);
				}
		}
		else {
			System.out.println("e");
			response.sendRedirect(Me.index);
		}
	}
	else {
		System.out.println("f");
		response.sendRedirect(Me.index);
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
    
    <header id="home-curriculum" class="container">
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
               <li> <a class="index-content" href="#Curriculum-Vitae" onclick="close_nav();">Curriculum Vitae</a> </li>
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
            
            <h2 id="Curriculum-Vitae" class="title">Curriculum Vitae</h2>

            <div class="info">
                <p class="fill-h">
                    A continuaci&oacute;n, les proporciono un enlace para descargar mi curr&iacute;culum vitae en formato PDF. Este documento detalla mi experiencia profesional y acad&eacute;mica, as&iacute; como mis habilidades relevantes. No dude en consultarlo para obtener m&aacute;s informaci&oacute;n sobre mi perfil. <br/>
                    <a class="download-link" href="<%= String.format("%s?%s=%s", Me.DownloadSrv, Me.targetAttr, Me.cvPdf) %>"> <img class="ico" src="img/pdf_icon.png" /> Click aqu&iacute; para descargar. </a>
                    <b class="hash">MD5: f66da00dc9de999fd4b9237a66860d9c</b>
                </p>
            </div>
        </section>
    </main>

    <footer class="container">
        <p>Footer: all rights reserved to Gerardo Ismael Garzon Dominguez</p>
    </footer>

</body>
</html>