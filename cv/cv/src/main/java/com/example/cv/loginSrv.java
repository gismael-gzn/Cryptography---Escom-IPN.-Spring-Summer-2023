package com.example.cv;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import function.*;

@WebServlet(name = Me.loginsrv, value = "/"+Me.loginsrv)
public class loginSrv extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Map<String, String[]> data = req.getParameterMap();
		HttpSession ses = req.getSession(false);

        if(ses == null) {
			String name = data.get(Me.params.name)[0], pass = data.get(Me.params.pass)[0],
					email, hash, salt;

			try {
				Connection con = DbConnect.connect(Me.DB.url, Me.DB.user, Me.DB.pass);
				PreparedStatement sql = con.prepareStatement
						("SELECT email,hash,salt FROM users WHERE name=?;");

				sql.setString(1, name);

				ResultSet resultSet = sql.executeQuery();

				if (resultSet.next()) {
					email = resultSet.getString(Me.params.email);
					hash = resultSet.getString(Me.params.hash);
					salt = resultSet.getString(Me.params.salt);

					System.out.println("***Conectado!, (login) resultset es***:" + resultSet);

					System.out.println(
							String.format("name:%s\nemail:%s\nsalt:%s\nhash:%s\n",
									name, email, salt, hash)
					);

					System.out.println("Computed hash:" + Security.Sha512(Me.commonBase, pass, salt, Me.pepper));

					if (Me.hash512Equals(pass, hash, salt, Me.pepper)) {

						String code = Security.Chaos(Me.commonBase, Me.codeSize);
						System.out.println(code.toUpperCase());

						boolean ok;
						try {
							ok = azureMailSender.sendPy(email, "VERIFICACIÓN-P4",
									String.format(
											"🎇🎇 Hola 🎇🎇, tu código de verificación (expira en %s min) es: %s",
											Me.timeoutMins, code.toUpperCase()), Me.extern.bug);
						} catch (InterruptedException e) {
							ok = false;
							e.printStackTrace();
						}

						if (ok == false) {
							req.setAttribute(Me.codeSent, Boolean.toString(ok));
							try {
								req.getRequestDispatcher(Me.signin).forward(req, resp);
								return;
							} catch (ServletException | IOException e) {
								e.printStackTrace();
							}
						}

						Cookie brownie = Me.bakeBrownie(Me.timeoutSecs);

						ses = req.getSession(true);

						ses.setAttribute(Me.verificationCode, code);
						ses.setAttribute(Me.params.tkn_case, Me.loginsrv);
						resp.addCookie(brownie);
						ses.setAttribute(Me.brownie, brownie);
						ses.setMaxInactiveInterval(Me.timeoutSecs);

						resp.sendRedirect(Me.token);
					} else {
						resp.sendRedirect(Me.signin);
					}
				}
				else {
					resp.sendRedirect(Me.signin);
				}
			}
			catch (SQLException e) {
				System.out.println("DB excepted");
				e.printStackTrace();
				resp.sendRedirect(Me.signin);
			}
		}
		else {
			if(Me.compareCookies_Request_Session(Me.brownie, req, ses)) {
				resp.sendRedirect(Me.token);
			}
		}
	}
}
