<%String username=(String)session.getAttribute("username");
if(username==null)
{
%>
	<p align="right"><h7><b><a href="register.jsp">LogIn/Register</a></b></h7></p>	
<% 
}
else
{
%>
	<p align="right"><h7><b>Hi <%=username %>|<a href="logout.jsp">LogOut</a></b></h7></p>
<%
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Hotels</title>
	<style>
		table 
		{
			 border-collapse: collapse;
			 width: 74%;
			 
		}
		th, td 
		{
			 padding: 6px;
			 border: 2px solid #ddd;
			 border-top-color:#D94600;
			 border-top-width:medium;
		}
		tr:hover 
		{
			 background-color:#EFEFEF;
		}
		hr 
		{
    		border: 2px solid #f1f1f1;
    		margin-bottom: 25px;
		}
		.button 
		{
		    background-color:#D94600;
		    border: none;
		    color: white;
		    padding: 9px;
		    text-align: center;
		    text-decoration:none;
		    display: inline-block;
		    font-size: 15px;
		    margin: 4px 2px;
		    cursor: pointer;
		}
		.button5 
		{
			border-radius: 50%;
		}
		
		
	</style>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
		<!-- bootstrap -->
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">      
		<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">		
		<link href="themes/css/bootstrappage.css" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="themes/css/flexslider.css" rel="stylesheet"/>
		<link href="themes/css/main.css" rel="stylesheet"/>

		<!-- scripts -->
		<script src="themes/js/jquery-1.7.2.min.js"></script>
		<script src="bootstrap/js/bootstrap.min.js"></script>				
		<script src="themes/js/superfish.js"></script>	
		<script src="themes/js/jquery.scrolltotop.js"></script>
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>
    <body>	
    <%
		Connection conn;
		ResultSet rs,rs1;
		try
		{ 	
			String driver="oracle.jdbc.driver.OracleDriver";
		    Class.forName(driver);
		    String url="jdbc:oracle:thin:@localhost:1521:XE";
		    String userid="hotelbooking";
		    String password="hotelbooking";
		    conn=DriverManager.getConnection(url,userid,password);
		    //String place="Delhi";
		    String query="select distinct(place) from ohbhotels";
		    PreparedStatement ps=conn.prepareStatement(query);
		    rs=ps.executeQuery();
	%>
	<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="Search your Hotel">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<li><a href="bookings.jsp">My Bookings</a></li>
										
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="index.jsp" class="logo pull-left"><img src="themes/images/logo1.jpg" class="site_logo" alt=""></a>
					<nav id="menu" class="pull-right">
						<ul>
							<li><a href="index.jsp">Home</a></li>					
							<li><a href="hotels.jsp">Hotels</a></li>			
							<li><a href="resorts.jsp">Resorts</a></li>
							<li><a href="blog.jsp">Blog</a></li>
							<li><a href="contact.jsp">Contact</a></li>
							<li><a href="aboutus.jsp">About Us</a></li>
						</ul>
					</nav>
				</div>
			</section>	
			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.jpg" alt="New products" >
				<h4><span>National & International Hotels</span></h4>
			</section>
			<section class="main-content">
			  <div class="row">						
				<!--<div class="span9">-->	
					<table style="background-color:#EBEBEB;" align="center">
	 					
						<%
					   		while(rs.next()==true)
					   		{
					   			String place=rs.getString("place");
					   			String query1="select count(id) from ohbhotels where place=?";
							    PreparedStatement ps1=conn.prepareStatement(query1);
							    ps1.setString(1,place);
							    rs1=ps1.executeQuery();
							    while(rs1.next()==true)
						   		{
							    	
					   			
					   	%>
						<tr>
							
	     					<td style="width:150px" align="center"><h4> Hotels in <%=rs.getString("place")%></h4><hr><strong><%=rs1.getInt(1)%> hotels</strong><br></td>
	     					<td align="center" style="width:130px"><h5>See all Hotels in <%=rs.getString("place")%></h5><br>
	     					<form action="place.jsp" method="get">
	     						<input type="hidden" name="place" value="<%=rs.getString("place")%>">
          						<input type="submit" class="button button5" name="Proceed" value="Proceed" ></td>
          					</form>
	     					
	 					</tr>
        
        				<%		}
					   		}
								conn.close();
	   						}
							catch(Exception e)
							{
								out.print(e);
							}
						%>
			</table>
    	</div>
    	<br><br><br><br>
	</section>
		<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
							<li><a href="index.jsp">Home</a></li>  
							<li><a href="aboutus.jsp">About Us</a></li>
							<li><a href="contact.jsp">Contact</a></li>
							<li><a href="bookings.jsp">My Bookings</a></li>
							<li><a href="register.jsp">LogIn/Register</a></li>							
						</ul>					
					</div>
					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="#">My Account</a></li>
							<li><a href="#">Order History</a></li>
							<li><a href="#">Wish List</a></li>
							<li><a href="#">Newsletter</a></li>
						</ul>
					</div>
					<div class="span5">
						<p class="logo"><img src="themes/images/logo1.jpg" class="site_logo" alt=""></p>
						<p></p>
						<br/>
						<span class="social_icons">
							<a class="facebook" href="#">Facebook</a>
							<a class="twitter" href="#">Twitter</a>
							<a class="skype" href="#">Skype</a>
							<a class="vimeo" href="#">Vimeo</a>
						</span>
					</div>					
				</div>	
			</section>
			<section id="copyright">
				<span>Copyright 2013 bootstrappage template  All right reserved.</span>
			</section>
		</div>
		<script src="themes/js/common.js"></script>	
    </body>
</html>
