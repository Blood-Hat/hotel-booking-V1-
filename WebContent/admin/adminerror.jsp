<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Error</title>
<style>
*
{
	margin:20px auto;
}
body 
{
	font-family: Arial, Helvetica, sans-serif;
}
form 
{
	border: 3px  solid #f1f1f1;
	width:700px;
}

input[type=text], input[type=password] 
{
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
button 
{
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}
button:hover 
{
    opacity: 0.8;
}
.cancelbtn 
{
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}
.container 
{
	
	width:600px;
	padding: 16px;
}
span.psw 
{
    float: right;
    padding-top: 16px;
}
/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw 
	{
       display: block;
       float: none;
    }
    .cancelbtn
	{
       width: 100%;
    }
}
</style>
</head>
<body>
<p align="left">
<a href="../index.jsp"><h3 align="center">Home</h3></a>
</p> 
<h2 align="center">Admin LogIn</h2>
<form action="adminlogindb.jsp">
  
<div class="container">
    <label for="uname"><b>UserID</b></label>
    <input type="text" placeholder="Enter UserID" name="userid" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required><br><br>
    <h7 style="color:red;">Incorrect userid or password.<br> Try again or click Forgot Password? to reset it.</h7>
    <br><br>   
    <button type="submit">Login</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
</div>

<div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="#">password?</a></span>
</div>
</form>
</body>
</html>

</body>
</html>










<%-- 
<h1>Invalid username or password</h1>
<%@ include file="adminlogin.jsp" %>
--%>
