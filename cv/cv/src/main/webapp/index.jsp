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

					response.sendRedirect(Me.Home);
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

	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="Cache-Control" content="private, no-store" />

	<title>GarzonDev</title>

	<link rel="stylesheet" href="css/style.css">
</head>

<body id="body" translate="yes">

<main role="main">
	<div>
		<h1>Oops</h1>
		<img id="errimg" src="img/error.png">
		<h2>Nothing around here...</h2>
		<h2> <a href="https://www.youtube.com/watch?v=fA5rWh-V6Wg" target="_self"> Try something else instead </a> </h2>
	</div>
</main>
	
</body>
</html>