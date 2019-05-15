<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>2) Employee Map</title>
    <script src="https://fb.me/react-15.0.1.js"></script>
    <script src="https://fb.me/react-dom-15.0.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}" id="resourcesPath">
</head>
<body>
    
    <!-- React Stuff to get the header
    <div id="reactPageHeader"></div>
    <script src="${pageContext.request.contextPath}/resources/js/getPageHeader.js" type = "text/babel"></script>
    -->
    
    <!--JSP stuff to get the header-->
    <div class="nav-container">
            <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo" class="logoImg"></img>
                <ul>
                    <li><a href="/springMVC/">Home</a></li>
                    <li><a href="/springMVC/employee/table">1) Employee Table</a></li>
                    <li><a href="/springMVC/employee/map">2) Employee Map</a></li>
                    <li><a href="/springMVC/job/map">3) Job Map</a></li>
                </ul>
    </div>
    
    <div class="info">
        <h3>2) Employee Map Example</h3>
        <h4>ReactJS View, with MongoDB model, and REST API</h4>
        <p>The view is a canvas that is manipulated through ReactJS</p>
        <p>ReactJS draws a grid, nodes and connecting lines</p>
        <p>Hidden employee information corresponds to each node, that shows when the user hovers, and uses JQuery to follow the user mouse</p>
    </div>
    
    <div id="reactEmployeesMap"></div>
    <canvas id="myCanvas" height=90% width=90% style="border:1px solid #d3d3d3; margin-left: auto; margin-right: auto; display: block;"></canvas>
    <script src="${pageContext.request.contextPath}/resources/js/getEmployeesMap.js" type = "text/babel"></script>
    
    
    <!-- React stuff to get the footer
    <div id="reactPageFooter"></div>
    <script src="${pageContext.request.contextPath}/resources/js/getPageFooter.js"></script>
    -->
    
    <!--JSP stuff to get the footer-->
    <div class="footer-container">
                <a href="https://spring.io/docs" class="footer-link">Spring Documentation</a>
                <a href="https://reactjs.org/" class="footer-link">ReactJS Documentation</a>
                <a href="https://docs.mongodb.com/" class="footer-link">MongoDB Documentation</a>
    </div>
</body>
</html>