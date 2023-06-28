<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Dbconnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cylinder Master</title>
<h2></h2>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"></link>
<link rel="stylesheet" href="style.css"></link>

</head>
<body>
	<jsp:include page="masters.jsp" />
	<div class="header">
		<h1>Cylinder Tracking Tool</h1>

		<p>Cylinder Master Entry</p>
	</div>
	<hr>

	<div>
		<form action="Cylindermasters12">
			<table class="table" border="2px">
				<thead class="thead-dark">
					<tr class="col1">
						<th scope="col">Sl.no</th>
						<th scope="col">Cylinder no</th>
						
						<th scope="col">Cyl Type</th>
						<th scope="col">Cyl capacity(M3)</th>
						<th scope="col">Cyl Make</th>
						<th scope="col">Cyl date of manufacture</th>
						<th scope="col">Date of last testing</th>
					</tr>
				</thead>




				<thead class="thead-light">
				<tbody>
					<%
					int cyl_sum = 0;
					for (int i = 1; i <= 10; i++) {
						cyl_sum = cyl_sum + 1;
					%>
					<tr class="col1">
						<th scope="row"><%=i%>.</th>
						<td><input type="text" name="cylnomaster<%=i%>"
							style="border: 1px solid #ccc; padding: 5px;" placeholder="Cylinder Number"></td>
						<td><select name="cyltype<%=i%>"
							style="border: 1px solid #ccc; padding: 5px;">
								<option value="" selected="selected">Select Cyl</option>
								 <%
								 Dbconnection dbconnection=new Dbconnection();
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
						</select></td>
						<td><input type="number" name="cycap<%=i%>"
							style="border: 1px solid #ccc; padding: 5px;" placeholder="M3"></td>
						<td><input type="text" name="cylmake<%=i%>"
							style="border: 1px solid #ccc; padding: 5px;" placeholder="Manufacture Name"></td>
						<td><input type="date" name="cyldom<%=i%>"
							style="border: 1px solid #ccc; padding: 5px;"></td>
						<td><input type="date" name="cyldot<%=i%>"
							style="border: 1px solid #ccc; padding: 5px;"></td>
					</tr>

					<%
					}
					%>
					<tr class="col1">
						<td scope="row"></td>
						<td>Total Cylinders: <%=cyl_sum%>
						</td>
						<td></td>
						<td>
							<button class="btn btn-primary active" type="submit">Submit</button>
							<button class="btn active delete1 " type="reset">Cancel</button>
						</td>
					</tr>
				</tbody>

			</table>

		</form>

	</div>
	
</body>
</html>