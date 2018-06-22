<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">

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
		
		
		<div id="details"></div>
	
	
	<script type="text/babel">
	class ViewEmployee extends React.Component {
    	render() {   

		var color;
		var status = "${employee.status}";
		switch(status){
			case "Onboarding Completed": color = "#70f441"; break;
			case "Onboarding In Progress": color = "#f4dc42"; break;
			case "Onboarding Cancelled": color = "#f45f41"; break;
		}

				return (
            			<div>
            				<div>Employee ID: ${employee.empId}</div>
							<div>Name: ${employee.name}</div>
							<div>Tenure: ${employee.tenure}</div>
							<div>Phone Number: ${employee.phone}</div>
							<div>Email: ${employee.email}</div>
							<div style={{backgroundColor: color}}>Status: ${employee.status}</div>
            			</div>

					);
		}

	};
ReactDOM.render(
    <ViewEmployee />,
    document.getElementById('details')
);
	</script>
  
	<div id="reactPageFooter"></div>
    <script src="${pageContext.request.contextPath}/resources/js/getPageFooter.js" type="text/babel"></script>
</body>
</html>