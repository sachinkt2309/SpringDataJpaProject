<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.io.*,java.util.*,java.sql.*"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Setup</title>
    <link rel="stylesheet" href="./UserCSS/AddUser.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/Main_Project"
                           user="root"  password="23Sachinkt@09"/>
 
        <sql:query dataSource="${dbsource}" var="result1">
             SELECT distinct Corporate1.Corporate_Name,Corporate1.Corporate_Id from Corporate1 inner join user_setup1 on Corporate1.Corporate_Id=User_setup1.Corporate_Id where User_setup1.Delete_Status=0;
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
            <a class="adduser" href="addUserForm"><button> <span>Add User </span> </button></a><br><br>
            <a class="modifyuser" href="ModifyView"><button> <span>Modify User </span> </button></a><br>
            <a class="deleteuser" href="DeleteView"><button> <span>Delete User </span> </button></a><br>
            <a class="viewuser" href="viewUserForm"><button> <span>View User List </span> </button></a> 
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
        </nav>
    </div>
   
    <div class="operation">
       <center> <h2>List Of Users</h2></center> <br>
       <c:forEach var="c" items="${result1.rows}">
       <sql:query dataSource="${dbsource}" var="result2">
            SELECT * from User_setup1 where Corporate_Id=<c:out value="${c.Corporate_Id}" /> and Delete_Status=0;
            
        </sql:query>
        <select><option>&nbsp&nbsp<c:out value="${c.Corporate_Name}"/>&nbsp&nbsp</option></select>
   <table border="1" width="144" style="margin-left:2%">
   <option><tr><th>CorporateId &nbsp</th><th>&nbsp UserId &nbsp</th><th>&nbsp password &nbsp</th><th>&nbsp Department &nbsp</th><th>&nbsp Address &nbsp</th><th>&nbsp Phone &nbsp</th><th>&nbsp Action</th></tr></option>
   <c:forEach var="c1" items="${result2.rows}">
   <option>
   <td><c:out value="${c1.Corporate_Id}"/></td>
   <td><c:out value="${c1.User_ID}"/></td>
   <td><c:out value="${c1.User_Password}"/></td>
   <td><c:out value="${c1.Department}"/></td>
   <td><c:out value="${c1.Address}"/></td>
   <td><c:out value="${c1.Phone_Number}"/></td>
   <td><a style="color:red;" href="deleteUsr?userid=<c:out value="${c1.User_ID}" />">Delete</a></td>
   </tr></option >
   </c:forEach>
   </table>
   </c:forEach>
    </div>
</div>
</nav>
</body>
</html>