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
      <li><a href="customercreation.jsp">Customer Registration</a></li>
      <li><a href="Cylindermaster.jsp">Cylinder Master</a></li>
      <li><a href="masterreports.jsp">Master Reports</a></li>
    </ul>
  </div>
</body>
</html>
