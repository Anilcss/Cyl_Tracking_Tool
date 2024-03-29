package Dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.management.loading.PrivateClassLoader;

public class Dbconnection {
	private static final String URL = "jdbc:mysql://localhost:3306/Cyltool";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "root";
	private static int connectioncount=0;
	private static Connection connection = null;
	public Connection getConnection() {
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			connectioncount++;
			System.out.println("Database connection established"+connectioncount);
		} catch (ClassNotFoundException e) {
			System.out.println("Failed to load driver");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Failed to connect to the database");
			e.printStackTrace();
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return connection;
	}
	public void closeconnection()
	{
		if(connection!=null)
		{
			try {
				connection.close();
				connectioncount--;
				System.out.println("Total connection is=====>"+connectioncount);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
