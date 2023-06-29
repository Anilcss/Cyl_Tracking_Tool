package Model;

import java.io.Console;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.ConsoleHandler;

import Dbconnection.Dbconnection;

public class Cylmasters {
	Connection connection = null;

	public void insert_Cyl_masters(ArrayList<String> cylmaster) {
		Dbconnection dbconnection = new Dbconnection();
		try {
			connection = dbconnection.getConnection();// O(1)
			String sql = "INSERT INTO cylmaster (cylno, cyltype, cylmake, cylDOM, cylDOT,cylcapacity) VALUES(?,?,?,?,?,?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);// O(1)
			int index = 1;
			for (String value : cylmaster) {
				preparedStatement.setString(index++, value);// O(n) inthis case n=5
			}

			int dbupdate = preparedStatement.executeUpdate();// O(n) n=5
			System.out.println(dbupdate);
		} catch (SQLException e) {
			System.out.println(
					"Error: " + LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd :: HH:mm:ss"))
							+ "==>" + e.getMessage());
		} finally {
			dbconnection.closeconnection();
		}
	}
}
