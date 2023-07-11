package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;

import Dbconnection.Dbconnection;


public class DataQuery {
	private static Dbconnection dbconnection,dbconnection2,dbconnection3=null;
	private static PreparedStatement preparedStatement,preparedStatement2,preparedStatement3=null;
	private static Connection connection,connection2,connection3=null;
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
				System.out.println("=============="+LocalDateTime.now()+"================> Exception in ------(get cylinder type from database(cylinder master) by cylinder number )------DataQuery.fetchcyltypefromdatabase"+e);
			}
			finally {
				dbconnection2.closeconnection();
			}
			return type;
			
			
		}
		public static String fetchcylnamefromdatabase(String cyltype) {
			// TODO Auto-generated method stub
			String name="";
			try {
				dbconnection3=new Dbconnection();
				connection3=dbconnection3.getConnection();
				String sql2="select cylinder FROM cyltype where cylnum="+cyltype;
				preparedStatement3=connection3.prepareStatement(sql2);
				ResultSet resultSet=preparedStatement3.executeQuery();
				if(resultSet.next())
				{
					name=resultSet.getString("cylinder");
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("================="+LocalDateTime.now()+"=================Exception at (get name from cyltype like n2 o2 co2 with cyltype)"+e);
			}
			finally {
				dbconnection3.closeconnection();
			}
			return name;
		}
}
