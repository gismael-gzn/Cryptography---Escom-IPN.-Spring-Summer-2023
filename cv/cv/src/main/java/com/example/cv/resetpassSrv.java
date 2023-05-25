package com.example.cv;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import function.*;
@WebServlet(name = Me.resetpasssrv, value = "/"+Me.resetpasssrv)
public class resetpassSrv extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Map<String, String[]> data = req.getParameterMap();

		String[] long_token = data.get(Me.params.token), newpass = data.get(Me.params.pass);

		if(long_token == null || newpass == null) {
			resp.sendRedirect(Me.signin);
		}

		if(long_token[0].isEmpty() || newpass[0].isEmpty()) {
			resp.sendRedirect(Me.signin);
		}

		System.out.println("***param_token:" + long_token[0]);

		try {
			String db_token, pass, salt, stamp, name;
			Connection con = DbConnect.connect(Me.DB.url, Me.DB.user, Me.DB.pass);
			PreparedStatement sql = con.prepareStatement
					("SELECT name,token,created_at FROM password_reset WHERE token=?");

			sql.setString(1, long_token[0]);

			ResultSet rs = sql.executeQuery();

			if(rs.next()) {
				name = rs.getString(Me.params.name);
				db_token = rs.getString(Me.params.token);
				stamp = rs.getString("created_at");

				LocalDateTime now = LocalDateTime.now();
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				String timeString = now.format(formatter);
				System.out.println(String.format("db_token:%s\nvs\nparam_token:%s\ndb_time:%s\nvs\nnow_time:%s\n",
						db_token, long_token[0], stamp, timeString)
				);

				if(!Me.hash512compare(db_token, long_token[0], "", "")) {
					resp.sendRedirect(Me.errorHtml);
					return;
				}

				LocalDateTime db_time = LocalDateTime.parse(stamp, formatter);
				long epch_db = db_time.atZone(ZoneId.systemDefault()).toEpochSecond();
				long epch_nw = now.atZone(ZoneId.systemDefault()).toEpochSecond();

//				prepara el borrador del token
				PreparedStatement del_tkn = con.prepareStatement
						("DELETE FROM password_reset WHERE token=?");
				del_tkn.setString(1, long_token[0]);

				int rv;
				if(epch_nw - epch_db > Me.resetPass_timeoutSecs) {
					del_tkn.executeUpdate();
					resp.sendRedirect(Me.passurl);
					return;
				}

				System.out.println(String.format("(db)%s - (nw)%s = %sSecs",
						epch_nw, epch_db, epch_nw-epch_db));

//				actualiza pass
				salt = Security.Chaos(Me.commonBase, Me.idAuthSize);
				pass = Security.Sha512(Me.commonBase, newpass[0], salt, Me.pepper);
				PreparedStatement sql_upd_pass = con.prepareStatement
						("UPDATE users SET hash=?, salt=? WHERE name=?;");
				sql_upd_pass.setString(1, pass);
				sql_upd_pass.setString(2, salt);
				sql_upd_pass.setString(3, name);

				rv = sql_upd_pass.executeUpdate();
				if(rv == 0) {
					resp.sendRedirect(Me.errorHtml);
					return;
				}

				System.out.println(String.format("new_pass:%s\nnew_salt:%s\nfor user:%s\n",
						pass, salt, name
				));

				rv = del_tkn.executeUpdate();
				if(rv == 0) {
					resp.sendRedirect(Me.errorHtml);
					return;
				}

				resp.sendRedirect(Me.welcome);
			}
			else {
				resp.sendRedirect(Me.errorHtml);
			}
		}
		catch (SQLException e) {
			System.out.println("DB Excepted");
			e.printStackTrace();
			resp.sendRedirect(Me.signin);
		}

//        resetPass servlet
//        si el token pasado por url existe en la bd
//        la actualizacion de la contraseña si pasa y el token se elimina
//        en otro caos no
	}
}
