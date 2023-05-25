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
					response.sendRedirect(Me.welcome);
				}
		}
		else {
			System.out.println("e");
			response.sendRedirect(Me.welcome);
		}
	}
	else {
		System.out.println("f");
		response.sendRedirect(Me.welcome);
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Daniel website</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/projects.css" />
    <link rel="stylesheet" href="css/style_2.css">
</head>

<body>
    <nav>
        <button type="button" id="toggle-btn">
            <i class="fa fa-bars"></i>
        </button>
        <span>Menú</span>
        <ul class="sidebar__menu">
            <li><a href="#"><i class="fa fa-home"></i>Inicio</a></li>
            <li><a href="#"><i class="fa-sharp fa-solid fa-clock"></i>Práctica 0</a></li>
            <li><a href="#"><i class="fa-sharp fa-solid fa-clock"></i>Práctica 1</a></li>
            <li><a href="#"><i class="fa-sharp fa-solid fa-clock"></i>Práctica 2</a></li>
            <li><a href="#"><i class="fa-sharp fa-solid fa-clock"></i>Práctica 3</a></li>
        </ul>
    </nav>

    <div class="container">
        <header>
            <h1 class="section-heading">Chismesito crypto - Algoritmo Rijndael</h1>
        </header>
    </div>
    <div class="container">
        <div class="tab-container">
            <div class="tab-filter-container">
                <li class="filter-btn active" data-tab="web-design">
                    <ion-icon name="desktop-outline"></ion-icon>
                    Historia
                </li>
                <li class="filter-btn" data-tab="web-development">
                    <ion-icon name="logo-nodejs"></ion-icon>
                    Ventajas
                </li>
                <li class="filter-btn" data-tab="ux-design">
                    <ion-icon name="diamond-outline"></ion-icon>
                    Aplicaciones
                </li>
                <li class="filter-btn" data-tab="app-development">
                    <ion-icon name="logo-google-playstore"></ion-icon>
                    Dato extra
                </li>
            </div>
            <div class="tab-filter-item-container">
                <div class="tab-item web-design select_tab">
                    <div class="tab-content-left">
                        <img src="images/resources/profile.png" alt="web design" class="tab-img" />
                    </div>
                    <div class="tab-content-right">
                        <h1 class="tab-heading">Algoritmo</h1>
                        <p class="paragraph">
                            De cifrado simétrico desarrollado por Joan Daemen y Vincent Rijmen. 
                            Fue seleccionado como el algoritmo AES (Advanced Encryption Standard) en 2001. 
                            Rijndael se caracteriza por ser seguro, eficiente y versátil.
                        </p>
                        <a href="#!" class="btn-primary">Leer más</a>
                    </div>
                </div>
                <div class="tab-item web-development">
                    <div class="tab-content-left">
                        <h1 class="tab-heading">Proporciona</h1>
                        <p class="paragraph">
                            La capacidad de procesar diferentes tamaños de bloques y claves, lo que permite adaptarse a 
                            diversos escenarios de aplicación. Además, ofrece una resistencia significativa a 
                            diversos tipos de ataques criptográficos, incluyendo criptoanálisis diferencial y lineal.
                        </p>
                        <a href="#!" class="btn-primary">Leer más</a>
                    </div>
                    <div class="tab-content-right">
                        <img src="images/resources/shiba_1.png" alt="web development" class="tab-img" />
                    </div>
                </div>
                <div class="tab-item ux-design">
                    <div class="tab-content-left">
                        <img src="images/resources/shiba_2.png" alt="UI/UX Design" class="tab-img" />
                    </div>
                    <div class="tab-content-right">
                        <h1 class="tab-heading">Sabías que...</h1>
                        <p class="paragraph">
                            Rijndael se ha utilizado en una amplia gama de aplicaciones del mundo real, como la 
                            protección de datos confidenciales en sistemas de comunicación seguros, la encriptación 
                            de archivos y discos, y la seguridad de transmisiones de datos por Internet.
                        </p>
                        <a href="#!" class="btn-primary">Leer más</a>
                    </div>
                </div>
                <div class="tab-item app-development">
                    <div class="tab-content-left">
                        <h1 class="tab-heading">Para saber más..</h1>
                        <p class="paragraph">
                            Rijndael recibió su nombre en honor al Castillo de Rijndael, ubicado en 
                            Bélgica, donde Daemen vivió durante el desarrollo del algoritmo.
                        </p>
                        <a href="#!" class="btn-primary">Leer más</a>
                    </div>
                    <div class="tab-content-right">
                        <img src="images/resources/shiba_3.png" alt="UI/UX Design" class="tab-img" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script>
        let filter_btn = document.querySelectorAll('.filter-btn');
        let tab_items = document.querySelectorAll('.tab-item');

        for (let i = 0; i < filter_btn.length; i++) {
            filter_btn[i].addEventListener('click', function () {
                for (let j = 0; j < filter_btn.length; j++) {
                    filter_btn[j].classList.remove('active');
                }
                let select_tab = filter_btn[i].getAttribute('data-tab');
                filter_btn[i].classList.add('active');
                for (let t = 0; t < tab_items.length; t++) {
                    document.querySelector('.tab-filter-item-container').style.height =
                        tab_items[t].scrollHeight + 'px';
                    if (tab_items[t].classList.contains(select_tab)) {
                        tab_items[t].classList.add('select_tab');
                    } else {
                        tab_items[t].classList.remove('select_tab');
                    }
                }
            });
        }

        for (let th = 0; th < tab_items.length; th++) {
            document.querySelector('.tab-filter-item-container').style.height =
                tab_items[th].scrollHeight + 'px';
        }
    </script>
    <script>
        const nav = document.querySelector('nav');
        const toggle_btn = document.getElementById('toggle-btn');

        toggle_btn.onclick = function () {
            nav.classList.toggle('hide');
            this.contentEditable.classList.toggle('expand');
        }
    </script>
</body>

</html>