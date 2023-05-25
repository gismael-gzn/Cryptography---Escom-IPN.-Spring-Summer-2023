package com.example.cv;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

import function.*;

@WebServlet(name = Me.tokensrv, value = "/"+Me.tokensrv)
public class tokenSrv extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Map<String, String[]> data = req.getParameterMap();
		HttpSession ses = req.getSession(false);

		if(ses == null) {
			req.getRequestDispatcher(Me.signin).forward(req, resp);
			return;
		}

		String name = (String)ses.getAttribute(Me.params.name),
				email = (String)ses.getAttribute(Me.params.email),
				pass = (String)ses.getAttribute(Me.params.pass),
				salt = (String)ses.getAttribute(Me.params.salt);

		if(Me.compareData_Form_Session(Me.verificationCode, data, ses)) {
			try {
				if (ses.getAttribute(Me.params.tkn_case).equals(Me.signin)) {
					Connection con = DbConnect.connect(Me.DB.url, Me.DB.user, Me.DB.pass);
					PreparedStatement sql = con.prepareStatement
							("INSERT INTO users (name, hash, salt, email) VALUES (?, ?, ?, ?);");

					sql.setString(1, name);
					sql.setString(2, pass);
					sql.setString(3, salt);
					sql.setString(4, email);


					int rv = sql.executeUpdate();
					System.out.println(
							String.format("**%s**\nname:%s\nemail:%s\nsalt:%s\npass:%s\n",
									rv, name, email, salt, pass));
				}

				Cookie idAuthCookie = Me.idAuthGen(Me.stdSession_timeoutSecs);
				resp.addCookie(idAuthCookie);
				ses.setAttribute(Me.idAuth, idAuthCookie);

				req.changeSessionId();
				ses = req.getSession(false);
				ses.setMaxInactiveInterval(Me.stdSession_timeoutSecs);

				ses.removeAttribute(Me.verificationCode);
				ses.removeAttribute(Me.params.tkn_case);

				resp.sendRedirect(Me.crypto);
			}
			catch (SQLException e) {
				System.out.println("Database excepted");
				e.printStackTrace();
				ses.invalidate();
				resp.sendRedirect(Me.signin);
			}
		}
		else {
			req.getRequestDispatcher(Me.token).forward(req, resp);
		}
	}
}
