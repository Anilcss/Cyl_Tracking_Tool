<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="Dbconnection.Dbconnection"%>
<html>
<head>
<meta charset="UTF-8">
<title>Incoming</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"></link>
<link rel="stylesheet" href="style.css">
<script src="js/incomingjs.js"></script>
</head>
<body>
  <jsp:include page="Menu.jsp" />
<% Dbconnection dbconnection = new Dbconnection(); %>
  <div class="header">
    <h1>Cylinder Tracking Tool</h1>
    <p>Company Name</p>
  </div>
  <hr>
  <div class="customer">
    <div class="Cust_name">
      
    </div>
    <div class="form-group">
      <% 
      
      LocalDate today = LocalDate.now();
      String formattedDate = today.format(DateTimeFormatter.ISO_LOCAL_DATE);
    	
     
      try {
        Connection conn = dbconnection.getConnection();
        String query = "SELECT * FROM newcusttable";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
      %>
      <select class="form-control" >
      <option>Select Customer</option>
        <%
        while (rs.next() && rs.getString("custcompname") != null) {
          String value = rs.getString("custcompname");
        %>
        <option value=""><%= value %></option>
        <% } %>
      </select>
      <%
        rs.close();
        stmt.close();
        conn.close();
      } catch (Exception e) {
        e.printStackTrace();
      } finally {
        try {
          dbconnection.closeconnection();
        } catch (Exception e) {
          System.out.println(e);
        }
      }
      %>
    </div>
    <div class="form-group" style="padding-left: 20px">
      <input type="date" value="<%=formattedDate %>" id="incoming_date" class="form-control" style="border-color: blue; border-bottom-left-radius: 10px; border-top-right-radius: 10px; ">
     
    </div >
    <div class="form-group" style="margin-left:20px; display: flex;s " >
    <h4>ECR No :</h4>
    <%
    try {
    	Connection conn1 = dbconnection.getConnection();
        String query1 = "SELECT passin FROM yard ORDER BY passin DESC LIMIT 1;";
        Statement stmt1 = conn1.createStatement();
        ResultSet rs1 = stmt1.executeQuery(query1);
        int ecrrs1=0;
      %>
      
        <%
        if(rs1.next())
        {
         ecrrs1=Integer.parseInt(rs1.getString("passin"));
        }
        %>
        <h4> &nbsp;<%=(ecrrs1)+1 %></h4>
        <%
        } catch (Exception e) {
        e.printStackTrace();
      } finally {
        try {
        	
          dbconnection.closeconnection();
        } catch (Exception e) {
          System.out.println(e);
        }
      }
        
        %>
      
       
    
    </div>
  </div>
  <div>
 
  </div>
  <div>
    <form action="Incoming">
      <table class="table">
        <thead class="thead-dark">
          <tr class="col1">
            <th scope="col">Sl.no</th>
            <th scope="col">Cylinder no</th>
            <th scope="col">Cyl Type</th>
          </tr>
        </thead>
        <tbody>
          <%
          int cyl_sum = 0;
          for (int i = 1; i <= 10; i++) {
            cyl_sum = cyl_sum + 1;
          %>
          <tr class="col1">
            <th scope="row"><%= i %>.</th>
            <td><input type="text" name="cylno<%= i %>" class="form-control"></td>
            <td>
              <select class="form-control" disabled="disabled" >
                <option selected="selected">Select Cylinder</option>
                 <%
                
                 try{
        		    	
            		    Connection conn = dbconnection.getConnection();
 					String drop = "SELECT * FROM cyltype";
 					PreparedStatement preparedStatement = conn.prepareStatement(drop);
 			ResultSet rs = preparedStatement.executeQuery();
 			
 			while(rs.next())
 			{
 				%>
 				<option value="<%=rs.getString(1)%>" name="cyltype+<%=i%>"> <%=rs.getString(2) %></option>
 				<%					
 			}
        		    	 
        		    	 
        		    	 
        		     }
					catch(Exception e) {
						e.printStackTrace();
						
					}
					finally{
						if(dbconnection!=null)
						{
							dbconnection.closeconnection();
						}
					}

               %>
              </select>
            </td>
          </tr>
          <%
          }
          %>
          <tr class="col1">
            <td scope="row"></td>
            <td class="total-cylinders" colspan="2">Total Cylinders: <%=cyl_sum %></td>
            <td class="btn-container">
              <button class="btn btn-primary active" type="submit">Push All</button>
              <button class="btn active delete1" type="reset">Clear All</button>
            </td>
          </tr>
        </tbody>
      </table>
    </form>
  </div>
</body>
</html>
