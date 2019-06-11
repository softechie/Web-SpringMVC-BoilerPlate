<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert New File</title>
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
		<form method="POST" style="width:300px">
		
		<div class="form-group">
			<label for="file_name">File Name</label>
			<form:input class="form-control" path="file.name" placeholder="file1"/>
		</div>
		<div class="form-group">
			<label for="file_recordCount">Record Count</label>
			<form:input class="form-control" path="file.recordCount" placeholder="1200"/>
		</div>
		<div class="form-group">
			<label for="file_seqNo">Seq No.</label>
			<form:input class="form-control" path="file.seqNo" placeholder="100"/>
		</div>
		<div class="form-group">
			<label for="file_sourceSysName">Source System Name</label>
			<form:input class="form-control" path="file.sourceSysName" placeholder="System A"/>
		</div>
		<div class="form-group">
			<label for="file_arrivalTime">Arrival Time</label>
			<form:input class="form-control" path="file.arrivalTime" placeholder="10:00"/>
		</div>
		<div class="form-group">
			<label for="file_startTime">Start Time</label>
			<form:input class="form-control" path="file.startTime" placeholder="11:00"/>
		</div>
		<div class="form-group">
			<label for="file_completeTime">Completion Time</label>
			<form:input class="form-control" path="file.completeTime" placeholder="11:00"/>
		</div>
		<div class="form-group">
			<label for="file_status">Status</label>
			<form:select class="form-control" path="file.status">
			<form:option value="Completed" label="Completed"/>
			<form:option value="Running" label="Running"/>
			<form:option value="Refused" label="Refused"/>
			</form:select> 
		</div>
		<div class="form-group">
			<label for="file_record">Processing Record</label>
			<form:input class="form-control" path="file.record" placeholder="200"/>
		</div>
		<div class="form-group">
			<label for="file_priority">Priority</label>
			<form:input class="form-control" path="file.priority" placeholder="1"/>
		</div>
			<input class="btn btn-success" type="submit" value="Add" />
		</form>
	</div>
	
	<div id="reactPageFooter"></div>
    <script src="${pageContext.request.contextPath}/resources/js/getPageFooter.js" type="text/babel"></script>
</body>
</html>