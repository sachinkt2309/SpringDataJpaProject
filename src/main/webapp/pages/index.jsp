<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
 <link rel="stylesheet" href="CSS FILEs/Homepage.css">
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
</nav>
    <div class="messagebox" id="messagebox">
        <p style="font-size:30px">
        Welcome Smartbank Back Office</p>
    </div>
    <div id="options">
        
        <a class="Accbutton" href="addAccountForm"><button> <span>Account Setup </span> </button></a><br><br>
        <a class="Copbutton" href="viewCorporateList"><button><span>Corporate Setup</span></button></a>
        <a class="Usebutton" href="viewUserForm"><button><span>User Setup</span></button></a><br><br><br>
        <a class="Cplistbutton" href="viewCorporate.jsp"><button><span>View Corporate List</span></button></a>
        <a class="Userlistaccbutton" href="UserPage/ViewUser.jsp"><button><span>View User List</span></button></a>
    </div>
</div>

</body>
</html>