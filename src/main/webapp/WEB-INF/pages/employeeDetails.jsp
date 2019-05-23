<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>Employee Details</title>
    <script src="https://fb.me/react-15.0.1.js"></script>
    <script src="https://fb.me/react-dom-15.0.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}" id="resourcesPath">

</head>

<body>    
    <!--JSP: get the header-->
    <div class="nav-container">
            <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo" class="logoImg"></img>
                <ul>
                    <li><a href="/springMVC/">Home</a></li>
                    <li><a href="/springMVC/employee/table">1) Employee Table</a></li>
                    <li><a href="/springMVC/employee/map">2) Employee Map</a></li>
                    <li><a href="/springMVC/job/map">3) Job Map</a></li>
                </ul>
    </div>
    
    <!--JSP: view employee details-->
    <div>
        <div> Employee Id: ${empId}</div>
        <div> Name: ${empName}</div>
        <div> Tenure: ${empTenure}</div>
        <div> Status: ${empStatus}</div>
        <div> Phone: ${empPhone}</div>
        <div> Email: ${empEmail}</div>
        <div> AcctID: ${empAcctId}</div>
    </div>    
    
    <!--JSP: get the footer-->
    <div class="footer-container">
                <a href="https://spring.io/docs" class="footer-link">Spring Documentation</a>
                <a href="https://reactjs.org/" class="footer-link">ReactJS Documentation</a>
                <a href="https://docs.mongodb.com/" class="footer-link">MongoDB Documentation</a>
    </div>
</body>

</html>