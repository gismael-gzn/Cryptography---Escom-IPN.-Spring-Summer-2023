package com.example.cv;

import function.Security;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Map;

import function.azureMailSender;
import function.Me;

@WebServlet(name = Me.authsrv1, value = "/"+Me.authsrv1)
public class authSrv1 extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		Map<String, String[]> data = req.getParameterMap();
		HttpSession ses = req.getSession(false);

		// No session
		if(ses == null) {

			String email = data.get("email")[0], identifier = data.get("identifier")[0];

			if (!email.isEmpty() && !identifier.isEmpty()) {

				if (Me.hash512Equals(identifier, Me.masterHash, "", Me.pepper)) {

					String code = Security.Chaos(Me.commonBase, Me.codeSize);

					boolean ok = azureMailSender.sendPlain(email, "VERIFICACIÓN-CV",
						String.format("🎇🎇 Hola 🎇🎇, tu código de verificación es: %s", code.toUpperCase())
					);

					if(ok == false) {
						req.setAttribute(Me.codeSent, Boolean.toString(ok));
						try {
							req.getRequestDispatcher(Me.auth1).forward(req, resp);
						} catch (ServletException|IOException e) {
							e.printStackTrace();
						}
					}

					ses = req.getSession(true);
					Cookie brownie = Me.bakeBrownie(Me.timeoutSecs);
					ses.setMaxInactiveInterval(Me.timeoutSecs);

					resp.addCookie(brownie);
					ses.setAttribute(Me.brownie, brownie);

					ses.setAttribute(Me.verificationCode, code);

					System.out.println(code.toUpperCase());

					try {
						resp.sendRedirect(Me.auth2);
					} catch (IOException ioe) {
						ioe.printStackTrace();
					}

				}
				else {
					try {
						req.getRequestDispatcher(Me.auth1).forward(req, resp);
						//resp.sendRedirect(Me.auth1);
					}
					catch (ServletException | IOException E) {
						E.printStackTrace();
					}
				}
			}
		}
		// browser id + csrf token = better security
	}

	public void destroy() {
	}
}