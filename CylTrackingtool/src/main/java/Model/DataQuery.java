package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Dbconnection.Dbconnection;


public class DataQuery {
	
	public static void main(String[] args) {
		fetchcylindermasterdata();
	}
	
		public static void fetchcylindermasterdata() {
			ArrayList<String> cylno=new ArrayList<String>();
			Dbconnection dbconnection=null;
			PreparedStatement preparedStatement=null;
			Connection connection=null;
			
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
				System.out.println(cylno);
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				dbconnection.closeconnection();
			}

		}
}
