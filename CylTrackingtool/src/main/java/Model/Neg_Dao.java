package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Dbconnection.Dbconnection;

public class Neg_Dao {
	private static Dbconnection dbconnection=null;
	private static Connection connection=null;
	private static PreparedStatement preparedStatement=null;
	public static void insert_into_neg_yard() {
		
		//Checkforvalue before inserting into negetive stock by boolean return method
		
		System.out.println("Negetive stock begin in Yard");
		// TODO Auto-generated method stub 
		dbconnection = new Dbconnection();
		connection = dbconnection.getConnection();
		String sql="";
		try {
			preparedStatement=connection.prepareStatement(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			dbconnection.closeconnection();
		}
			
			
	}

}
