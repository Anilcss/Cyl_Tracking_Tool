package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import Dbconnection.Dbconnection;

public class Dao {
	
    public static void insert_cly_data(ArrayList<String> clyno) {
    	Dbconnection dbconnection=null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int countconnection=0;
       
        try {
             dbconnection = new Dbconnection();
            connection = dbconnection.getConnection();
            countconnection++;
            // Fetching the CylType values from cylmaster table
            PreparedStatement preparedStatement2 = connection.prepareStatement("SELECT CylType FROM cylmaster");
            ResultSet resultSet = preparedStatement2.executeQuery();
            ArrayList<String> cyltype = new ArrayList<String>();

            while (resultSet.next()) {
                cyltype.add(resultSet.getString(1));
            }

            System.out.println(cyltype);

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String currentdate = LocalDateTime.now().format(formatter);
            int passin=0;
            passin++;
            // Iterate through clyno ArrayList and insert each value into the database
            for (int i = 0; i < clyno.size(); i++) {
                preparedStatement = connection.prepareStatement("INSERT INTO yard (Cylinderno, CustomerID, CylType, datein,passin) VALUES (?, ?, ?, ?,?)");
                preparedStatement.setString(1, clyno.get(i));
                preparedStatement.setString(2, "041");
                preparedStatement.setString(3, "5");
                preparedStatement.setString(4, currentdate);
                preparedStatement.setString(5, Integer.toString(passin));
                // Execute the insert statement for each clyno value
                int inserted = preparedStatement.executeUpdate();
                if (inserted != 0) {
                    System.out.println("Inserted Successfully: " + inserted);
                } else {
                    System.out.println("Failed to insert");
                }
                
            }
          System.out.println("Total connection======>"+countconnection);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        } finally {
			if (connection!=null || preparedStatement!=null) {
				try {
				preparedStatement.close();
					connection.close();
					countconnection--;
					System.out.println("Total connection======>"+countconnection);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
    }
}
