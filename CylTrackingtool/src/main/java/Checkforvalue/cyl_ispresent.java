package Checkforvalue;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Dbconnection.Dbconnection;

public class cyl_ispresent {
	private static Dbconnection dbconnection1, dbconnection2 = null;
	private static Connection connection1, connection2 = null;

	public static boolean inyard(int cylno) {
		// TODO Auto-generated method stub
		dbconnection1 = new Dbconnection();
		PreparedStatement preparedStatement = null;
		connection1 = dbconnection1.getConnection();
		String sql = "select * from yard where Cylinderno=? and DELNO IS NULL";
		try {
			preparedStatement = connection1.prepareStatement(sql);
			preparedStatement.setString(1, cylno+"");
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				String cylno_yard = resultSet.getString("Cylinderno");
				if (cylno_yard != null || cylno_yard != "" || !cylno_yard.isEmpty()) {
					return true;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				connection1.close();
				preparedStatement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dbconnection1.closeconnection();
		}

		return false;

	}

	public static boolean incustholding(int cylno_custholding) {
		// TODO Auto-generated method stub
		dbconnection2 = new Dbconnection();
		connection2 = dbconnection2.getConnection();
		PreparedStatement preparedStatement = null;
		String sql = "SELECT Cylinderno FROM customerholding WHERE Cylinderno=" + cylno_custholding+" and DELNO IS NULL";
		try {
			preparedStatement = connection2.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				String cylno = resultSet.getString("Cylinderno");
				if (cylno != null || cylno != "" || !cylno.isEmpty()) {
					return true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				connection2.close();
				preparedStatement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dbconnection2.closeconnection();
		}

		return false;
	}

	
}
