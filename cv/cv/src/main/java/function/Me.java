package function;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.Map;

public final class Me {
	static final public boolean production = true;
	static final public String generalError = "general-error";
	static final public String codeSent = "code-sent";
	static final public String verificationCode = "verification-code";
	static final public String errorHtml = "error.html";
	static final public String Cryptography = "CryptographyDrainerEncounterUnexpiredBlinkedPerfectedRepavePlywoodFrostilyMaimed.jsp";
	static final public String Home = "HomeGrimeTraceBulginessBroilerExpandCrumpetChemicalsObsessiveEffects.jsp";
	static final public String Curriculum = "CurriculumSaunaShakinessResendEmpathicProngDespairMagnitudeUnwovenRemember.jsp";
//	Servlets
	static final public String auth1 = "7y6AoAVFUhrLCP8bzwpaePatXJCIqOp7ZlhuKBRXbquUEfKBZCwFeurHDdysRQdyhQlW1YO47UbloB4D1C6UkNmiCH23szs2KWP0zZUyA2N7EL7XPLDXZEj7IbL4eJCC.jsp";
	static final public String auth2 = "jk9V0YTWU465i7th1u8rCTftrHp9hsITlAOZOyHa7sDYhmDyDCqfrAe5uQk0FNurmhRBjQpvZnQYNgvZQJQU05FKremmNLIPeR7wbaFgDxvoWzkt9azl8XwbUOG8ygR0.jsp";
	static final public String DownloadSrv = "SdGbiRRp4AB3Q1dzxXFNV2nG6YHC6UcKUXsBIdzwOeyRyf7A23o6QeYBZwW3Itls";
	static final public String targetAttr = "target";
	static final public String authsrv1 = "9M7Pl4hwPbiBisiI5hrVlMWvG2w28uKdIdfet8Vyux6AzH3Gu4h6LGVzKQhuEejciVydQ74VX5f9zxVMyDllnGe9B8IyHRqSszdGBsgbukaqQSDNgot4ySgMYBU8Fiuv";
	static final public String authsrv2 = "BuOOYQ88zxwlHXdaWArg0paTJQfiIvIkzq5NsREGacUwG2S4LGHCQ9at4DfVXsvx1sASu30urrdHYfxMySxKK0hwN3Z5vMeKAt8FBqVVgvcIbJdSQMlpLyA2wmw7m45S";
	static final public String signin = "login_view.jsp";
	static final public String signinsrv = "signinsrv";
	static final public String token = "token.jsp";
	static final public String tokensrv = "tokensrv";
	static final public String loginsrv = "loginsrv";
	static final public String passurlsrv = "passUrlsrv";
	static final public String resetpasssrv = "resetpassSrv";
	static final public String resetpass = "reset_pass.jsp";
	static final public String passurl = "pass_url.jsp";
	static final public String crypto = "crypto.jsp";
	static final public String welcome = "welcome.html";
	static final public String passUrlToken_format = (production?
			"http://garzondev.xyz/":
			"http://localhost:8080/cv/")
			+ resetpass + "?%s=%s";

	public class params {
		static final public String
				email = "email",
				name = "name",
				pass = "pass",
				salt = "salt",
				hash = "hash";
		static final public String tkn_case = "tkn-case";
		static final public String token = "token";
	}

	public class DB {
		static final public String exists = "exists";
		static final public String url = production?
				"jdbc:mysql://localhost:3306/crypto":
				"jdbc:mysql://192.168.122.149:3306/crypto";
		static final public String user = "dinosaur";
		static final public String pass = "#dinosaur";
	}

//	Resources-downloads
	static final public String cvPdf = "ElJnGTIz6ungmR6jP0T4vTJSCFc6Vf3O7jH8HEhbzEcCNE9euCDj7KgzI7wD6ouZ.pdf";
	static final public String cvReadable = "IsmaelGarzon-CV.pdf";
	static final public String keyBin = "SgEo1PfGzxUv1Epw8mOYmaekh2dEG2mxTjcVZmJrsEUhSuWa6zC7bVMeiBPJSfFe.bin";
	static final public String keyBinReadable = "IsmaelGarzon-PublicRSA.bin";
	static final public String keyAsc = "VNTJd4vnZ0I4VWpvOyicjWyL9cwfe0nik4UWz4xaatMp4BHTwFuf1CTWDoqhca1H.asc";
	static final public String keyAscReadable = "IsmaelGarzon-PublicRSA.asc";

//	For crypto
	static final public String pepper = "salpimentado";
	static final public String masterPass = "Criptography With Nidia00";
	static final public int commonBase = 36;

