<%@page import="Dbconnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cylinder Master</title>
<h2></h2>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous"></link>
<link rel="stylesheet" href="style.css"></link>

</head>
<body>
<jsp:include page="Menu.jsp" />
	<div class="header">
		<h1>Cylinder Tracking Tool</h1>

		<p>Cylinder Master Entry</p>
	</div>
	<hr>
	
	<div>
		<form action="Cylindermasters12">
			<table class="table">
				<thead class="thead-dark">
					<tr class="col1">
						<th scope="col">Sl.no</th>
						<th scope="col">Cylinder no</th>

						<th scope="col">Cyl Type</th>
						<th scope="col">Cyl Make</th>
						<th scope="col">Cyl date of manufacture</th>
						<th scope="col">Date of last testing</th>
					</tr>
				</thead>




				<thead class="thead-light">
				<tbody>
					<%
					int cyl_sum = 0;
					for (int i = 1; i <= 5; i++) {
						cyl_sum = cyl_sum + 1;
					%>
					<tr class="col1">
						<th scope="row"><%=i%>.</th>
						<td><input type="text" name="cylnomaster<%=i%>"></td>
						<td><select name="cyltype<%=i%>" >
							<option value="" selected="selected">Select Cyl</option>
								<option value="1">O2</option>
								<option value="2">N2</option>
								<option value="3">Ar</option>
						</select></td>
						<td><input type="text" name="cylmake<%=i%>" ></td>
						<td><input type="date" name="cyldom<%=i%>"></td>
						<td><input type="date" name="cyldot<%=i%>"></td>
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
	<%Dbconnection dbconnection=new Dbconnection();
	String str=request.getParameter("cylno1");
	if(str!=null){
	dbconnection.closeconnection();
	}
	%>
</body>
</html>