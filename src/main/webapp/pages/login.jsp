<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <title>Bank Login Page</title>
    <link href="./CSS FILEs/Login.css" rel="stylesheet" type="text/css">  
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"  type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="form-group">
            <!-- Form start -->
            <form action="login" method="post">
                <h1> LOGIN HERE </h1><br>
                  <label>User ID : </label>
                  <input type="text" class="form-control" id="AdminId" name="username">
                  <label>Password :</label>
                  <input type="password" class="form-control" name="password" id="Password" ><br><br>
                	<input type="reset" value="reset" class="reset">
                  <input type="submit" value="submit" class="submit">
            
              </form>
</body>
</html>