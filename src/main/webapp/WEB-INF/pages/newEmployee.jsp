<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert New Employee</title>
	<script src="https://fb.me/react-15.0.1.js"></script>
    <script src="https://fb.me/react-dom-15.0.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}" id="resourcesPath">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<body>
	<div id="reactPageHeader"></div>
    <script src="${pageContext.request.contextPath}/resources/js/getPageHeader.js" type="text/babel"></script>

	<div class="container">
		<h1>New Employee Information</h1>
		<form method="POST" style="width:300px">
		
		<div class="form-group">
			<label for="employee_empId">Employee ID</label>
			<form:input class="form-control" path="employee.empId" placeholder="1234"/>
		</div>
		<div class="form-group">
			<label for="employee_name">Name</label>
			<form:input class="form-control" path="employee.name" placeholder="John Doe"/>
		</div>
		<div class="form-group">
			<label for="employee_status">Status</label>
			<form:select class="form-control" path="employee.status">
			<form:option value="Onboarding Completed" label="Onboarding Completed"/>
			<form:option value="Onboarding In Progress" label="Onboarding In Progress"/>
			<form:option value="Onboarding Cancelled" label="Onboarding Cancelled"/>
			</form:select> 
		</div>
		<div class="form-group">
			<label for="employee_tenure">Tenure</label>
			<form:input class="form-control" path="employee.tenure" placeholder="$90000"/>
		</div>
		<div class="form-group">
			<label for="employee_phone">Phone</label>
			<form:input class="form-control" path="employee.phone" placeholder="5555555555"/>
		</div>
		<div class="form-group">
			<label for="employee_email">Email</label>
			<form:input class="form-control" path="employee.email" placeholder="jdoe@gmail.com"/>
		</div>
			<input class="btn btn-success" type="submit" value="Add" />
		</form>
	</div>
	
	<div id="reactPageFooter"></div>
    <script src="${pageContext.request.contextPath}/resources/js/getPageFooter.js" type="text/babel"></script>
</body>
</html>