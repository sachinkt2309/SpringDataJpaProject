<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.io.*,java.util.*,java.sql.*"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
    <title>CorporateList</title>
    <link rel="stylesheet" href="./CorporateCSS/viewCorporate.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
  <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/Main_Project"
                           user="root"  password="23Sachinkt@09"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from Corporate1 where Delete_Status=0;
            
        </sql:query>
<div class="mainpage">
        <nav class="navbar">
    <div id="Optionbar">
        <a href="HomePage">Home</a>
        <a href="viewCorporateList">Corporate Setup</a>
        <a href="viewUserForm">User Setup</a>
        <a href="AccountView">Account Setup</a>
        <a href="">User Profile</a>
        <a href="logout">Logout</a>
    </div>
    <div class="menu">
        <nav>
            <a class="addcorp" href="addCorporateForm"><button> <span>Add Corporate </span> </button></a><br><br>
            <a class="modifycorp" href="modifyViewList"><button> <span>Modify Corporate </span> </button></a><br>
            <a class="deletecorp" href="deleteViewList"><button> <span>Delete Corporate </span> </button></a><br>
            <a class="viewcorp" href="viewCorporateList"><button> <span>View Corporate List </span> </button></a> 
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
        </nav>
    </div>
 
  <div class="operation">
   
  <center> <h2>Select Corporate to Delete</h2></center> <br>
   <table border="2" width="80%" style="margin-left:2%">
   <tr><th>Corporate Id</th><th>CorporateName</th><th>Address</th><th>Phone</th><th>Action</th>
   </tr>
   <c:forEach var="c" items="${result.rows}">
   <tr>
   <td><c:out value="${c.Corporate_Id}"/></td>
   <td><c:out value="${c.Corporate_Name}"/></td>
   <td><c:out value="${c.Address}"/></td>
   <td><c:out value="${c.Phone_Number}"/></td>
   <td><a style="color:red;" href="deleteCorporate?corporateid=<c:out value="${c.Corporate_Id}" />">Delete</a></td>
   </tr>
   </c:forEach>
</table>
   </div>
</body>
</html>