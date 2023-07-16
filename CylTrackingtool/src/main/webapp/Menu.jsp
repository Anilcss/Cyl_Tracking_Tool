<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Home Page</title>
  <style>
    /* CSS styling for the navigation bar */
    ul.navbar {
      list-style-type: none;
      margin: 0;
      padding: 0;
      overflow: hidden;
      background-color: #f1f1f1;
      font-size: 16px;
      font-family: Arial, sans-serif;
      border-bottom: 1px solid #ccc;
    }

    ul.navbar li {
      float: left;
    }

    ul.navbar li a {
      display: block;
      color: #333;
      text-align: center;
      padding: 12px 16px;
      text-decoration: none;
    }

    ul.navbar li a:hover {
      background-color: #333;
      color: #fff;
    }
  </style>
</head>
<body>
  <div>
    <ul class="navbar">
      <li><a href="Menu.jsp">Home</a></li>
      <li><a href="incoming.jsp">Incoming</a></li>
      <li><a href="Delivery.jsp">Outgoing</a></li>
      <li><a href="yardreport.jsp">Yard Reports</a></li>
      <li><a href="customerHolding.jsp">Customer Holdings</a></li>
      <li><a href="masters.jsp">Masters</a></li>
      <li><a href="initial_stock.jsp">Initial Stock(Only in Yard)</a></li>
    
    </ul>
  </div>
</body>
</html>
