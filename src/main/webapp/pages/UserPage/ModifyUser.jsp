<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.io.*,java.util.*,java.sql.*"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Modify User</title>
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
     <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/Main_Project"
                           user="root"  password="23Sachinkt@09"/>
                           
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from User_setup1 where User_ID=? and Delete_Status=0;
            <sql:param value="${param.userid}" />
        </sql:query>
        
        <div class="operation">
 		<c:forEach items="${result.rows}"  var="c" >
            <form action="EditUser" modelAttribute="editUsrForm">
            <caption>Enter Department, Address And Phone Number only</caption> <br><br>
         <table border="2" width="40%">
               <td> <input type="hidden" name="usrid" value="<c:out value="${c.User_ID}"/>"/> </td>
             <%--  <td> <input type="hidden" name="userCount" value="${userco}"/> </td> --%>
            <tr><th>CorporateId</th>
             <th><input type="text" value="<c:out value="${c.Corporate_Id}"/>" name="corporateId" readonly /></th>
             <tr><th>UserId</th>
             <th><input type="text" value="<c:out value="${c.User_ID}"/>" name="UserId" readonly/></th>
             <tr><th>Password</th>
             <th><input type="text" value="<c:out value="${c.User_Password}"/>" name="userPassword" readonly/></th>
             <tr><th>Department</th>
             <th><input type="text" value="<c:out value="${c.Department}"/>" name="department" required/></th>
            <tr><th>Address</th>
            <th><input type="text" value="<c:out value="${c.Address}"/>" name="Address" required/></th> 
            </tr>
            <tr><th>PhoneNumber</th>
            <th><input type="tel" value="<c:out value="${c.Phone_Number}"/>" name="PhoneNumber" minlength="10" maxlength="10" required/></th>
            </tr>
            <tr>
            <td><input style="margin-left: 100%; padding:4px 20px" type="submit" value="Update" id="submit"/></td><br>
            </tr>
          </c:forEach>  
            </table>
            </form>
            
 </div>
</body>
</html>