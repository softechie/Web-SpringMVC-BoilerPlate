<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Employee Details</title>
	<script src="https://fb.me/react-15.0.1.js"></script>
    <script src="https://fb.me/react-dom-15.0.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}" id="resourcesPath">
</head>
<body>
	<div id="reactPageHeader"></div>
    <script src="${pageContext.request.contextPath}/resources/js/getPageHeader.js" type="text/babel"></script>

	<div>
		<div>Employee ID: ${employee.empId}</div>
		<div>Name: ${employee.name}</div>
		
		<c:choose>
			<c:when test = "${employee.status == 'Onboarding Completed'}">
				<div style="background-color:#70f441;">Status: ${employee.status}</div>
			</c:when>
			<c:when test = "${employee.status == 'Onboarding In Progress'}">
				<div style="background-color:#f4dc42;">Status: ${employee.status}</div>
			</c:when>
			<c:when test = "${employee.status == 'Onboarding Cancelled'}">
				<div style="background-color:#f45f41;">Status: ${employee.status}</div>
			</c:when>
		</c:choose>
		<div>Tenure: ${employee.tenure} </div>
		<div>Phone number: ${employee.phone}</div>
		<div>Email: ${employee.email}</div>
	</div>
	
	<div id="reactPageFooter"></div>
    <script src="${pageContext.request.contextPath}/resources/js/getPageFooter.js" type="text/babel"></script>
</body>
</html>