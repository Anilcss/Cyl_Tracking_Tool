package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Dbconnection.Dbconnection;

public class Dao {
    static Dbconnection dbconnection = null;

    public static void insert_cly_data() {
        try {
            dbconnection = new Dbconnection(); 
            
            Connection connection = dbconnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO incoming (Cylinderno, CustomerID, CylType) VALUES (?, ?, ?)");
            
            preparedStatement.setString(1, "12347");
            preparedStatement.setString(2, "001");
            preparedStatement.setString(3, "2");
            
            int inserted = preparedStatement.executeUpdate();
            if (inserted != 0) {
                System.out.println("Inserted Successfully   "+inserted);
            } else {
                System.out.println("Failed");
            }
            
            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
        	e.printStackTrace();
            System.out.println(e);
        }
    }
}
