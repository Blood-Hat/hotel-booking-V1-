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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>About Us</title>
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
		<div id="top-bar" class="container">
			<div class="row">
				<div class="span4">
					<form method="POST" class="search_form">
						<input type="text" class="input-block-level search-query" Placeholder="Search Your Hotel">
					</form>
				</div>
				<div class="span8">
					<div class="account pull-right">
						<ul class="user-menu">				
							<li><a href="cart1.jsp">Your Cart</a></li>
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
							<li><a href="./products.jsp">Resorts</a></li>
							<li><a href="blog.jsp">Blog</a></li>
							<li><a href="contact.jsp">Contact</a></li>
							<li><a href="aboutus.jsp">About Us</a></li>
						</ul>
					</nav>
				</div>
			</section>			
			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.jpg" alt="New products" >
				<h4><span>About Us</span></h4>
			</section>			
			<section class="main-content">				
				<div class="row">
					<div class="span5">					
						<h4 class="title"><span class="text"><strong>Who We</strong> Are</span></h4>
						<h5>Our team of creative and driven entrepreneurs come together to build a hotel search that is fast, intuitive and unbiased, with the longstanding mission... 
							To be the travelers first and independent source of information for finding the ideal hotel at the best rate.</h5>   
							<h5><a href="aboutus.jsp">Read more about us here</a></h5>
						<br>
						<h4 class="title"><span class="text"><strong>Our</strong> Search</span></h4>
						<h5>Our team of creative and driven entrepreneurs come together to build a hotel search that is fast, intuitive and unbiased, with the longstanding mission... 
							To be the travelers first and independent source of information for finding the ideal hotel at the best rate.</h5>   
							<h5><a href="aboutus.jsp">Read more about our search here</a></h5>
					</div>
					<br><br>
					<div class="span7">					
						<h4 class="title"><span class="text"><strong>Our</strong>  Culture</span></h4>
						<h5>At Lets Go, we do not just embrace change, we make change. In such a rapidly evolving technological environment, we know that our competitive advantage is the speed of our learning. We believe our vision, modern organizational structure and self-determined working hours keep our talents happy, motivated, productive and looking forward to coming in each morning.</h5>
						<h5><a href="aboutus.jsp">Read more about our culture here</a></h5>
						<br>
						<h4 class="title"><span class="text"><strong>Our</strong>  Search</span></h4>
						<h5>Anyone can access trivago’s fast and intuitive search, comparing over 1.8 million hotels from 180+ Online Travel Agents worldwide. Our hotel information, pictures, ratings, reviews, filters and other features are all available to help our users find their ideal hotel.</h5>
						<h5><a href="aboutus.jsp">Read more about our search here</a></h5>
					</div>		
					<br><br><br>	
				</div>
			</section>			
			<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
							<li><a href="index.jsp">Home</a></li>  
							<li><a href="aboutus.jsp">About Us</a></li>
							<li><a href="contact.jsp">Contact</a></li>
							<li><a href="cart1.jsp">Your Cart</a></li>
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
		<script>
			$(document).ready(function() {
				$('#checkout').click(function (e) {
					document.location.href = "checkout.html";
				})
			});
		</script>		
    </body>
</html>
				