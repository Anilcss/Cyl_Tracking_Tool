<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Dbconnection.Dbconnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
<title>Registration</title>
<style type="text/css">
body {
	background-color: lightblue;
	background-size: cover;
}

*[role="form"] {
	max-width: 530px;
	padding: 15px;
	margin: 0 auto;
	border-radius: 0.3em;
	background-color: #f2f2f2;
}

*[role="form"] h2 {
	font-family: 'Open Sans', sans-serif;
	font-size: 40px;
	font-weight: 600;
	color: #000000;
	margin-top: 5%;
	text-align: center;
	text-transform: uppercase;
	letter-spacing: 4px;
}
</style>

</head>
<body>
	<jsp:include page="Menu.jsp" />
	<div class="container">
		<form class="form-horizontal" role="form" action="customermaster11">
			<h2>CUSTOMER REGISTRATION</h2>
			<div class="form-group">
				<label for="comp_name" class="col-sm-3 control-label">Company
					Name</label>
				<div class="col-sm-9">
					<input type="text" name="comp_name" placeholder="Company Name"
						class="form-control" autofocus required="required">
				</div>
				
			</div>
			<div class="form-group">
				<label for="GST_no" class="col-sm-3 control-label">GST
					Number</label>
				<div class="col-sm-9">
					<input type="text" name="GST_no" placeholder="GST No"
						class="form-control" required="required">
				</div>
			</div>
			
			<div class="form-group">
				<label for="cust_name" class="col-sm-3 control-label">Customer
					Name</label>
				<div class="col-sm-9">
					<input type="text" name="cust_name" placeholder="Customer Name"
						class="form-control" autofocus required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="address" class="col-sm-3 control-label">Address</label>
				<div class="col-sm-9">
					<input type="text" name="address1" placeholder="Address"
						class="form-control" autofocus required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="address" class="col-sm-3 control-label">Address(2)</label>
				<div class="col-sm-9">
					<input type="text" name="address2" placeholder="Address"
						class="form-control" autofocus>
				</div>
			</div>
			<div class="form-group">
				<label for="email" class="col-sm-3 control-label">Email* </label>
				<div class="col-sm-9">
					<input type="email" name="email" placeholder="Email"
						class="form-control" name="email" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="phone_num" class="col-sm-3 control-label">Phone
					Number*</label>
				<div class="col-sm-9">
					<input type="number" name="phone_num" placeholder="Phone Number"
						class="form-control" required="required">
				</div>
			</div>
			<div class="form-group">
				<label for="second_phone_num" class="col-sm-3 control-label">secondary
					contact</label>
				<div class="col-sm-9">
					<input type="number" name="second_phone_num"
						placeholder="Secondary Contact" class="form-control">
				</div>
			</div>
			


			
			<button type="submit" class="btn btn-primary btn-block">Register</button>
		</form>
		<!-- /form -->
	</div>
	</body>



</html>