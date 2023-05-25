package com.example.cv;

import function.Me;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

@WebServlet(name = Me.DownloadSrv, value = "/"+Me.DownloadSrv)
public class Download extends HttpServlet {

	private void doVerification(Map<String, String[]> data, HttpSession ses, HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
	String saysomething = "", other = "";
		if(ses != null) {
			if(Me.compareCookies_Request_Session(Me.brownie, req, ses)) {
					if(Me.compareCookies_Request_Session(Me.idAuth, req, ses)) {
						Cookie newBrownie = Me.bakeBrownie(Integer.MAX_VALUE), brownie = Me.findCookie(Me.brownie, req);
						Cookie auth = Me.findCookie(Me.idAuth, req), newAuth = Me.idAuthGen(Integer.MAX_VALUE);

						saysomething = String.format("your [%s] cookie %s is now %s", brownie.getName(), brownie.getValue(), newBrownie.getValue());
						other = String.format("your [%s] cookie %s is now %s", auth.getName(), auth.getValue(), newAuth.getValue());

						brownie.setMaxAge(0);
						brownie.setValue(null);
						auth.setMaxAge(0);
						auth.setValue(null);

						resp.addCookie(newBrownie);
						resp.addCookie(newAuth);

						ses.setAttribute(Me.brownie, newBrownie);
						ses.setAttribute(Me.idAuth, newAuth);
					}
					else {
						System.out.println("d");
						resp.sendRedirect(Me.errorHtml);
					}
			}
			else {
				System.out.println("e");
				resp.sendRedirect(Me.errorHtml);
			}
		}
		else {
			System.out.println("f");
			resp.sendRedirect(Me.errorHtml);
		}
	}
	private final int ARBITARY_SIZE = 1048;

	private void doDownload(String key, String readableName, String Mime, HttpServletRequest req, HttpServletResponse resp)
	throws IOException {
		resp.setContentType(Mime);
		resp.setHeader("Content-disposition", String.format("attachment; filename=%s", readableName));
		try(InputStream in = req.getServletContext().getResourceAsStream(String.format("/download/%s", key));
			OutputStream out = resp.getOutputStream()) {
			byte[] buffer = new byte[ARBITARY_SIZE];
			int numBytesRead;
			while ((numBytesRead = in.read(buffer)) > 0) {
				out.write(buffer, 0, numBytesRead);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, String[]> data = req.getParameterMap();
		HttpSession ses = req.getSession(false);

		doVerification(data, ses, req, resp);

		try {
			String key = data.get(Me.targetAttr)[0];

			if(Me.hash512compare(key, Me.cvPdf, "", Me.pepper))
				doDownload(key, Me.cvReadable, "application/pdf", req, resp);
			else if(Me.hash512compare(key, Me.keyBin, "", Me.pepper))
				doDownload(key, Me.keyBinReadable, "application/octet-stream", req, resp);
			else if(Me.hash512compare(key, Me.keyAsc, "", Me.pepper))
				doDownload(key, Me.keyAscReadable, "text/plain", req, resp);
			else
				resp.sendRedirect(Me.errorHtml);
		}

		catch (NullPointerException e) {
			e.printStackTrace();
			resp.sendRedirect(Me.errorHtml);
		}
	}
}