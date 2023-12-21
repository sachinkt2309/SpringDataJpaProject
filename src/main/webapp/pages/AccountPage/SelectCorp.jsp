<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*,java.util.*,java.sql.*"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Corporate</title>
 <link rel="stylesheet" href="./AccountCSS/AddAccount.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
 <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/Main_Project"
                           user="root"  password="23Sachinkt@09"/>
 
        <sql:query dataSource="${dbsource}" var="result1">
             SELECT Corporate_Name,Corporate_Id from Corporate1 where Delete_Status=0;
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
            <a style="display: block;margin-top: 9%; margin-left: 19%;" class="addaccount" href="addAccountForm"><button> <span>Add Account </span> </button></a><br><br>
            <a style="display: block;margin-top: 16%; margin-left: 15%;" class="closeaccount" href="accountDeleteView"><button> <span>Close Account </span> </button></a><br>
            <a style="display: block;margin-top: 20%; margin-left: 9%;margin-bottom:36%;" class="viewaccount" href="AccountView"><button> <span>View Account List </span> </button></a> 
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
        </nav>
    </div>
     <div class="operation">
       <center> <h2>Choose Corporate to add User</h2></center> <br>
       <c:forEach var="c" items="${result1.rows}">
       <table border="1" width="144" style="margin-left:2%">
       <button style="margin-left:20px;padding:10px 50px;color:white;"><a style="font-weight:bold;font-size:30px " href="AddnewAccount?corporateId=<c:out value="${c.Corporate_Id}" />"> <c:out value="${c.Corporate_Name}" /></a> </button>
      <br><br>
       </c:forEach>
</body>
</html>