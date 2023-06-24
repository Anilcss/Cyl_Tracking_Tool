<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Dbconnection.Dbconnection"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Holding</title>
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
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {

			connection = dbconnection.getConnection();

			String query = "SELECT * FROM newcusttable";
			preparedStatement = connection.prepareStatement(query);
			ResultSet rs = preparedStatement.executeQuery();
		%>
		<select >
		<option selected="selected">Select Customer</option>
			<%
			while (rs.next() && rs.getString("custcompname") != null) {
				String value = rs.getString("custcompname");
				String id = rs.getString("custid");
				%>
			
			<option value="<%=id%>" name="">
				<%=value%>
			</option>
			<%
			}
			%>
		</select>
		<%
		rs.close();

		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		}
		%>

		<input placeholder="Pass Out" type="number" name="passout"> 
		<select name="cyltype" >
		
			<option value="" selected="selected">Select Cyl</option>
			
			<%
			String drop = "SELECT * FROM cyltype";
			preparedStatement = connection.prepareStatement(drop);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next())
			{
				%>
				<option value="<%=rs.getString(1)%>" name="cyltype"> <%=rs.getString(2) %></option>
				<%					
			}
			%>
			
			
			
			
			
		</select>
		<button class="btn btn-primary active" type="submit">Submit</button>
	</form>

	<%
	PreparedStatement preparedStatement2 = null;
	ResultSet resultSet = null;
	try {
		String custname = request.getParameter("cust_name");
		String passout = request.getParameter("passout");
		String cyltype = request.getParameter("cyltype");
		StringBuilder sql = new StringBuilder("SELECT * FROM customerholding WHERE 1=1");

		if (custname != null && !custname.isEmpty()) {
			sql.append(" AND CustomerID = ?");
		}

		if (passout != null && !passout.isEmpty()) {
			sql.append(" AND passout = ?");
		}
		if (cyltype != null && !cyltype.isEmpty()) {
			sql.append(" AND CylType = ?");
		}
		preparedStatement2 = connection.prepareStatement(sql.toString());

		int parameterIndex = 0;
		if (custname != null && !custname.isEmpty()) {
			parameterIndex = parameterIndex + 1;
			preparedStatement2.setString(parameterIndex, custname);
		}

		if (passout != null && !passout.isEmpty()) {
			parameterIndex = parameterIndex + 1;
			preparedStatement2.setString(parameterIndex, passout);
		}

		if (cyltype != null && !cyltype.isEmpty()) {
			parameterIndex++;
			preparedStatement2.setString(parameterIndex, cyltype);
		}

		resultSet = preparedStatement2.executeQuery();
	%>
	<table class="table" border="2" style="text-align: center;">

		<thead>
			<tr>
				<th scope="col">SL-NO</th>
				<th scope="col">PASS-OUT</th>
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
			String cust_name = null;
			while (resultSet.next()) {

				i++;
				PreparedStatement preparedStatement3 = null;
				StringBuilder queryBuilder = new StringBuilder();
				queryBuilder.append("SELECT custcompname FROM newcusttable WHERE custid = ");
				queryBuilder.append(resultSet.getString(1));
				String sql1 = queryBuilder.toString();
				preparedStatement3 = connection.prepareStatement(sql1);
				ResultSet resultSet2 = preparedStatement3.executeQuery();
				if (resultSet2.next()) {
					cust_name = resultSet2.getString(1);
				}
			%>
			<tr >
				<td scope="row"><%=i%></td>
				<td><%=resultSet.getString(5)%></td>
				<td><%=cust_name%></td>
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
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	try {
		if (resultSet != null) {
			resultSet.close();
		}
		if (preparedStatement2 != null) {
			preparedStatement2.close();

		}
		if (connection != null) {
			connection.close();
		}
		dbconnection.closeconnection();
	} catch (SQLException ex) {
		ex.printStackTrace();
	}

	}
	%>

</body>
<script type="text/javascript">
	function redirect() {
		window.location.href = "http://localhost:8080/CylTrackingtool/incoming.jsp";
	}
</script>

</html>
