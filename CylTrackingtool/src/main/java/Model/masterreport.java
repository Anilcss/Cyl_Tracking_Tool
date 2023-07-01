package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import Dbconnection.Dbconnection;

public class masterreport {

    public static void cylinder(HttpServletRequest request) {
    	
        ArrayList<String> reportdata=new ArrayList<String>();
        Dbconnection dbconnection = null;
        PreparedStatement preparedStatement = null;
        Connection connection = null;
        
        try {
            dbconnection = new Dbconnection();
            connection = dbconnection.getConnection();
            String sql = "SELECT * FROM cylmaster";
            preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                
                reportdata.add(resultSet.getString("cylno"));
                String type=resultSet.getString("cyltype");
                reportdata.add(DataQuery.fetchcylnamefromdatabase(type));
                reportdata.add(resultSet.getString("cylmake"));
                reportdata.add(resultSet.getString("cylDOM"));
                reportdata.add(resultSet.getString("cylDOT"));
                reportdata.add(resultSet.getString("cylcapacity"));   
            }
            request.setAttribute("reportcyl", reportdata);
            //System.out.println(reportdata);
        } catch (Exception e) {
            // Handle exception
           System.out.println(e);
        } finally {
            dbconnection.closeconnection();
        }
        
       
    }
}
