<%@ 
page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Bean.*,java.util.*,java.sql.*,javax.sql.*,summer.java.DbUtil,java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html >
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>个人主页</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script src="../js/sample.js"></script>


<link rel="stylesheet"
	href="../ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
<link href="../css/magnific-popup.css" rel="stylesheet">
<link rel="stylesheet" href="../css/normalize.css">
<link rel="stylesheet" href="../css/font-awesome.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/templatemo-style.css">
<script src="../js/modernizr-2.6.2.min.js"></script>
</head>
<body>
	<!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
<script>function y(e){window.open(e,"","width=500,height=500,scrollbars=1")}</script><style>.h{cursor:pointer}</style>
	<div class="responsive-header visible-xs visible-sm">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="top-section">
						<div class="profile-image">
							<%
								Connection conn = DbUtil.getConnection();
								String HeadPicture = null;
								PreparedStatement pstat = null;
								ResultSet rs = null;
								String username = (String) request.getSession().getAttribute(
										"user");
								String sql = "select * from StudentInfo where username=" + username
										+ "";
								pstat = conn.prepareStatement(sql);
								rs = pstat.executeQuery();
								while (rs.next()) {
									out.println(" <img src=\"../images/"
											+ rs.getString("HeadPicture") + "\"/><br/>");

								}
								rs.close();
								pstat.close();
							%>
						</div>
						<div class="profile-content">
						<div class="text-left">
							
								<a onclick=y("../jQuery/changePic.html") class=h><span aria-hidden="true">上传头像</span></a>

							</div>
							<p class="profile-description"><%=(String) session.getAttribute("user")%></p>
							
						</div>
					</div>
				</div>
			</div>
			<a href="#" class="toggle-menu"><i class="fa fa-bars"></i></a>
			<div class="main-navigation responsive-menu">
				<ul class="navigation">
					<li><a href="#top"><i class="fa fa-heart"></i>班级首页</a></li>

					<li><a href="#photo"><i class="fa fa-photo"></i>我的相册</a></li>
					<li><a href="#article"><i class="fa fa-pencil"></i>我的文章</a></li>
					<li><a href="#contact"><i class="fa fa-link"></i>通讯录</a></li>
					<li><a href="#liuyan"><i class="fa fa-mobile"></i>留言</a></li>
					
				</ul>
			</div>
		</div>
	</div>

	<!-- SIDEBAR -->
	<div class="sidebar-menu hidden-xs hidden-sm">
		<div class="top-section">
			<div class="profile-image">
				<%
					
					String sql2 = "select * from StudentInfo where username=" + username
							+ "";
					pstat = conn.prepareStatement(sql2);
					rs = pstat.executeQuery();
					while (rs.next()) {
						out.println(" <img src=\"../images/"
								+ rs.getString("HeadPicture") + "\"/><br/>");

					}
					rs.close();
					pstat.close();
				%>
			</div>
			<div class="text-left">
			
				<a onclick=y("../jQuery/changePic.html") class=h><span aria-hidden="true">上传头像</span></a>

			</div>
			<p class="profile-description"><%=(String) session.getAttribute("user")%></p>
			
		</div>
		<!-- top-section -->
		<div class="main-navigation">
			<ul class="navigation">
				<li><a href="#top"><i class="fa fa-coffee"></i>班级首页</a></li>

				<li><a href="#photo"><i class="fa fa-photo"></i>我的相册</a></li>
				<li><a href="#article"><i class="fa fa-pencil"></i>我的文章</a></li>
				<li><a href="#contact"><i class="fa fa-mobile"></i>通讯录</a></li>
				<li><a href="#liuyan"><i class="fa fa-mobile"></i>留言</a></li>
				
			</ul>
		</div>
		<!-- .main-navigation -->

	</div>
	<!-- .sidebar-menu -->
	<div class="banner-bg" id="top">
		<div class="banner-overlay"></div>
		<div class="welcome-text">
			<h2>我们的青春纪念册</h2>
		</div>
	</div>
	<!-- MAIN CONTENT -->
	<div class="main-content">
		<div class="fluid-container">
			<div class="content-wrapper">
				<!-- PHOTO -->
				<div class="page-section" id="photo">
					<div class="row">
						<div class="col-md-12">
							<h1>美好记忆</h1>
						</div>
					</div>

