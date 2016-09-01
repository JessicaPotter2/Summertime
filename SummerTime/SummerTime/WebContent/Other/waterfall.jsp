<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Bean.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>相册</title>

<link href="../css/magnific-popup.css" rel="stylesheet">
<link href="../css/templatemo-style.css" rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link href="../css/sty.css" type="text/css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
					<div class="container">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">menu</span> 
								<span class="icon-bar"></span>
								<span class="icon-bar"></span> 
								<span class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="single.jsp">青春纪念册</a>
						</div>
						<div class="collapse navbar-collapse" >
							<ul class="nav navbar-nav">
								<li class="active"><a href="waterfall.jsp">相册</a></li>
								<li><a href="Artical.jsp">文章</a></li>
								<li><a href="addmessage.jsp">留言</a></li>
								<li><a href="address.jsp">通讯录</a></li>
								<li><a href="../contact.jsp">联系我们</a></li>
							</ul>
						</div>
				</div>	
				</nav>
	<div class="text-center"><span style="color:#AA0000;font-size:20px;font-weight:bold;">Photograph</span></div>
	<br>
	<%
		GetDataBean getDataBean = new GetDataBean();
		List photos = getDataBean.getphotos();
		addphotobean currentphotos;
		session.setAttribute("photos", photos);
		for (int i = 0; i < photos.size(); i++) {
			currentphotos = (addphotobean) photos.get(i);
			out.println("<div id=\"container\">");
			out.println("<div class=\"box\">");
			out.println("<div class=\"content project-item\">");
			out.println("<img src=\"../newUploads/"
					+ currentphotos.getThumbnail() + "\">");
			out.println("<div class=\"project-hover\">");
			out.println("<div class=\"inside\">");
			
			out.println("<p>" + currentphotos.getTime() + "</p>");
			out.println("<h5><a class=\"portfolio-item\" href=\"../uploads/"
					+ currentphotos.getPath()
					+ "\"><span class=\"glyphicon glyphicon-search\" style=\"font-size:15px\">"
					+ "查看大图</span>" + "</a></h5>");

			out.println("<a href=\"studelphoto.jsp?id="
					+ currentphotos.getPictureId()
					+ "\" class=\"btn btn-primary btn-xs\">" + "删除"
					+ "</a>");
			out.println("</div>");
			out.println("</div>");
			out.println("</div>");
			out.println("</div>");

			out.println("</div>");
		}
	%>
	<script src="../js/jquery-1.11.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/main.js"></script>

	<script src="../js/modernizr-2.6.2.min.js"></script>
	<script type="text/javascript" src="../js/jquery.magnific-popup.min.js"></script>
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