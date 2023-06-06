package Dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnection {

	public Connection Connection() {

		String url = "jdbc:mysql://localhost:3306/Cyltool"; 
		String username = "root"; 
		String password = "root"; 
		
		Connection connect=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connect=DriverManager.getConnection(url,username,password);
			System.out.println("Database connection established");
	
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			System.out.println("Data base connection failed");
		}
		finally {
			if(connect!=null)
			{
				try {
					connect.close();
					System.out.println("Database connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("Failed to close Database connection");
				}
			}
		}
		return connect;
	}
	
		
	

}
