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
    <!-- React stuff to get the header
    <div id="reactPageHeader"></div>
    <script src="${pageContext.request.contextPath}/resources/js/getPageHeader.js" type="text/babel"></script>
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
    
    <!-- React stuff to get fetch employee details
    <div id="reactEmployeeDetails"></div>
    <div id="hiddenEmpId" style="visibility: hidden">${empId}</div>
    <script src="${pageContext.request.contextPath}/resources/js/getEmployeeDetails.js" type="text/babel"></script>
    -->
    
    <!--JSP stuff to access the employee details in postgres DB-->
    <sql:setDataSource var = "snapshot" driver = "org.postgresql.Driver"
         url = "jdbc:postgresql://localhost:5432/postgres"
         user = "postgres"  password = "root"/>
 
    <!--Access the data using normal prepared statements
    <sql:query dataSource = "${snapshot}" var = "result">
         Select EMPID, NAME,STATUS,TENURE,PHONE,EMAIL,JOINING_DATE,WORKLOC,CURRENTLOC,HOMELOC,ISRELOCATE,ROLEID,VERTICALID,ACCOUNTID from information_schema.employee where EMPID = ?::integer;
         <sql:param value = "${empId}" />
    </sql:query>
    -->
    
    <!--Access the stored procedure-->
    <sql:query dataSource = "${snapshot}" var= "result">
        SELECT get_employee(?::integer);
        <sql:param value = "${empId}" />
    </sql:query>
    
        
    <c:set var="employee" value="${result.rows[0]}"/>
    <%
        String employee = pageContext.getAttribute("employee").toString();
        String [] details = employee.split(",");
        String name = details[1].replace("\"", "").replace("\'", "");
        String status = details[2].replace("\"", "").replace("\'", "");
        String tenure = details[3].replace("\"", "").replace("\'", "");
        String phone = details[4].replace("\"", "").replace("\'", "");
        String email = details[5].replace("\"", "").replace("\'", "");
        String acctid = details[13].replace(")", "").replace("}", "").replace("\"", "").replace("\'", "");;
    %>
    
    <!--JSP stuff to view employee details-->
    <div key = "${empId}">
        <div> Employee Id: <c:out value ="${empId}"/> </div>
        <div> Name: <c:out value ="<%=name%>"/> </div>
        <div> Tenure: <c:out value ="<%=tenure%>"/> </div>
        <div> Status: <c:out value ="<%=status%>"/> </div>
        <div> Phone: <c:out value="<%=phone%>"/> </div>
        <div> Email: <c:out value="<%=email%>"/> </div>
        <div> AcctID: <c:out value="<%=acctid%>"/> </div>
    </div>
        
    <!-- React stuff to get the page footer
    <div id="reactPageFooter"></div>
    <script src="${pageContext.request.contextPath}/resources/js/getPageFooter.js" type="text/babel"></script>
    -->
    
    <!--JSP stuff to get the footer-->
    <div class="footer-container">
                <a href="https://spring.io/docs" class="footer-link">Spring Documentation</a>
                <a href="https://reactjs.org/" class="footer-link">ReactJS Documentation</a>
                <a href="https://docs.mongodb.com/" class="footer-link">MongoDB Documentation</a>
    </div>
</body>

</html>