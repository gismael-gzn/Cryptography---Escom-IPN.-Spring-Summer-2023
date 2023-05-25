package com.example.cv;

import function.Me;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Map;

@WebServlet(name = Me.authsrv2, value = "/"+Me.authsrv2)
public class authSrv2 extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Map<String, String[]> data = req.getParameterMap();

		HttpSession ses = req.getSession(false);

		if(ses != null) {
			if (Me.compareCookies_Request_Session(Me.brownie, req, ses)) {
				if (Me.compareData_Form_Session(Me.verificationCode, data, ses)) {
					Cookie idAuthCookie = Me.idAuthGen(Integer.MAX_VALUE);
					resp.addCookie(idAuthCookie);
					ses.setAttribute(Me.idAuth, idAuthCookie);

					req.changeSessionId();
					ses = req.getSession(false);
					ses.setMaxInactiveInterval(Integer.MAX_VALUE);

					ses.removeAttribute(Me.verificationCode);

//					req.getRequestDispatcher(Me.Curriculum).forward(req, resp);
					resp.sendRedirect(Me.Home);
				}
				else {
					System.out.println("a");
					req.getRequestDispatcher(Me.auth2).forward(req, resp);
				}
			}
			else {
				System.out.println("b");
				resp.sendRedirect(Me.errorHtml);
			}
		}
		else {
			System.out.println("c");
			resp.sendRedirect(Me.errorHtml);
		}
	}
}
