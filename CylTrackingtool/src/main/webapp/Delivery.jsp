<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Dbconnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Outdelivery</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>
    <jsp:include page="Menu.jsp" />

    <div class="header">
        <h1>Cylinder Tracking Tool</h1>
        <p>Company Name</p>
    </div>
    <hr>
    <div class="customer">
        <div class="Cust_name">
            <%
            Dbconnection dbconnection=new Dbconnection();
            try {
                Connection conn = dbconnection.getConnection();
                String query = "SELECT * FROM newcusttable";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
            %>
            <select class="form-control">
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
        <%
        boolean flag = false;
        %>
        <div>
            <input <%if (flag) {%> disabled <%}%> type="date" class="form-control">
        </div>
        <h4>Pass out no:</h4>
    </div>

    <div>
        <form action="Incoming">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Sl.no</th>
                        <th scope="col">Cylinder no</th>
                        <th scope="col">Cyl Type</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    int cyl_sum = 0;
                    for (int i = 1; i <= 5; i++) {
                        cyl_sum = cyl_sum + 1;
                    %>
                    <tr>
                        <th scope="row"><%=i%>.</th>
                        <td><input type="text" name="cylno<%=i%>" class="form-control"></td>
                        <td>
                            <select class="form-control">
                                <option value="1" <%=(false)?"":""%>>O2</option>
                                <option value="2" <%=(true)?"selected":""%>>N2</option>
                                <option value="3">Ar</option>
                            </select>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                    <tr>
                        <td></td>
                        <td>Total Cylinders: <%=cyl_sum%></td>
                        <td></td>
                        <td>
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
