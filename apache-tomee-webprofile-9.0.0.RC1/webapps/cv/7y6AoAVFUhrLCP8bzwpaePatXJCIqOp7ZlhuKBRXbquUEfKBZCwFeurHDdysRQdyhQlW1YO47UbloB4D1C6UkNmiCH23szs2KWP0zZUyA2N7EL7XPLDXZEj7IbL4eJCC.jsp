<%@
		page contentType="text/html;charset=UTF-8" language="java" session="false"
%>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="function.Me" %>
<%
	HttpSession ses = request.getSession(false);
	if(ses != null) {
		if(Me.compareCookies_Request_Session(Me.brownie, request, ses)) {
			response.sendRedirect(Me.auth2);
		}
	}
	String retry = request.getParameter("email");
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

	<meta name="robots" content="noindex, nofollow">

	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="Cache-Control" content="private, no-store" />

	<title>7y6AoAVFUhrLCP8bzwpaePatXJCIqOp7ZlhuKBRXbquUEfKBZCwFeurHDdysRQdyhQlW1YO47UbloB4D1C6UkNmiCH23szs2KWP0zZUyA2N7EL7XPLDXZEj7IbL4eJCC</title>

	<link rel="stylesheet" href="css/login.css">
</head>
<body>

	<div>
		<h1>Login</h1>
		<form action="<%=Me.authsrv1%>" autocomplete="off" method="post">
			<input name="email" type="email" placeholder="email for verification code" required value=" <%= retry %> ">
			<input name="identifier" type="text" placeholder="Hello?" required>
			<input class="loginbtn" type="submit" value="Send">
		</form>
	</div>

</body>
</html>