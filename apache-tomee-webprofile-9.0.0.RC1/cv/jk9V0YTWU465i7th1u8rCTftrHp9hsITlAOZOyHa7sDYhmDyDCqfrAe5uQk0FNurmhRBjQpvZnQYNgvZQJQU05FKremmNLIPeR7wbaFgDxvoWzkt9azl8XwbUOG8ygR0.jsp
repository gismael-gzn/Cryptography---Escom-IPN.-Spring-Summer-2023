<%@
		page contentType="text/html;charset=UTF-8" language="java" session="false"
%>
<%@ page import="function.Me" %>

<%
	HttpSession ses = request.getSession(false);
	if(ses != null) {
		if(Me.compareCookies_Request_Session(Me.brownie, request, ses) && Me.compareCookies_Request_Session(Me.idAuth, request, ses)) {
			request.getRequestDispatcher(Me.Curriculum).forward(request, response);
		}
	}
	else {
		response.sendRedirect(Me.index);
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
	<meta http-equiv="Cache-Control" content="private, no-store"/>

	<title>jk9V0YTWU465i7th1u8rCTftrHp9hsITlAOZOyHa7sDYhmDyDCqfrAe5uQk0FNurmhRBjQpvZnQYNgvZQJQU05FKremmNLIPeR7wbaFgDxvoWzkt9azl8XwbUOG8ygR0</title>

	<link rel="stylesheet" href="css/auth.css">
</head>
<body>
	<div class="container">
		<h2>Enter Verification Code</h2>
		<form action="<%= Me.authsrv2 %>" method="post">
			<label for="verification-code">Verification Code:</label>
			<input type="text" id="verification-code" name="verification-code" pattern="[0-9A-Za-z]*"
			autofocus required autocomplete="off">
			<button type="submit">Submit</button>
		</form>
<%--		<p>Didn't receive the code? <a href="#">Resend</a></p>--%>
	</div>
</body>
</html>
