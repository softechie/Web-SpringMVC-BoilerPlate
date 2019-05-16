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
                
    <canvas id="myCanvas" height=90% width=90% style="border:1px solid #d3d3d3; margin-left: auto; margin-right: auto; display: block;"></canvas>
    <script>
        //set the global variables
        var canvas = document.getElementById('myCanvas');
        var context = canvas.getContext('2d');
        var circles = [];
        var nodes = [];
        var scale = 80;
        var nodeLineCount = 0;
        var nodeX = 0;
        var nodeY = 1;
        var nodeDirection = "right";
        var nodeRadius = 10;
        var nodeLineWidth = 3;
        //var employees = ;
        
        //Draw Grid
        context.fillStyle="#000";
        context.canvas.width = window.innerWidth-(window.innerWidth*.1);
        context.canvas.height = window.innerHeight-(window.innerHeight*.1);
        context.beginPath();
        var height = window.innerHeight*scale;
        var width = window.innerWidth*scale;
        var counter = 0;
        for (var x = .5; x < width; x+=scale) {
            context.moveTo(x,0);
            if (counter<10)
                context.fillText(counter++,x-9,10);
            else if (counter<100)
                context.fillText(counter++,x-13,10);
            else if (counter<1000)
                context.fillText(counter++,x-16,10);
            context.moveTo(x,0);
            context.lineTo(x,height);
        }
        context.moveTo(width-.5,0);
        context.lineTo(width-.5, 50);
        counter =0;
        for (var y=.5; y < height; y+=scale) {
            context.moveTo(0,y);
            context.fillText(counter++,0,y-8);
            context.moveTo(0,y);
            context.lineTo(height,y);
        }
        context.moveTo(0, height-.5);
        context.lineTo(width, height-.5);
        context.strokeStyle = "#eee";
        context.lineWidth = 1;
        context.stroke();
        context.fill();
        context.closePath();
        
        //Handle the user hovering over a particular node
        //Display a dropdown content box with the relevant information
        //that follows the users mouse
        canvas.onmousemove = function (e) {
            for (var i=0; i<circles.length; i++) {
                $('#'+circles[i].id+'-content').css('display', 'none');
            }
            var rect = canvas.getBoundingClientRect(),
            x = e.clientX - rect.left,
            y = e.clientY - rect.top,
            i = 0, circle;
            while(circle = circles[i++]) {
                context.beginPath();
                context.arc(circle.x, circle.y, circle.radius, 0, 2*Math.PI);
                if (context.isPointInPath(x, y)) {
                    $('#'+circle.id+'-content').css('left', x+80+"px");
                    $('#'+circle.id+'-content').css('top', y+150+"px");
                    $('#'+circle.id+'-content').css('display', 'block');
                    break;
                }
            }
        };
    </script>
    
    <!--React stuff needed to draw the grid
    <div id="reactEmployeesMap"></div>
    <script src="${pageContext.request.contextPath}/resources/js/getEmployeesMap.js" type = "text/babel"></script>
    -->    
    
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