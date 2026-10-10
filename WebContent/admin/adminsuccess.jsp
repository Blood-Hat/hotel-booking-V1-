<%String userid3=(String)session.getAttribute("userid2");
if(userid3==null)
{
	response.sendRedirect("adminlogin.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AdminSuccessPage</title>
<style>
		body 
		{
		    font-family: Arial, Helvetica, sans-serif;
		}
		
		* 
		{
		    box-sizing: border-box;
		}
		
		/* Add padding to containers */
		.container 
		{
		    padding: 20px;
		    background-color: white;
		}
		/* Overwrite default styles of hr */
		hr 
		{
		    border: 2px solid #f1f1f1;
		    margin-bottom: 25px;
		}
		a
		{
			color: dodgerblue;
		}
		/* unvisited link */
		/*a:link 
		{
		    color: dodgerblue;
		}*/
		
		/* visited link */
		/*a:visited 
		{
		    color: green;
		}*/
		
		/* mouse over link */
		a:hover 
		{
		    color: hotpink;
		}
		
		/* selected link */
		a:active 
		{
		    color: blue;
		}
		
		/* Set a grey background color and center the text of the "sign in" section */
		.signin 
		{
		    background-color: #f1f1f1;
		    text-align: center;
		}
</style>
</head>

<body>
 <div class="container">
    <h2 align="center">Welcome <%=userid3 %></h2>
    <hr>
    <div class="container signin">
    	<a href="addhotel.jsp"><h3 align="center">Add Hotels</h3></a>
	 	<a href="showhotel.jsp"><h3 align="center">Show all Hotels</h3></a>
	 	<a href="showbookedrooms.jsp"><h3 align="center">Show all Booked Rooms</h3></a><br><br><br>
	 	<a href="addresort.jsp"><h3 align="center">Add Resorts</h3></a>
	 	<a href="showresort.jsp"><h3 align="center">Show all Resorts</h3></a><br><br>
	 	<a href="adminlogout.jsp"><h4 align="right">LogOut</h4></a>
  	</div>
  </div>
</body>
</html>