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

@WebServlet(name = Me.passurlsrv, value = "/"+Me.passurlsrv)
public class passUrl extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Map<String, String[]> data = req.getParameterMap();

		String long_token = Security.Chaos(Me.commonBase, Me.idAuthSize),
		name = data.get(Me.params.name)[0];

		if(name == null || name.isEmpty()) {
			resp.sendRedirect(Me.signin);
			return;
		}

		try {
			Connection con = DbConnect.connect(Me.DB.url, Me.DB.user, Me.DB.pass);
			PreparedStatement sql = con.prepareStatement
					("SELECT email FROM users WHERE name=?");
			sql.setString(1, name);

			ResultSet rs = sql.executeQuery();
			if(rs.next()) {
				String email, url;
				url = String.format(Me.passUrlToken_format, Me.params.token, long_token);
				email = rs.getString(Me.params.email);

				try {
					azureMailSender.sendPy(email, "Recuperacion de contraseña",
							String.format("🏛️🏛️ Enlace para resetar tu contraseña (expira en %s min): %s",
								Me.resetPass_timeoutMins, url), Me.extern.key);

//					insertar el token en la tabla
					PreparedStatement tkn_sql = con.prepareStatement
							("INSERT INTO password_reset(token, name, email) VALUES (?, ?, ?)");
					tkn_sql.setString(1, long_token);
					tkn_sql.setString(2, name);
					tkn_sql.setString(3, email);

					int rv = tkn_sql.executeUpdate();
					if(rv != 0) {
						System.out.println("url is:" + url);
						resp.sendRedirect(Me.signin);
					}
				}
				catch (IOException | InterruptedException e) {
					System.out.println("Correo fallo");
					e.printStackTrace();
				}
			}
			else {
				resp.sendRedirect(Me.passurl);
			}
		}
		catch (SQLException e) {
			System.out.println("DB Excepted");
			e.printStackTrace();
			resp.sendRedirect(Me.passurl);
		}
//        este servlet
//        genera un token
//        envia el token a correo de usuario mediante un url codificado
//        inserta el token en la db
	}
}
