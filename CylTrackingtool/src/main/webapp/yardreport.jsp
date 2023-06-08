<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Dbconnection.Dbconnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Yard Reports</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous"></link>
</head>
<body>
<%
    Dbconnection dbconnection = null;
    Connection connection = null;
    PreparedStatement preparedStatement = null;

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
                <th scope="col">Cylinder No</th>
                <th scope="col">Type of Cylinder</th>
                <th scope="col">Date ECR</th>
                <th scope="col">Time ECR</th>
            </tr>
        </thead>
        <tbody>
<%
int i=0;
        while (resultSet.next()) {
        	i++;
%>
            <tr>
           
                <th scope="row"><%=i %></th>
                <td><%= resultSet.getString(2) %></td>
                <td><%= resultSet.getString(1) %></td>
                <td><%= resultSet.getString(3) %></td>
                <td><%= resultSet.getString(4) %></td>
                <td><%=resultSet.getString(6) %></td>
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
<button class="btn btn-primary active" style="margin-left:30%" onclick="redirect()">
Back to Incoming
</button>

</body>
<script type="text/javascript">
function redirect() {
	window.location.href="http://localhost:8080/CylTrackingtool/incoming.jsp";
}

</script>

</html>
