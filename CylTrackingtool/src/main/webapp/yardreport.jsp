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

	<%
	Dbconnection dbconnection = null;
	Connection connection = null;
	PreparedStatement preparedStatement, preparedStatement2 = null;

	try {
		dbconnection = new Dbconnection();
		connection = dbconnection.getConnection();

		preparedStatement = connection.prepareStatement("SELECT * FROM YARD");

		ResultSet resultSet = preparedStatement.executeQuery();
	%>
	<table class="table" border="2">
		<thead>
			<tr>
				<th scope="col">Sl no</th>
				
				<th scope="col">Customer Name</th>
				<th scope="col">ECR no</th>
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
				
				<%
				try {

					String cust_name = null;
					preparedStatement2 = connection
					.prepareStatement("select custcompname from newcusttable where custid=" + resultSet.getString(5));

					ResultSet resultSet2 = preparedStatement2.executeQuery();
					if (resultSet2.next()) {
						cust_name = resultSet2.getString(1);
					}
				%>
				<td><%=cust_name%></td>
				<td><%=resultSet.getString(5)%></td>
				<%
				} catch (Exception e) {
				e.printStackTrace();
				} finally {}
				%>
				
				
				
				
				
				
				
				<td><%=resultSet.getString(1)%></td>

				<%
				try {

					String cylindername = null;
					preparedStatement2 = connection
					.prepareStatement("select cylinder from cyltype where cylnum=" + resultSet.getString(3));

					ResultSet resultSet2 = preparedStatement2.executeQuery();
					if (resultSet2.next()) {
						cylindername = resultSet2.getString(1);
					}
				%>
				<td><%=cylindername%></td>
				<%
				} catch (Exception e) {
				e.printStackTrace();
				} finally {

				}
				%>
				<!-- 5 -->
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
	connection.close();
	dbconnection.closeconnection();
	%>


</body>

</html>
