package Dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnection {
	private static final String URL = "jdbc:mysql://localhost:3306/Cyltool";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "root";
	private static int connectioncount=0;
	public Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			connectioncount++;
			System.out.println("Database connection established"+connectioncount);
		} catch (ClassNotFoundException e) {
			System.out.println("Failed to load MySQL JDBC driver");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Failed to connect to the database");
			e.printStackTrace();
		}
		return connection;
	}
}
