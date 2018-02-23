<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>ReactJS + Spring Data REST</title>
    <script src="https://fb.me/react-15.0.1.js"></script>
    <script src="https://fb.me/react-dom-15.0.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <style>
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            left: 10px;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 9999;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</head>
<body>
    <div id="react"></div>

    <script src="${pageContext.request.contextPath}/resources/js/getAllEmployees.js" type = "text/babel"></script>
    <script>
	    window.onmousemove = function (e) {
	        var x = (e.clientX + 20) + 'px';
	        var y = (e.clientY + 20) + 'px';
	        $('.dropdown-content').css('left', x);
	        $('.dropdown-content').css('top', y);
	    };
    </script>
        <form:form method="POST" action="/springMVC/all" modelAttribute="employee">
        <label>Enter the Employee ID to view the employee details: </label>
        <form:input path="empId" name="empId" />
        <input type="submit" value="View">
    </form:form>
</body>
</html>