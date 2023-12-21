<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%--  <%@page import="com.corporate.CorporateDao,com.corporate.Corporate"%> --%>
    <!DOCTYPE html>
  <%@page import="java.io.*,java.util.*,java.sql.*"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>

    <title>CorporateList</title>
   <link rel="stylesheet" href="CorporateCSS/viewCorporate.css"> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
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

 <center> <h2>Enter Id of Corporates </h2></center> <br>
 <form action="editCorp1" method="post">
	Enter Corporate Id :<input type="text"  name="corporateid" />
<input type="submit" value="Submit"/>
</form><br>
<form action="modifyViewList1">
view All Corporate list :<input type="submit"  name="AllCorporate" value="Click Here" />
</form>
   </div>
</body>
</html>