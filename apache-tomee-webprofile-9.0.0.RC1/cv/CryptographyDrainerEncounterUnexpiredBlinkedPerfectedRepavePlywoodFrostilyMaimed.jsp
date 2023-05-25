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
    <title>Garzon Developer - Cryptography Class</title>
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
    
    <header id="home-crypto" class="container">
        <h1 id="Cryptography">Cryptography</h1>        
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
               <li> <a onclick="close_nav();" class="index-content" href="#El-Cifrado-de-Llave-Publica">El Cifrado de Llave P&uacute;blica</a> </li>
               <li> <a onclick="close_nav();" class="index-content" href="#Mi-llave-publica">Mi llave p&uacute;blica</a> </li>
               <li> <a onclick="close_nav();" class="index-content" href="#¿Como-consegui-esta-llave?">¿C&oacute;mo consegu&iacute; esta llave?</a> </li>
               <li> <a onclick="close_nav();" class="index-content" href="#Caracteristicas-de-las-llaves-RSA">Caracter&iacute;sticas de las llaves RSA</a> </li>
               <li> <a onclick="close_nav();" class="index-content" href="#GnuPG">GnuPG</a> </li>
               <li> <a onclick="close_nav();" class="index-content" href="#Generar-llave-RSA-con-GnuPG">Generar llave RSA con GnuPG</a> </li>
               <li> <a onclick="close_nav();" class="index-content" href="#Conclusion">Conclusi&oacute;n</a> </li>
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
            
            <h2 id="El-Cifrado-de-Llave-Publica" class="title">El Cifrado de Llave P&uacute;blica</h2>

            <div class="info">
                <p class="two-cols">
                    <img class="inline-img" src="img/crypto-header2.png"/>
                    El cifrado de llave p&uacute;blica fue inventado por Whitfield Diffie y Martin Hellman en 1976, y es considerado uno de los avances m&aacute;s importantes en la historia de la criptograf&iacute;a. Antes de su invenci&oacute;n, la criptograf&iacute;a se basaba principalmente en el cifrado sim&eacute;trico, donde la misma llave se utiliza tanto para cifrar como para descifrar informaci&oacute;n. El problema con este enfoque es que la llave debe ser compartida de manera segura entre las partes que se comunican, lo que puede ser un desaf&iacute;o en un entorno no seguro como Internet.
                    El cifrado de llave p&uacute;blica aborda este problema al utilizar dos claves diferentes pero matem&aacute;ticamente relacionadas: una llave p&uacute;blica y una llave privada. La llave p&uacute;blica se comparte abiertamente y se utiliza para cifrar la informaci&oacute;n, mientras que la llave privada se mantiene en secreto y se utiliza para descifrar la informaci&oacute;n. Si alguien quiere enviarte un mensaje cifrado, utiliza tu llave p&uacute;blica para cifrarlo. Una vez que el mensaje est&aacute; cifrado, solo tu llave privada puede descifrarlo.
                    Este avance en criptograf&iacute;a permiti&oacute; una comunicaci&oacute;n segura entre personas que no se conoc&iacute;an previamente ni hab&iacute;an intercambiado claves de forma segura. El algoritmo RSA, creado por Ron Rivest, Adi Shamir y Leonard Adleman en 1977, es uno de los primeros y m&aacute;s conocidos sistemas de cifrado de llave p&uacute;blica. Hoy en d&iacute;a, la criptograf&iacute;a de llave p&uacute;blica es la base para muchas aplicaciones, como la firma digital, el intercambio de claves de sesi&oacute;n en protocolos seguros (por ejemplo, TLS) y la protecci&oacute;n de datos en sistemas de almacenamiento en la nube.             
                </p>
                <h3 id="Mi-llave-publica">Mi llave p&uacute;blica</h3>

                <p>
                    A continuaci&oacute;n, encontrar&aacute;n dos enlaces para descargar mi llave RSA p&uacute;blica en diferentes formatos: uno en formato binario y otro en Base64 (ASC). Estos enlaces les permitir&aacute;n acceder a mi llave p&uacute;blica para realizar operaciones criptogr&aacute;ficas seguras. Por favor, seleccione el formato que m&aacute;s le convenga: <br/>
                    <a href="<%= String.format("%s?%s=%s", Me.DownloadSrv, Me.targetAttr, Me.keyBin) %>" class="download-link"> <img class="ico" src="img/key-icon-png-20.jpg" /> Llave RSA p&uacute;blica en formato binario </a> <br/>
                    <b class="hash">MD5: 12583e3690a3fa33ca1cb02b17308ee8</b>
                    <a href="<%= String.format("%s?%s=%s", Me.DownloadSrv, Me.targetAttr, Me.keyAsc) %>" class="download-link"> <img class="ico" src="img/key-icon-png-20.jpg" /> Llave RSA p&uacute;blica en Base64 (ASC) </a> <br/>
                    <b class="hash">MD5: 38c60996d8a76225a07d1c28c71fbd2f</b>
                </p>

                <h3 id="¿Como-consegui-esta-llave?">¿Como consegui esta llave?</h3>
                <p>
                    A continuaci&oacute;n, te mostrar&eacute; un breve tutorial sobre c&oacute;mo obtener una llave RSA usando GnuPG. Tambi&eacute;n mencionar&eacute; brevemente las caracter&iacute;sticas de la llave RSA y los n&uacute;meros relacionados con ella.
                </p>
                    
                <h3 id="Caracteristicas-de-las-llaves-RSA">Caracter&iacute;sticas de las llaves RSA:</h3>
                <p>
                    Las claves RSA son un tipo de criptograf&iacute;a de llave p&uacute;blica que utiliza n&uacute;meros primos grandes y c&aacute;lculos matem&aacute;ticos complejos. El par de claves consta de una llave p&uacute;blica y una llave privada, utilizadas para cifrar y descifrar, respectivamente. La seguridad de RSA depende del tama&ntilde;o de la llave (en bits) y de la elecci&oacute;n adecuada de los n&uacute;meros primos. <br/>
                    
                    <ul>
                        <li>Basadas en la factorizaci&oacute;n de n&uacute;meros primos grandes.</li>
                        <li>Tama&ntilde;o de llave com&uacute;nmente recomendado: 2048, 3072 o 4096 bits.</li>
                        <li>La llave p&uacute;blica consta de dos n&uacute;meros: m&oacute;dulo (n) y exponente p&uacute;blico (e).</li>
                        <li>La llave privada consta de dos n&uacute;meros: m&oacute;dulo (n) y exponente privado (d).</li>  
                    </ul>
                </p>

                <h3 id="GnuPG">GnuPG</h3>
                <p class="two-cols">
                    GnuPG (Gnu Privacy Guard) es una herramienta de cifrado y firma de c&oacute;digo abierto que implementa el est&aacute;ndar OpenPGP (RFC 4880). Es una alternativa libre al software original de PGP desarrollado por Phil Zimmermann. GnuPG permite cifrar, descifrar, firmar y verificar mensajes y archivos de manera segura, protegiendo la privacidad y autenticidad de la informaci&oacute;n intercambiada.

                    GnuPG utiliza criptograf&iacute;a de llave p&uacute;blica, en la que cada usuario tiene un par de claves (p&uacute;blica y privada). La llave p&uacute;blica se utiliza para cifrar mensajes o verificar firmas, mientras que la llave privada se utiliza para descifrar mensajes o crear firmas digitales. Es fundamental mantener la llave privada en secreto, mientras que la llave p&uacute;blica se puede compartir libremente.
                    
                    GnuPG es ampliamente utilizado para asegurar el correo electr&oacute;nico, proteger archivos y software, as&iacute; como para verificar la autenticidad de las descargas y firmar documentos digitales. Es compatible con m&uacute;ltiples algoritmos criptogr&aacute;ficos, como RSA, ElGamal, DSA, ECC y otros, y es parte esencial de la infraestructura de seguridad en Internet.                    
                </p>

                <h3 id="Generar-llave-RSA-con-GnuPG">Generar llave RSA con GnuPG</h3>
                <p>
                    Para generar una llave RSA de 4096 bits con GnuPG y exportar la llave p&uacute;blica en formatos .asc (ASCII-armored) y binario, sigue estos pasos:
                    <ol>
                        <li>Una vez hayas instalado GnuPG, ejecuta el siguiente comando:</li>
                        <code> <span class="keyword">gpg</span> <span class="string">--full-generate-key</span> </code>
                        
                        <li>Introduce los datos que el asistente solicita, entre ellos: tama&ntilde;o de llave deseado (2048, 3072 o 4096 bits), el per&iacute;odo de validez de la llave, informaci&oacute;n de usuario (nombre y correo electr&oacute;nico) y una contrase&ntilde;a segura para proteger la llave privada. <br/>
                        Al final obtend&aacute;s una salida similar a esta:
                        </li>

                        <code><span class="string">pub   rsa4096 2023-04-13 [SC]
    170094919850P738A8DF2EEDCDE9K112D5040963A
