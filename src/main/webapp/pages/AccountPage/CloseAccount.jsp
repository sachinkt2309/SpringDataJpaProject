<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.io.*,java.util.*,java.sql.*"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
    <title>Account List</title>
    <link rel="stylesheet" href="./AccountCSS/AddAccount.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
  <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/Main_Project"
                           user="root"  password="23Sachinkt@09"/>
 
        <sql:query dataSource="${dbsource}" var="result1">
            SELECT distinct Corporate1.Corporate_Name,Corporate1.Corporate_Id from Corporate1 inner join Account1 on Corporate1.Corporate_Id=Account1.Corporate_Id where Account1.Status="Active";
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
             <nav>
            <a style="display: block;margin-top: 9%; margin-left: 19%;" class="addaccount" href="addAccountForm"><button> <span>Add Account </span> </button></a><br><br>
            <a style="display: block;margin-top: 16%; margin-left: 15%;" class="accountDeleteView" href="accountDeleteView">CloseAccount<button> <span>Close Account </span> </button></a><br>
            <a style="display: block;margin-top: 20%; margin-left: 9%;margin-bottom:36%;" class="viewaccount" href="AccountView"><button> <span>View Account List </span> </button></a> 
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
        </nav>
    </div>
 
  <div class="operation">

 <center> <h2>List Of Accounts</h2></center> <br>
 <c:forEach var="c" items="${result1.rows}">
  <sql:query dataSource="${dbsource}" var="result2">
            SELECT * from Account1 where Corporate_Id=<c:out value="${c.Corporate_Id}"/> and Status="Active";    
        </sql:query>
  
   <select><option>&nbsp&nbsp<c:out value="${c.Corporate_Name}" />&nbsp&nbsp</option></select>
   <table border="1" width="144" style="margin-left:2%">
   <option><tr><th>CorporateId&nbsp</th><th>&nbsp AccNumber &nbsp</th><th>&nbsp AccName &nbsp</th><th>&nbsp Currancy &nbsp</th>
   <th>&nbspBranch</th><th>&nbspAvalBalance</th><th>Action</th></tr><option>
   <c:forEach var="c1" items="${result2.rows}"> 
   <option >
   <td><c:out value="${c1.Corporate_Id}"/></td>
   <td><c:out value="${c1.Account_Number}"/></td>
   <td><c:out value="${c1.Account_Name}"/></td>
   <td><c:out value="${c1.Currency}"/></td>
   <td><c:out value="${c1.Branch}"/></td>
   <td><c:out value="${c1.Av_balance}"/></td>
   <td><a style="text-decoration: none;color:red" href="DeleteAccount?accountnumber=<c:out value="${c1.Account_Number}"/>">Close Account</a></td>
    </tr></option >
   </c:forEach>
</table>
 </c:forEach>
   </div>
</body>
</html>