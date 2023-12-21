<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Corporate Setup</title>
    <link rel="stylesheet" href="CorporateCSS/AddCorporate.css">
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
   
    <div class="operation" style="z-index: 1">
        <form action="addCorporate" modelAttribute="cor">
            <h3>Enter the following details</h3> 
            <br>      
            <tr><td>Corporate Name:</td><td><input type="text" name="CorporateName" id="corporateName" required/></td></tr><br><br>
            <td>Address: <input type="text"name="Address" id="address" required/></td><br><br>
            <td>Phone Number: <input type="tel"name="PhoneNumber" minlength="10" maxlength="10" id="phoneNumber" required/></td></tr><br><br>
            <input type="hidden" name="DeleteStatus" value="0"/>
            <input style="margin-left: 17%;" type="reset" value="Reset" id="reset">
            <input style="margin-left: 7%;" type="submit" value="Submit" id="submit">
            </form>
    </div>
</div>
</nav>
</body>
</html>