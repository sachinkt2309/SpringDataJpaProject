<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.io.*,java.util.*,java.sql.*"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
   
    <title>User List</title>
    <link rel="stylesheet" href="./UserCSS/AddUser.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
 <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/Main_Project"
                           user="root"  password="23Sachinkt@09"/>
 
        <sql:query dataSource="${dbsource}" var="result1">
             SELECT distinct Corporate1.Corporate_Name,Corporate1.Corporate_Id from Corporate1 inner join user_setup1 on Corporate1.Corporate_Id=User_Setup1.Corporate_Id where User_Setup1.Delete_Status=0;
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
   <select style="padding:3px 20px;font-size:18px""><option><c:out value="${c.Corporate_Name}"/></option>
   <table border="1" width="144" style="margin-left:2%">
   <option><tr><th>Corporate_Id &nbsp</th><th>&nbsp UserId &nbsp</th><th>&nbsp password &nbsp</th><th>&nbsp Department &nbsp</th><th>&nbsp Address &nbsp</th><th>&nbsp Phone</th></tr></option>
   <c:forEach var="c1" items="${result2.rows}">
  <option> <tr>
   <td><c:out value="${c1.Corporate_Id}"/></td>
   <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:out value="${c1.User_ID}"/></td>
   <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:out value="${c1.User_Password}"/></td>
   <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:out value="${c1.Department}"/></td>
   <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<c:out value="${c1.Address}"/></td>
   <td>&nbsp&nbsp&nbsp&nbsp<c:out value="${c1.Phone_Number}"/></td>
   </tr></option><br>
   </c:forEach>
   </table>
   </select><br><br>
   </c:forEach>
    </div>
</div>
</nav>
</body>
</html>