<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.masterreport" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report</title>
    <link rel="stylesheet" type="text/css" href="css/cylindermaster.css">
</head>
<body>
<jsp:include page="masterreports.jsp" />
    <% 
        masterreport.cylinder(request);
        List<String> reportdata = (List<String>) request.getAttribute("reportcyl");
    %>
    <table class="report-table">
        <tr>
            <th>Cylinder Number</th>
            <th>Cylinder Type</th>
            <th>Cylinder Make</th>
            <th>Cylinder DOM</th>
            <th>Cylinder DOT</th>
            <th>Cylinder Capacity</th>
        </tr>
        <% 
            for (int i = 0; i < reportdata.size(); i += 6) {
                out.println("<tr>");
                for (int j = 0; j < 6; j++) {
                    out.println("<td>" + reportdata.get(i + j) + "</td>");
                }
                out.println("</tr>");
            }
        %>
    </table>
</body>
</html>
