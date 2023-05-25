package function;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
public final class Security {
	static public boolean isValidText(String text) {
		return true;
	}
	static public String Chaos(int base, int byteLength) {
		if(base <= 1) {
			base = 36;
		}

		byte[] seq = new byte[byteLength];
		SecureRandom sr = new SecureRandom();
		sr.nextBytes(seq);

		return new BigInteger(seq).abs().toString(base);
	}
	static public String Sha512(int base, String value, String salt, String pepper) {
		if(base <= 1) {
			base = 36;
		}
		if(null == salt) {
			salt = "";
		}
		if(null == pepper) {
			pepper = "";
		}

		try {
			MessageDigest msd;
			msd = MessageDigest.getInstance("SHA-512");
			msd.update(String.format("%s%s%s", value, salt, pepper).getBytes(StandardCharsets.UTF_8));
			return new BigInteger(msd.digest()).abs().toString(base);
		} catch (NoSuchAlgorithmException nse) {
			nse.printStackTrace();
		}

		return null;
	}

		static public String Sha256(int base, String value, String salt, String pepper) {
		if(base <= 1) {
			base = 36;
		}
		if(null == salt) {
			salt = "";
		}
		if(null == pepper) {
			pepper = "";
		}

		try {
			MessageDigest msd;
			msd = MessageDigest.getInstance("SHA-256");
			msd.update(String.format("%s%s%s", value, salt, pepper).getBytes(StandardCharsets.UTF_8));
			return new BigInteger(msd.digest()).abs().toString(base);
		} catch (NoSuchAlgorithmException nse) {
			nse.printStackTrace();
		}

		return null;
	}
}