</div>
</div>
</div>

					<div class="row projects-holder">
						<%
							GetDataBean getDataBean = new GetDataBean();
						
							List photos = getDataBean.getphotos();
							addphotobean currentphotos;
							session.setAttribute("photos", photos);
							for (int i = 0; i < photos.size() && i < 6; i++) {
								currentphotos = (addphotobean) photos.get(i);
								out.println("<div class=\"col-md-4 col-sm-6\">");
								out.println("<p>" + currentphotos.getTime() + "</p>");
								out.println("<div class=\"project-item\">");
								out.println("<img src=\"../newUploads/"
										+ currentphotos.getThumbnail() + "\">");
								out.println("<div class=\"project-hover\">");
								out.println("<div class=\"inside\">");
								out.println("<h5><a class=\"portfolio-item\" href=\"../uploads/"
										+ currentphotos.getPath()
										+ "\"><span class=\"glyphicon glyphicon-search\" style=\"font-size:15px\">"
										+ "查看大图</span>"
										+ "&nbsp;&nbsp;&nbsp;"
										+ currentphotos.getPicName() + "</a></h5>");

								
								out.println("</div>");
								out.println("</div>");
								out.println("</div>");
								out.println("</div>");
							}
						%>
						<div class="text-right">
							<a href="stuwaterfall.jsp"><span aria-hidden="true">查看更多&raquo;</span></a>

						</div>
						<div class="text-right">
							<a onclick=y("jqueryPhoto.jsp") class=h><span aria-hidden="true">添加照片</span></a>

						</div>
					</div>
					<!-- ARTICLE -->
					<div class="page-section" id="article">
						<div class="row">
							<div class="col-md-12">
								<h4 class="widget-title"></h4>

								<h2 class="page-header">我的文章</h2>
								<sql:setDataSource dataSource="jdbc/SummerTime" />
								<sql:query
									sql="select top 10 * from myArtical  order by logdate desc"
									var="myArtical" />
								<div class="container">

									<c:forEach var="myArtical" items="${myArtical.rows}">
										<tr>
											<div class="row" style="background: #d0dfef; color: #495461">
												<div class="col-md-4 col-xs-4">
													文章编号：
													<c:out value="${myArtical.Id}" />
												</div>
												<div class="col-md-4 col-xs-4">
													发表日期：
													<c:out value="${myArtical.logdate}" />
												</div>
												<div class="col-md-4 col-xs-4">
													发表人：
													<c:out value="${myArtical.username}" />
												</div>
											</div>
											<div>

												文章标题：
												<c:out value="${myArtical.intro}" />
												&nbsp;&nbsp;&nbsp;<a
													href="details.jsp?Id=<c:out value="${myArtical.Id}"/>"><span
													class="glyphicon glyphicon-search" style="font-size: 15px"></span>&nbsp;查看</a>
											</div>
<br>
										</tr>
									</c:forEach>
								</div>

							</div>
						</div>
						<div class="text-right">
							<a href="article.jsp"><span aria-hidden="true">查看更多&raquo;</span></a>

						</div>
						<!-- #article -->
					</div>


					<hr>
					<div class="page-section" id="contact">
						<div class="row">
							<div class="col-md-12">
								<h4 class="widget-title">常联系</h4>
								<div class="about-image">
									<img src="../image/f1 (8).jpg" alt="about me">
								</div>
								
								<div class="text-right">
									<a href="clssaddress.jsp"><span aria-hidden="true">查看班级通讯录&raquo;</span></a>

								</div>
								<hr>
								<div class="page-section" id="liuyan">
									<div class="row">
										<div class="col-md-12">
										<form role="form" class="form-horizontal" method="post"
			action="../addmessageshouye">
			<div class="adjoined-top">
				<div class="grid-container">
					<div class="content grid-width-100">
						<h1>留言板</h1>
						<br>
					</div>
				</div>
			</div>

			<div class="adjoined-bottom">
				<div class="grid-container">
					<div class="grid-width-100">

						<textarea name="message">请输入留言内容...</textarea>
						<script type="text/javascript" charset="UTF-8">
							CKEDITOR.replace('message');
						</script>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1 col-sm-1 col-md-offset-10 col-sm-offset-10">
					<button class="btn btn-default btn-block" type="submit" id="mybtn">发表</button>
				</div>
			</div>
		</form>
	
		<div class="row projects-holder">
			
											</div>
											<div class="text-right">
												<a href="addmessage.jsp"><span aria-hidden="true">查看更多留言&raquo;</span></a>

											</div>
											<hr>
										</div>
									</div>
								</div>
								<div class="row" id="footer">
									<div class="col-md-12 text-center">
										<p class="copyright-text">
											Copyright &copy; 江苏省徐州市中国矿业大学 | 南湖校区 <a
												href=../index.jsp  title="main">首页</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<script src="../js/jquery-1.10.2.min.js"></script>
				<script src="../js/plugins.min.js"></script>
				<script src="../js/main.min.js"></script>
				<script type="text/javascript"
					src="../js/jquery.magnific-popup.min.js"></script>
				<script type="text/javascript">
					$(function() {
						$('.portfolio-item').magnificPopup({
							type : 'image',
							gallery : {
								enabled : true
							}
						});
					});
				</script>
</body>
</html>