uid Gerardo Ismael Garzon Dominguez &lt;ggarzond1600@alumno.ipn.mx&gt;
sub rsa4096 2023-04-13 [E]</span></code>

                        <li>Exportar llave p&uacute;blica en formato .gpg (Binario):</li>
                        <code> <span class="keyword">gpg</span> <span class="string">--armor --export</span> <span class="argument">&lt;key_id&gt;</span> <span class="string">public_key.asc</span></code>

                        <li>Exportar llave p&uacute;blica en formato binario:</li>
                        <code> <span class="keyword">gpg</span> <span class="string">--export</span> <span class="argument">&lt;key_id&gt;</span> <span class="string">public_key.gpg</span></code>

                    </ol>
                </p>

                <h3 id="Conclusion">Conclusi&oacute;n</h3>
                <p>
                    En este art&iacute;culo aprendimos a generar claves RSA utilizando GnuPG y a manejarlas en diferentes formatos, como archivos .asc y binarios. Tambi&eacute;n discutimos c&oacute;mo exportar claves p&uacute;blicas. Las claves generadas se pueden utilizar para cifrar y descifrar mensajes, firmar y verificar la autenticidad de documentos o comunicaciones, y garantizar la privacidad y seguridad de la informaci&oacute;n compartida en l&iacute;nea.                    
                </p>

            </div>
        </section>
    </main>

    <footer class="container">
        <p>Footer: all rights reserved to Gerardo Ismael Garzon Dominguez</p>
    </footer>

</body>
</html>