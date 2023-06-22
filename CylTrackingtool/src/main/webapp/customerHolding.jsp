<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Dbconnection.Dbconnection"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yard Reports</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"></link>
</head>
<body>
	<jsp:include page="Menu.jsp" />

<form action="" method="post">

<%
Dbconnection dbconnection = new Dbconnection();
PreparedStatement preparedStatement = null;
try {
    
    Connection conn=dbconnection.getConnection();
    
    String query = "SELECT * FROM newcusttable";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    
    %>
    <select>
    <%
    while (rs.next() && rs.getString("custcompname")!=null) {
        String value = rs.getString("custcompname");
        String id=rs.getString("custid");
        %><option value="<%=id %>" name= ""> <%=value %> </option>
        <%
    }
    %>
    </select>
    <%
    rs.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    e.printStackTrace();
}




%>

<input placeholder="ECR-NO" type="number" name="ecrno">
<select name="cyltype" >
							<option value="" selected="selected">Select Cyl</option>
								<option value="1">O2</option>
								<option value="2">N2</option>
								<option value="3">Ar</option>
						</select>
<button class="btn btn-primary active" type="submit">Submit</button>
</form>

	<%
	
	Connection connection = null;
	PreparedStatement preparedStatement2 = null;
	ResultSet resultSet = null;
	try {
		
		connection = dbconnection.getConnection();
		
		String custname = request.getParameter("cust_name");
		String ecrno = request.getParameter("ecrno");
		String cyltype=request.getParameter("cyltype");
		StringBuilder sql = new StringBuilder("SELECT * FROM YARD WHERE 1=1");
		
		if (custname != null && !custname.isEmpty()) {
			sql.append(" AND CustomerID = ?");
		}
		
		if (ecrno != null && !ecrno.isEmpty()) {
			sql.append(" AND passin = ?");
		}
		if (cyltype != null && !cyltype.isEmpty()) {
			sql.append(" AND CylType = ?");
		}
		preparedStatement2 = connection.prepareStatement(sql.toString());
		
		int parameterIndex = 0;
		if (custname != null && !custname.isEmpty()) {
			parameterIndex=parameterIndex+1;
		    preparedStatement2.setString(parameterIndex, custname);
		}

		if (ecrno != null && !ecrno.isEmpty()) {
			parameterIndex=parameterIndex+1;
		    preparedStatement2.setString(parameterIndex, ecrno);
		}

		if (cyltype != null && !cyltype.isEmpty()) {
			parameterIndex++;
			preparedStatement2.setString(parameterIndex, cyltype);
		}

		
		resultSet = preparedStatement2.executeQuery();
	%>
	<table class="table" border="2">
	
		<thead>
			<tr>
				<th scope="col">SL-NO</th>
				<th scope="col">ECR-NO</th>
				<th scope="col">Customer Name</th>
				<th scope="col">Cylinder No</th>
				<th scope="col">Type of Cylinder</th>
				<th scope="col">Date ECR</th>
				<th scope="col">Time ECR</th>
			</tr>
		</thead>
		<tbody>
			<%
			int i = 0;
			while (resultSet.next()) {
				i++;
			%>
			<tr>

				<td scope="row"><%=i%></td>
				<td><%=resultSet.getString(5)%></td>
				<td><%=resultSet.getString(2)%></td>
				
				<td><%=resultSet.getString(1)%></td>
				<td><%=resultSet.getString(3)%></td>
				<td><%=resultSet.getString(4)%></td>
				<td><%=resultSet.getString(6)%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
	resultSet.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	dbconnection.closeconnection();
	%>
	

</body>
<script type="text/javascript">
	function redirect() {
		window.location.href = "http://localhost:8080/CylTrackingtool/incoming.jsp";
	}
</script>

</html>
