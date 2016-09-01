<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="Bean.*,java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Viewport Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstarp-css -->
<link href="css/bootstrap2.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/magnific-popup.css" rel="stylesheet"> 
<!--// bootstarp-css -->
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--// css -->
<script src="js/jquery.min.js"></script>
<!--fonts-->
<link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<!--/fonts-->
<!-- dropdown -->
<script src="js/jquery.easydropdown.js"></script>
<link href="css/nav.css" rel="stylesheet" type="text/css" media="all"/>
<script src="js/scripts.js" type="text/javascript"></script>
<!--js-->
<!--/js-->
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
			   </script>	
<!-- start-smoth-scrolling -->
		<script type="text/javascript" src="js/move-top.js"></script>
		<script type="text/javascript" src="js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
<!-- slider -->
<script src="js/responsiveslides.min.js"></script>
<script>
    // You can also use "$(window).load(function() {"
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
        manualControls: '#slider3-pager',
      });
    });
  </script>
<!-- slider -->
</head>
<body style="background:#e1dfd8; color:#272727">
	<div id="home" class="header">
		<div class="header-top">
			<!-- container -->
			<div class="container">
				<div class="top-nav">
					<ul class="nav">
						<li>Spring</li>                                          
						<li class="dropdown1"><a href="Other/single.jsp">我的班级</a>
							<ul class="dropdown2">
								<li><a href="Other/waterfall.jsp">相册</a></li>
								<li><a href="Other/Artical.jsp">文章</a></li>
								<li><a href="Other/address.jsp">通讯录</a></li>
								<li><a href="Other/addmessage.jsp">留言</a></li>
							</ul>
						</li>
						<li class="dropdown1"><a href="#">登录</a>
						<ul class="dropdown2">
								<li><a href="Classlogin.html">班级登录</a></li>
								<li><a href="login.html">学生登录</a></li>


							</ul>	
						</li>     
						<li class="dropdown1"><a href="register.html">学生注册</a>
							
						</li> 
						<li class="dropdown1"><a href="classregister.html">班级注册</a>
							
						</li>              			           
						<li class="dropdown1"><a href="Other/Timeaxis.html">时光轴</a>
							
						</li>            
						<li><a href="contact.jsp">Contact</a></li>
					</ul>
				</div>
				
				<div class="clearfix"> </div>
				<!-- script-for-menu -->
			</div>
			<!-- //container -->
		</div>
		<div class="header-bottom">
			<!-- container -->
			<div class="container">
				<div class="head-logo">
					<a href="index.html"><img src="image/logo2.png" alt="" /></a>
				</div>
				
				<div class="clearfix"> </div>
			</div>
			<!-- //container -->
		</div>
	</div>
	<!-- //header -->	
    <div class="copyrights">Collect from </div>
	<!-- bg-banner -->
	<div class="bg-banner">
			<div class="banner-bg"> 
				<div class="container">
					<!-- banner -->
					<div class="banner">
						<div class="banner-grids">
							<div class="banner-top">
								<span class="menu">MENU</span>
								<ul class="nav banner-nav">
										<li>Spring</li>                                          
										<li class="dropdown1"><a href="index.jsp">主页<span>Home</span></a>
											
										</li>
										   
										<li class="dropdown1"><a href="Other/waterfall.jsp">相册<span>Album</span></a>
											
										</li>     
										<li class="dropdown1"><a href="Other/Artical.jsp">文章<span>Artical</span></a>
											
										</li> 
										<li class="dropdown1"><a href="Other/addmessage.jsp">留言<span>Message boards</span></a>
											
										</li> 
								</ul>
								<script>
									$("span.menu").click(function(){
										$(" ul.nav").slideToggle("slow" , function(){
										});
									});
								</script>
							</div>
							<div class="banner-middle">
								<div class="strip"> </div>
								<div class="slider">
									<!-- Slideshow 3 -->
									<ul class="rslides" id="slider">
									  <li><img src="image/1.jpg" alt=""></li>
									  <li><img src="image/2.jpg" alt=""></li>
									  <li><img src="image/3.jpg" alt=""></li>
									  <li><img src="image/4.jpg" alt=""></li>
									  <li><img src="image/5.jpg" alt=""></li>
									  <li><img src="image/6.jpg" alt=""></li>
									</ul>
									<!-- Slideshow 3 Pager -->
									<ul id="slider3-pager">
									  <li><a href="#"><img src="image/1c.jpg" alt=""></a></li>
									  <li><a href="#"><img src="image/2c.jpg" alt=""></a></li>
									  <li><a href="#"><img src="image/3c.jpg" alt=""></a></li>
									  <li><a href="#"><img src="image/4c.jpg" alt=""></a></li>
									  <li><a href="#"><img src="image/5c.jpg" alt=""></a></li>
									 
									</ul>
								</div>
								<div class="strip1"> </div>
							</div>
						</div>
					</div>
					<!-- //banner -->
				</div>
			</div>
		 </div>
		 <div class="container" >
		<%
									GetData getDataBean = new GetData();
									List photos = getDataBean.getphotos();
									addphotobean currentphotos;
									session.setAttribute("photos", photos);
									for (int i =0;i < photos.size()&&i<9; i++) {
										currentphotos = (addphotobean) photos.get(i);
										out.println("<div class=\"col-md-4 col-sm-6\">");
										out.println("<p>"+currentphotos.getTime()+"</p>");
										out.println("<img src=\"newUploads/"+currentphotos.getThumbnail()+"\" width=\"280\" height=\"200\">");
			                             out.println("<h5><a class=\"portfolio-item\" href=\"uploads/"+currentphotos.getPath()+"\"><span class=\"glyphicon glyphicon-search\" style=\"font-size:15px\">"+"查看大图</span>"+"</a></h5>");
			                             
			                        out.println("</div>");
									}
						%></div>
	<div class="footer">
		<!-- container -->
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-3 footer-logo">
					<a href="index.html"><img src="image/f-logo2.png" alt="" /></a>
					<p>Young is the only thing we have right to weave a dream time.</p>
				</div>
			</div>
		</div>
		</div>
		<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
<script type="text/javascript">
		$(function () {
			$('.portfolio-item').magnificPopup({ 
				type: 'image',
				gallery:{
					enabled:true
				}
			});
		});
	</script>
</body>
</html>