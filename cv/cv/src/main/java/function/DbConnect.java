package function;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect {
    static public Connection connect(String url, String username, String password)
			throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        return DriverManager.getConnection(url, username, password);
    }
}
