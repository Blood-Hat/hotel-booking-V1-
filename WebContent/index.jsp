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
		<title>Let's Go</title>
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
							<li><a href="bookings.jsp">My Bookings</a></li>
									
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="wrapper" class="container">
			<section class="navbar main-menu">
				<div class="navbar-inner main-menu">				
					<a href="index.jsp" class="logo pull-left" ><img src="themes/images/logo1.jpg" class="site_logo" alt=""></a>
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
			<section  class="homepage-slider" id="home-slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<img src="themes/images/carousel/banner-1.jpg" alt="" />
                            <div class="intro">
								<h1>LUXURY HOTELS</h1>
								<p><span>Reserve Room for Family Vacation</span></p>
							</div>
						</li>
						<li>
							<img src="themes/images/carousel/banner-2.jpg" alt="" />
							<div class="intro">
								<h1>HERITAGE HOTELS</h1>
								<p><span>Make your Vacation comfortable</span></p>
							</div>
						</li>
                        <li>
							<img src="themes/images/carousel/banner-3.jpg" alt="" />
							<div class="intro">
								<h1>BUDGET HOTELS</h1>
								<p><span>A Best Place to enjoy your Life</span></p>
							</div>
						</li>
					</ul>
				</div>			
			</section>
			<h4 align="center">Welcome to Lets Go!</h4>
			<section class="header_text">
				Our team of creative and driven entrepreneurs come together to build a hotel search that is fast, intuitive and unbiased, with the longstanding mission...
			<br/>To be the travelers first and independent source of information for finding the ideal hotel at the best rate.
			</section>
			<section class="main-content">
				<div class="row">
					<div class="span12">													
						<div class="row">
							<div class="span12">
								<h4 class="title">
									<span class="pull-left"><span class="text"><span class="line">National <strong>Hotels</strong></span></span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
									</span>
								</h4>
								<div id="myCarousel" class="myCarousel carousel slide">
									<div class="carousel-inner">
										<div class="active item">
											<ul class="thumbnails">												
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="place.jsp?place=Delhi"><img src="themes/images/ladies/1.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Delhi" class="title">Hotels in Delhi</a><br/><br/>
														<!--  <a href="place.jsp?place=Delhi" class="category">2 Hotels</a>
														<p class="price">Avg. Rs</p> -->
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="place.jsp?place=Mumbai"><img src="themes/images/ladies/2.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Mumbai" class="title">Hotels in Mumbai</a><br/><br/>
														<!--  <a href="place.jsp?place=Mumbai" class="category">4 Hotels</a>
														<p class="price">Avg. Rs</p> -->
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="place.jsp?place=Kolkata"><img src="themes/images/ladies/3.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Kolkata" class="title">Hotels in Kolkata</a><br/><br/>
														<!--  <a href="products.jsp" class="category">3 Hotels</a>
														<p class="price">Avg. Rs</p> -->
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="place.jsp?place=Jaipur"><img src="themes/images/ladies/4.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Jaipur" class="title">Hotels in Jaipur</a><br/><br/>
														<!--  <a href="products.jsp" class="category">5 Hotels</a>
														<p class="price">Avg. Rs</p> -->
													</div>
												</li>
											</ul>
										</div>
										<div class="item">
											<ul class="thumbnails">
												<li class="span3">
													<div class="product-box">
														<p><a href="place.jsp?place=Bengaluru"><img src="themes/images/ladies/5.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Bengaluru" class="title">Hotels in Bengaluru</a><br/><br/>
														<!--  <a href="products.jsp" class="category">10 Hotels</a>
														<p class="price">Avg. Rs</p> -->
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="place.jsp?place=Kerala"><img src="themes/images/ladies/6.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Kerala" class="title">Hotels in Kerala</a><br/><br/>
														<!--  <a href="products.jsp" class="category">20 Hotels</a>
														<p class="price">Avg. Rs</p> -->
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="place.jsp?place=Pondicherry"><img src="themes/images/ladies/7.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Pondicherry" class="title">Hotels in Pondicherry</a><br/><br/>
														<!--  <a href="products.jsp" class="category">9 Hotels</a>
														<p class="price">Avg. Rs</p> -->
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="place.jsp?place=Mysore"><img src="themes/images/ladies/8.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Mysore" class="title">Hotels in Mysore</a><br/><br/>
														<!--  <a href="products.jsp" class="category">2 Hotels</a>
														<p class="price">Avg. Rs</p> -->
													</div>
												</li>																																	
											</ul>
										</div>
									</div>							
								</div>
							</div>						
						</div>
						<br/>
						<div class="row">
							<div class="span12">
								<h4 class="title">
									<span class="pull-left"><span class="text"><span class="line">International <strong>Hotels</strong></span></span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel-2" data-slide="prev"></a><a class="right button" href="#myCarousel-2" data-slide="next"></a>
									</span>
								</h4>
								<div id="myCarousel-2" class="myCarousel carousel slide">
									<div class="carousel-inner">
										<div class="active item">
											<ul class="thumbnails">												
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="place.jsp?place=Dubai"><img src="themes/images/cloth/bootstrap-women-ware2.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Dubai" class="title">Hotels in Dubai</a><br/><br/>
														<!--  <a href="products.jsp" class="category">Commodo consequat</a>
														<p class="price">$25.50</p> -->
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="place.jsp?place=Canada"><img src="themes/images/cloth/bootstrap-women-ware1.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Canada" class="title">Hotels in Canada</a><br/><br/>
														<!--  <a href="products.jsp" class="category">Quis nostrud</a>
														<p class="price">$17.55</p> -->
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="place.jsp?place=France"><img src="themes/images/cloth/bootstrap-women-ware6.jpg" alt="" /></a></p>
														<a href="place.jsp?place=France" class="title">Hotels in France</a><br/><br/>
														<!--  <a href="products.jsp" class="category">Quis nostrud</a>
														<p class="price">$25.30</p> -->
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="place.jsp?place=Colombia"><img src="themes/images/cloth/bootstrap-women-ware5.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Colombia" class="title">Hotels in Colombia</a><br/><br/>
														<!--  <a href="products.jsp" class="category">World once</a>
														<p class="price">$25.60</p> -->
													</div>
												</li>
											</ul>
										</div>
										<div class="item">
											<ul class="thumbnails">
												<li class="span3">
													<div class="product-box">
														<p><a href="place.jsp?place=Ecuador"><img src="themes/images/cloth/bootstrap-women-ware4.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Ecuador" class="title">Hotels in Ecuador</a><br/><br/>
														<!--  <a href="products.jsp" class="category">Quis nostrud</a>
														<p class="price">$45.50</p> -->
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="place.jsp?place=Argentina"><img src="themes/images/cloth/bootstrap-women-ware3.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Argentina" class="title">Hotels in Argentina</a><br/><br/>
														<!--  <a href="products.jsp" class="category">Commodo consequat</a>
														<p class="price">$33.50</p> -->
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="place.jsp?place=Denmark"><img src="themes/images/cloth/bootstrap-women-ware2.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Denmark" class="title">Hotels in Denmark</a><br/><br/>
														<!--  <a href="products.jsp" class="category">World once</a>
														<p class="price">$45.30</p> -->
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="place.jsp?place=Australia"><img src="themes/images/cloth/bootstrap-women-ware1.jpg" alt="" /></a></p>
														<a href="place.jsp?place=Australia" class="title">Hotels in Australia</a><br/><br/>
														<!--  <a href="products.jsp" class="category">Quis nostrud</a>
														<p class="price">$25.20</p> -->
													</div>
												</li>																																	
											</ul>
										</div>
									</div>							
								</div>
							</div>						
						</div>
						<br/>
						<div class="row feature_box">						
							<div class="span4">
								<div class="service">
									<div class="responsive">	
										<img src="themes/images/feature_img_2.png" alt="" />
										<h4>Let's Go's global hotel<strong> Search</strong></h4>
										<p>Let's Go's hotel search allows users to compare hotel prices in just a few clicks from more than 400 booking sites for 1.8 million+ hotels in over 190 countries. With 1.4 billion visits annually to our site, travellers regularly use the hotel comparison to compare deals in the same city.</p>									
									</div>
								</div>
							</div>
							<div class="span4">	
								<div class="service">
									<div class="customize">			
										<img src="themes/images/feature_img_1.png" alt="" />
										<h4>Find Cheap Hotels on <strong>Let's Go</strong></h4>
										<p>With Let's Go you can easily find your ideal hotel for the best price. Simply enter where you want to go and your desired travel dates, and let our hotel search engine compare accommodation prices for you.</p>
									</div>
								</div>
							</div>
							<div class="span4">
								<div class="service">
									<div class="support">	
										<img src="themes/images/feature_img_3.png" alt="" />
										<h4>How to <strong>Book</strong></h4>
										<p>Let's Go is a hotel search with an extensive price comparison. The prices shown come from numerous hotels and booking websites. This means that while users decide on Let's Go which hotel best suits their needs, the booking process itself is completed through the booking sites (which are linked to our website).</p>
									</div>
								</div>
							</div>	
						</div>		
					</div>				
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
		<script src="themes/js/jquery.flexslider-min.js"></script>
		<script type="text/javascript">
			$(function() {
				$(document).ready(function() {
					$('.flexslider').flexslider({
						animation: "fade",
						slideshowSpeed: 4000,
						animationSpeed: 600,
						controlNav: false,
						directionNav: true,
						controlsContainer: ".flex-container" // the container that holds the flexslider
					});
				});
			});
		</script>
    </body>
</html>
