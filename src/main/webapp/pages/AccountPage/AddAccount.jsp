<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>    
<!DOCTYPE html>
<head>
    <title>Account Setup</title>
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
        <form action="addAccount" modelAttribute="acc" method="post">
        <h3>Enter the following details</h3>    
            <%-- <tr><td>Corporate Id:</td><td><input type="text" name="corporateId" value="${corpid}" id="corporateId" readonly/></td></tr><br><br> --%>
       <tr><td>Choose Corporate:</td><td><select name="CorporateId" id="CorporateId" style="padding:10px 20px">&nbsp
       <c:forEach var="c" items="${result1.rows}">
       <option value="<c:out value="${c.corporate_id}" />">&nbsp&nbsp<c:out value="${c.corporate_Name}" />&nbsp&nbsp</option>
      <br><br>
       </c:forEach>
       </select></td></tr><br><br>  
            <tr><td>Account Number:</td><td><input type="number" minlength="6" maxlength="10" name="accountNumber" id="accountNumber" requried/></td></tr><br><br>  
            <tr><td>Account Name:</td><td><input type="text" name="accountName" id="accountName" requried/></td></tr><br><br> 
            <tr><td>Branch:</td><td><select name="branch" id="branch">&nbsp 
                <option>Bangalore</option> 
                <option>Chennai</option> 
                <option>Hydrabad</option> 
                <option>Mumbai</option> 
                <option>Delhi</option> 
            </select></td></tr><br><br>
            <tr><td>Currency:</td><td><select name="currency" id="currency">
                <option>Rupees</option>
                <option>Dollars</option>
                <option>Yens </option>
                <option>Pounds</option>
                <option>Euro</option>
            </select></td></tr><br><br>
            <tr><td>Available balance:</td><td><input type="number"  name="avBalance" id="availableBalance" requried/></td></tr><br><br>
            <input type="hidden"  name="status" value="Active" />
            <input style="margin-left: 18%;" type="reset" value="Reset" id="reset">
            <input style="margin-left: 7%;" type="submit" value="Submit" id="submit">
            </form>
    </div>
</div>
</nav>
</body>
</html>