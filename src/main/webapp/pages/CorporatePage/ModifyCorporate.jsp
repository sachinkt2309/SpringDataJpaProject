<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.io.*,java.util.*,java.sql.*"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
    <title>Corporate List</title>
    <link rel="stylesheet" href="./CorporateCSS/viewCorporate.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
       
<div class="mainpage">
        <nav class="navbar">
    <div id="Optionbar">
        <a href="HomePage">Home</a>
        <a href="addCorporateForm">Corporate Setup</a>
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
    
    <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/Main_Project"
                           user="root"  password="23Sachinkt@09"/>
                           
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from Corporate1 where Corporate_Id=?;
            <sql:param value="${param.corporateid}" />
        </sql:query>
        
    <div class="operation">
 		<c:forEach items="${result.rows}"  var="c" >
            <form action="editCorporate"  modelAttribute="editCorForm">
            <caption>Enter only Address And Phone Number</caption> <br><br>
         <table border="2" width="40%">
               <td> <input type="hidden" name="id" value="<c:out value="${c.CorporateId}"/>" />  </td>
            <tr><th>CorporateId</th>
             <th><input type="text" value="<c:out value="${c.Corporate_Id}"/>" name="corporateId" readonly /></th>
             <tr><th>CorporateName</th>
             <th><input type="text" value="<c:out value="${c.Corporate_Name}"/>" name="corporateName" readonly/></th>
            <tr><th>Address</th>
            <th><input type="text" value="<c:out value="${c.Address}"/>" name="Address"/></th> 
            </tr>
            <tr><th>PhoneNumber</th>
            <th><input type="tel" value="<c:out value="${c.Phone_Number}"/>" name="PhoneNumber" minlength="10" maxlength="10"/></th>
            </tr>
            <tr>
            <td><input style="margin-left: 100%; padding:4px 20px" type="submit" value="Update" id="submit"></td><br>       
            </tr>
          </c:forEach>  
            </table>
            </form>
            
 </div>
</body>
</html>