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
   <link rel="stylesheet" href="./UserCSS/AddUser.css">
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
            <a class="adduser" href="addUserForm"><button> <span>Add User </span> </button></a><br><br>
            <a class="modifyuser" href="ModifyView"><button> <span>Modify User </span> </button></a><br>
            <a class="deleteuser" href="DeleteView"><button> <span>Delete User </span> </button></a><br>
            <a class="viewuser" href="viewUserForm"><button> <span>View User List </span> </button></a> 
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
        </nav>
    </div>
 
  <div class="operation">

 <center> <h2>Enter UserId</h2></center> <br>
 <form action="editUser1" method="post">
	Enter UserId :<input type="text"  name="userid" />
<input type="submit" value="Submit"/>
</form><br>
<form action="ModifyView1">
view All User list :<input type="submit"  name="AllUser" value="ClickHere" />
</form>
   </div>
</body>
</html>