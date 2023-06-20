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

<input placeholder="Customer no" type="text" name="cust_name">
<input placeholder="passin" type="number" name="passin">
<select name="cyltype" >
							<option value="" selected="selected">Select Cyl</option>
								<option value="1">O2</option>
								<option value="2">N2</option>
								<option value="3">Ar</option>
						</select>
<button class="btn btn-primary active" type="submit">Submit</button>
</form>

	<%
	Dbconnection dbconnection = null;
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	try {
		dbconnection = new Dbconnection();
		connection = dbconnection.getConnection();
		
		String custname = request.getParameter("cust_name");
		String passin = request.getParameter("passin");
		String cyltype=request.getParameter("cyltype");
		StringBuilder sql = new StringBuilder("SELECT * FROM YARD WHERE 1=1");
		
		if (custname != null && !custname.isEmpty()) {
			sql.append(" AND CustomerID = ?");
		}
		
		if (passin != null && !passin.isEmpty()) {
			sql.append(" AND passin = ?");
		}
		if (cyltype != null && !cyltype.isEmpty()) {
			sql.append(" AND CylType = ?");
		}
		preparedStatement = connection.prepareStatement(sql.toString());
		
		int parameterIndex = 0;
		if (custname != null && !custname.isEmpty()) {
			parameterIndex=parameterIndex+1;
		    preparedStatement.setString(parameterIndex, custname);
		}

		if (passin != null && !passin.isEmpty()) {
			parameterIndex=parameterIndex+1;
		    preparedStatement.setString(parameterIndex, passin);
		}

		if (cyltype != null && !cyltype.isEmpty()) {
			parameterIndex++;
		    preparedStatement.setString(parameterIndex, cyltype);
		}

		
		resultSet = preparedStatement.executeQuery();
	%>
	<table class="table" border="2">
	
		<thead>
			<tr>
				<th scope="col">Sl no</th>
				<th scope="col">Passin</th>
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
	<button class="btn btn-primary active" style="margin-left: 30%"
		onclick="redirect()">Back to Incoming</button>

</body>
<script type="text/javascript">
	function redirect() {
		window.location.href = "http://localhost:8080/CylTrackingtool/incoming.jsp";
	}
</script>

</html>