	static final public int brownieSize = 32;
	static final public int codeSize = 8;

	static final public String masterHash = Security.Sha512(commonBase, masterPass, "", pepper);
	static final public String brownie = "brownie";
	static final public int idAuthSize = 64;
	static final public String idAuth = "id-auth";
	static final public int stdSession_timeoutHours = 12;
	static final public int stdSession_timeoutSecs = 60*60*stdSession_timeoutHours;
	static final public int resetPass_timeoutMins = 30;
	static final public int resetPass_timeoutSecs = 60*resetPass_timeoutMins;
	static final public int timeoutMins = 5;
	static final public int timeoutSecs = 60*timeoutMins;

	public class extern {
		static final public String pyInterpr = production?
				"python3":
				"python";
		static final public String extern = production?
				"/opt/tomee/webapps/ROOT/extern/":
				"/home/gismael/Mine/cv/cv/src/main/webapp/extern/";
		static final public String notify = extern+"Notify.py";
		static final public String cat = extern+"cat.png";
		static final public String bug = extern+"bug.png";
		static final public String key = extern+"key.png";
	}

	static private Cookie bakeRdCookie(String name, int byteSize, int timeoutSecs) {
		Cookie cookie = new Cookie(name, Security.Chaos(commonBase, byteSize));
		cookie.setMaxAge(timeoutSecs);
		return cookie;
	}
	static public Cookie idAuthGen(int timeoutSecs) {
		return bakeRdCookie(idAuth, idAuthSize, timeoutSecs);
	}
	static public Cookie bakeBrownie(int timeoutSecs) {
		return bakeRdCookie(brownie, brownieSize, timeoutSecs);
	}

	static public boolean hash512compare(String A, String B, String salt, String pepper) {
		return Security.Sha512(commonBase, A, salt, pepper).equals(Security.Sha512(commonBase, B, salt, pepper));
	}

	static public boolean hash512Equals(String compute, String hashed, String salt, String pepper) {
		return Security.Sha512(commonBase, compute, salt, pepper).equals(hashed);
	}

	static public boolean compareData_Form_Session(String parameterName, Map<String, String[]> data, HttpSession ses) {
		String A = data.get(parameterName)[0], B = (String) ses.getAttribute(parameterName);
		if(A == null || B == null)
			return false;

		A = A.toUpperCase();
		B = B.toUpperCase();

		System.out.println(A + "," + B);

		if(!hash512compare(A, B, "", ""))
			return false;

		return true;
	}

	static public boolean compareCookies_Request_Session(String cookieName, HttpServletRequest req, HttpSession ses) {
		if(cookieName == null || ses == null || req == null)
			return false;

		Cookie A = findCookie(cookieName, req), B = (Cookie) ses.getAttribute(cookieName);

		if(A == null || B == null)
			return false;

		System.out.println(String.format("(%s, %s) && (%s, %s)", A.getName(), A.getValue(), B.getName(), B.getValue()));

		if(!hash512compare(A.getValue(), B.getValue(), "", ""))
			return false;

		return true;
	}

	static public boolean hash256Equals(String compute, String hashed, String salt, String pepper) {
		return Security.Sha256(commonBase, compute, salt, pepper).toLowerCase().equals(hashed.toLowerCase());
	}

	static public Cookie findCookie(String name, HttpServletRequest req) {
		Cookie res = null;

		if(name == null)
			return res;

		for(Cookie c : req.getCookies()) {
			if(c.getName().equals(name)) {
				res = c;
			}
		}

		return  res;
	}

}
