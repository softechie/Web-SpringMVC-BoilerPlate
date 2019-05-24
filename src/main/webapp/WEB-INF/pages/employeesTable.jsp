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
    <title>1) Employee List</title>
    <script src="https://fb.me/react-15.0.1.js"></script>
    <script src="https://fb.me/react-dom-15.0.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}" id="resourcesPath">
</head>
<body>
    
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
        <h3>1) All Employees Example</h3>
        <h4>Simple JSP database calls for all employees and a single employee</h4>
        <p>The data in the table is fetched using JBCD template object and passing it through the controller.</p>
        <p>You can view specific employee details by typing in the Employee ID.</p>
        <p>It fetches the Employee details with JBCD template object and displays them on the screen.</p>
    </div>

    <form:form method="POST" action="/springMVC/employee/table" modelAttribute="employee">
        <label>Enter the Employee ID to view the employee details: </label>
        <form:input path="empId" name="empId" />
        <input type="submit" value="View">
    </form:form>
    
    <!--Add Database Access here to get rid of React-->
    <sql:setDataSource var = "snapshot" driver = "org.postgresql.Driver"
         url = "jdbc:postgresql://localhost:5432/postgres"
         user = "postgres"  password = "root"/>
        
    <!-- Build the table -->     
    <div>
        <table id="empTable" class="table table-striped">
        <thead>
            <tr>
                <th>EmpID</th>
                <th>Name</th>
                <th>Status</th>
                <th>Tenure</th>
                <th>Phone</th>
                <th>Email</th>
                <th>DOJ</th>
                <th>WL</th>
                <th>HL</th>
                <th>CL</th>
                <th>RMID</th>
                <th>RoleID</th>
                <th>VertID</th>
                <th>AcctID</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var = "row" items = "${empList}">
            <c:set var = "employee" value="${row}"/>            
            <tr>
                <%
                    String employee = pageContext.getAttribute("employee").toString();
                    String [] details = employee.split(",");
                    String empId = details[0].replace("{", "");
                    String name = details[1].replace("null", "");
                    String status = details[2].replace("null", "");
                    String tenure = details[3].replace("null", "");
                    String phone = details[4].replace("null", "");
                    String email = details[5].replace("null", "");
                    String joinDate = details[6].replace("null", "");
                    String workloc = details[7].replace("null", "");
                    String currentloc = details[8].replace("null", "");
                    String homeloc = details[9].replace("null", "");
                    String isrelocate = details[10].replace("null", "");
                    String roleId = details[11].replace("null", "");
                    String verticalId = details[12].replace("null", "");
                    String acctId = details[13].replace("}", "").replace("null", "");
                %>
               <td><c:out value = "<%=empId%>"/></td>
               <td><c:out value = "<%=name%>"/></td>
               <td><c:out value = "<%=status%>"/></td>
               <td><c:out value = "<%=tenure%>"/></td>
               <td><c:out value = "<%=phone%>"/></td>
               <td><c:out value = "<%=email%>"/></td>
               <td><c:out value = "<%=joinDate%>"/></td>
               <td><c:out value = "<%=workloc%>"/></td>
               <td><c:out value = "<%=currentloc%>"/></td>
               <td><c:out value = "<%=homeloc%>"/></td>
               <td><c:out value = "<%=isrelocate%>"/></td>
               <td><c:out value = "<%=roleId%>"/></td>
               <td><c:out value = "<%=verticalId%>"/></td>
               <td><c:out value = "<%=acctId%>"/></td>
            </tr>
         </c:forEach>
        </tbody>
        </table>
    </div>
        
    <!--JSP stuff to get the footer-->
    <div class="footer-container">
                <a href="https://spring.io/docs" class="footer-link">Spring Documentation</a>
                <a href="https://reactjs.org/" class="footer-link">ReactJS Documentation</a>
                <a href="https://docs.mongodb.com/" class="footer-link">MongoDB Documentation</a>
    </div>
    
</body>
</html>