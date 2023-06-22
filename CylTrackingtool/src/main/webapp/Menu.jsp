<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <style>
    /* CSS styling for the navigation bar */
    ul.navbar {
      list-style-type: none;
      margin: 0;
      padding: 0;
      overflow: hidden;
      background-color: #f1f1f1;
      font-size: large;
    }

    ul.navbar li {
      float: left;
    }

    ul.navbar li a {
      display: block;
      color: black;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
    }

    ul.navbar li a:hover {
      background-color: grey;
      color:white;
      font-size: large;
    }
  </style>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>

<div>
 <ul class="navbar">
    <li><a href="Menu.jsp">Home</a></li>
    <li><a href="incoming.jsp">Incoming</a></li>
    <li><a href="Delivery.jsp">Outgoing</a></li>
    <li><a href="yardreport.jsp">Yard Reports</a></li>
    <li><a href="customerHolding.jsp">Customer Holdings</a></li>
    <li><a href="customercreation.jsp">Customer Registration</a></li>
  </ul>

</div>

</body>
</html>