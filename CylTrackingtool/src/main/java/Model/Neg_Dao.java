package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import Dbconnection.Dbconnection;

public class Neg_Dao {
	private static Dbconnection dbconnection=null;
	private static Connection connection=null;
	
	public static void insert_into_neg_yard(ArrayList<String> clyno,String Customerid) {
		
		//Checkforvalue before inserting into negetive stock by boolean return method
		PreparedStatement preparedStatement=null;
		System.out.println("==========================================Negetive stock begin in Yard");
		// TODO Auto-generated method stub 
		dbconnection = new Dbconnection();
		connection = dbconnection.getConnection();
		String passin_from_yard=null;
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("SELECT passin FROM yard ORDER BY passin DESC LIMIT 1");

			if (resultSet.next()) {
				passin_from_yard = resultSet.getString("passin");
			}
			if (passin_from_yard == null) {
				passin_from_yard = "0";
			}
			String cylpassin=passin_from_yard;
			String sql="INSERT INTO yard (Cylinderno, CustomerID, CylType, datein,passin,Intime) VALUES (?, ?, ?, ?, ?, ?)";
			preparedStatement=connection.prepareStatement(sql);
			for (int i = 0; i < clyno.size(); i++) {
				try {
					preparedStatement = connection.prepareStatement(
							"INSERT INTO neg_yard (Cylinderno, CustomerID, CylType, datein,passin,Intime) VALUES (?, ?, ?, ?, ?, ?)");
					preparedStatement.setString(1, clyno.get(i));
					preparedStatement.setString(2, Customerid);
					preparedStatement.setString(3, DataQuery.fetchcyltypefromdatabase(clyno.get(i)));
					preparedStatement.setString(4, LocalDate.now().toString());
					preparedStatement.setString(5, cylpassin);
					preparedStatement.setString(6, LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:MM:SS")));
					// Execute the insert statement for each clyno value
					int inserted = preparedStatement.executeUpdate();
					if (inserted != 0) {
						System.out.println("================================================Inserted Successfully in to Negetive stock " + inserted);
					} else {
						System.out.println("=================================================Failed to insert into negetive stock end");
					}

				} catch (Exception e) {
					System.out.println(e);
				}
			}
			
			
			System.out.println(passin_from_yard);
		} catch (Exception e) {
			// TODO: handle exception
		}
			
			
	}

	public static void insert_into_neg_customerholding(ArrayList<String> clyno,String Customerid ) {
		


		Dbconnection dbconnection = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int countconnection = 0;
		String passin_from_Yard = null;

		try {
			dbconnection = new Dbconnection();
			connection = dbconnection.getConnection();
			countconnection++;
			DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("HH:mm:ss");

			String currentdate = LocalDateTime.now().format(formatter1);
			String currenttime = LocalDateTime.now().format(formatter2);

			// Fetching the CylType values from cylmaster table
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement
					.executeQuery("SELECT passout FROM customerholding ORDER BY passout DESC LIMIT 1");

			if (resultSet.next()) {
				passin_from_Yard = resultSet.getString("passout");
			}
			if (passin_from_Yard == null) {
				passin_from_Yard = "0";
			}

			System.out.println(passin_from_Yard);
			int passin = Integer.parseInt(passin_from_Yard);
			passin++;
			String cylpassin = Integer.toString(passin);

			// Iterate through clyno ArrayList and insert each value into the database
			for (int i = 0; i < clyno.size(); i++) {
				preparedStatement = connection.prepareStatement(
						"INSERT INTO neg_customerholding (Cylinderno, CustomerID, CylType, dateout,passout,outtime) VALUES (?, ?, ?, ?, ?, ?)");
				preparedStatement.setString(1, clyno.get(i));
				preparedStatement.setString(2, Customerid);
				preparedStatement.setString(3, DataQuery.fetchcyltypefromdatabase(clyno.get(i)));
				preparedStatement.setString(4, currentdate);
				preparedStatement.setString(5, cylpassin);
				preparedStatement.setString(6, currenttime);
				// Execute the insert statement for each clyno value
				int inserted = preparedStatement.executeUpdate();
				if (inserted != 0) {
					System.out.println("Inserted Successfully into neg stocks of Customer holding if 1 here is successfull num->  " + inserted);
				} else {
					System.out.println("Failed to insert into neg stocks of customer holding");
				}

			}
			System.out.println("Total connection======>" + countconnection);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("===================Error");
			System.out.println(e);
		} finally {
			if (dbconnection != null) {
				dbconnection.closeconnection();
			}
		}

	
		

	}
}
