package Checkforvalue;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import Dbconnection.Dbconnection;

public class cyl_ispresent {
	private static Dbconnection dbconnection1, dbconnection2 = null;
	private static Connection connection1, connection2 = null;

	public static boolean isinyard(int cylno) {
		// TODO Auto-generated method stub
		dbconnection1 = new Dbconnection();
		PreparedStatement preparedStatement = null;
		connection1 = dbconnection1.getConnection();
		boolean check = false;
		String sql = "select Cylinderno  from yard where Cylinderno=? and DELNO IS NULL";
		try {
			preparedStatement = connection1.prepareStatement(sql);
			preparedStatement.setString(1, cylno + "");
			check = preparedStatement.execute();
			System.out.println("==================isinyard"+check);
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

		return check;

	}

	public static boolean isincustholding(int cylno_custholding) {
		// TODO Auto-generated method stub
		dbconnection2 = new Dbconnection();
		connection2 = dbconnection2.getConnection();
		PreparedStatement preparedStatement = null;
		boolean check=false;
		String sql = "SELECT Cylinderno FROM customerholding WHERE Cylinderno=" + cylno_custholding+ " and DELNO IS NULL";
		try {
			preparedStatement = connection2.prepareStatement(sql);
			check = preparedStatement.execute();
			
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

		return check;
	}
	
	public static boolean isinyardfor_initialstock(ArrayList<String> cyllist) {
		// TODO Auto-generated method stub

		// TODO Auto-generated method stub
		dbconnection1 = new Dbconnection();
		PreparedStatement preparedStatement = null;
		connection1 = dbconnection1.getConnection();
		boolean check = false;
		String cyl_inyard=null;
		
		try {
			
			for (String yard_neg : cyllist) {
				try {
					String sql = "select Cylinderno from yard where Cylinderno=?";
					preparedStatement = connection1.prepareStatement(sql);
					preparedStatement.setString(1,yard_neg);
					ResultSet resultSet= preparedStatement.executeQuery();
					if(resultSet.next())
					{
					 cyl_inyard=resultSet.getString("Cylinderno");
					}
					if(cyl_inyard!=null)
					{
						check=true;
						break;
					}
					System.out.println("================================isinyardfor initial stock"+check);
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
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

		return check;

	

	}
	public static boolean isincustholding_initialstock(ArrayList<String> cyllist) {
		// TODO Auto-generated method stub

		// TODO Auto-generated method stub
		dbconnection1 = new Dbconnection();
		PreparedStatement preparedStatement = null;
		connection1 = dbconnection1.getConnection();
		boolean check = false;
		String cyl_inyard=null;
		
		try {
			String sql = "select Cylinderno from customerholding where Cylinderno=?";
			for (String yard_neg : cyllist) {
				try {
					preparedStatement = connection1.prepareStatement(sql);
					preparedStatement.setString(1,yard_neg);
					ResultSet resultSet= preparedStatement.executeQuery();
					if(resultSet.next())
					{
					 cyl_inyard=resultSet.getString("Cylinderno");
					}
					if(cyl_inyard!=null)
					{
						check=true;
						break;
					}
						System.out.println("================================is in custHolding for initial stock"+check);
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
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

		return check;

	

	}
	
}
