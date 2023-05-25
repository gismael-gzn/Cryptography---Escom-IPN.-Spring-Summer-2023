package com.example.cv;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;
import java.util.Map;

import function.*;

@WebServlet(name = Me.signinsrv, value = "/"+Me.signinsrv)
public class signinSrv extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// No session
		Map<String, String[]> data = req.getParameterMap();
		HttpSession ses = req.getSession(false);

		if(ses == null) {

			String name = data.get(Me.params.name)[0], email = data.get(Me.params.email)[0],
					pass = data.get(Me.params.pass)[0];

			if (!name.isEmpty() && !email.isEmpty() && !pass.isEmpty()) {

				if (Security.isValidText(name) && Security.isValidText(email) &&
				Security.isValidText(pass)) {

					try {
						Connection con = DbConnect.connect(Me.DB.url, Me.DB.user, Me.DB.pass);
						PreparedStatement sql = con.prepareStatement
								("SELECT name, email FROM users WHERE name=? OR email=?;");
						sql.setString(1, name);
						sql.setString(2, email);

						ResultSet resultSet = sql.executeQuery();

						System.out.println("Conectado!, resultset es:" + resultSet);

						if(resultSet.next()) {
							System.out.println("Ya existe ese user");
							req.setAttribute(Me.DB.exists, true);
							req.getRequestDispatcher(Me.signin).forward(req, resp);
							return;
						}
					}
					catch (SQLException e) {
						System.out.println("Error al conectar a la db");
						e.printStackTrace();
					}

					String code = Security.Chaos(Me.commonBase, Me.codeSize);

					boolean ok;

					try {
						ok = azureMailSender.sendPy(email, "VERIFICACIÓN-P4",
							String.format(
									"🎇🎇 Hola 🎇🎇, tu código de verificación (expira en %s min) es: %s",
									Me.timeoutMins, code.toUpperCase()), Me.extern.cat);
					}
					catch (InterruptedException e) {
						ok = false;
						e.printStackTrace();
					}

					if(ok == false) {
						req.setAttribute(Me.codeSent, Boolean.toString(ok));
						try {
							req.getRequestDispatcher(Me.signin).forward(req, resp);
							return;
						} catch (ServletException|IOException e) {
							e.printStackTrace();
						}
					}


					ses = req.getSession(true);
					ses.removeAttribute(Me.DB.exists);

					ses.setAttribute(Me.params.tkn_case, Me.signin);

					Cookie brownie = Me.bakeBrownie(Me.timeoutSecs);
					ses.setMaxInactiveInterval(Me.timeoutSecs);

					resp.addCookie(brownie);
					ses.setAttribute(Me.brownie, brownie);

					ses.setAttribute(Me.verificationCode, code);

					// params from form, pass is now hash(pass)
					// also an extra "salt" field added to server side ses
					ses.setAttribute(Me.params.name, name);
					ses.setAttribute(Me.params.email, email);

					String salt = Security.Chaos(Me.commonBase, Me.idAuthSize);
					ses.setAttribute(Me.params.salt, salt);
					pass = Security.Sha512(Me.commonBase, pass, salt, Me.pepper);

					ses.setAttribute(Me.params.pass, pass);

					System.out.println(code.toUpperCase());
					System.out.println(
							String.format("verif:%s\nname:%s\nemail:%s\nsalt:%s\npass:%s\n",
									code, name, email, salt, pass)
					);

					try {
						resp.sendRedirect(Me.token);
					} catch (IOException ioe) {
						ioe.printStackTrace();
					}

				}
				else {
					try {
						req.getRequestDispatcher(Me.signin).forward(req, resp);
						//resp.sendRedirect(Me.signin);
					}
					catch (ServletException | IOException E) {
						E.printStackTrace();
					}
				}
			}
		}
		// browser id + csrf token = better security
	}
}
