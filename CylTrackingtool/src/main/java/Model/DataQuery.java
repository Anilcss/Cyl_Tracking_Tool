package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Dbconnection.Dbconnection;


public class DataQuery {
	private static Dbconnection dbconnection,dbconnection2=null;
	private static PreparedStatement preparedStatement,preparedStatement2=null;
	private static Connection connection,connection2=null;
	static ArrayList<String> cylno=new ArrayList<String>();
	public static void main(String[] args) {
		//fetchcylindermasterdata();
		System.out.println(fetchcyltypefromdatabase("107"));
	}
	
		public static void fetchcylindermasterdata() {
			
			try {
				dbconnection=new Dbconnection();
				connection=dbconnection.getConnection();
				String sql="SELECT * FROM cylmaster";
				preparedStatement=connection.prepareStatement(sql);
				ResultSet resultSet=preparedStatement.executeQuery();
				while(resultSet.next())
				{
					cylno.add(resultSet.getString("cylno"));
					
				}
				//System.out.println(cylno);
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				dbconnection.closeconnection();
			}

		}
		public static String fetchcyltypefromdatabase(String cylno) {
			String type=null;
			try {
				dbconnection2=new Dbconnection();
				connection2=dbconnection2.getConnection();
				String sql="select cyltype FROM cylmaster where cylno="+cylno;
				preparedStatement2=connection2.prepareStatement(sql);
				ResultSet resultSet=preparedStatement2.executeQuery();
				if(resultSet.next())
				{
					type=resultSet.getString("cyltype");
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			finally {
				dbconnection2.closeconnection();
			}
			return type;
			
			
		}
}
