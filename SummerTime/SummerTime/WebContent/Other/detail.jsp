<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <sql:setDataSource dataSource="jdbc/SummerTime" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<title>查看文章</title>
<c:set var="Id" value="${param.Id}" scope="page"/>
</head>
<body style="background-image: url(../image/222.gif);background-repeat: repeat;">
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
								<li><a href="article.jsp">文章</a></li>
								<li><a href="addmessage.jsp">留言</a></li>
								<li><a href="address.jsp">通讯录</a></li>
								<li><a href="../contact.jsp">联系我们</a></li>
							</ul>
						</div>
				</div>	
				</nav>
				<br><br>
<div class="container">
<h1 class="page-header">我的文章</h1>
<sql:query sql="select * from myArtical where Id='${param.Id}'" var="myArtical" />
<c:forEach var="myArtical" items="${myArtical.rows}">
<div class="row">
<div class="col-md-5 col-xs-5 col-md-offset-1 col-xs-offset-1">文章编号：<c:out value="${myArtical.Id}"/></div>
<div class="col-md-5 col-xs-5 col-md-offset-1 col-xs-offset-1">发表日期：<c:out value="${myArtical.logdate}"/></div>
<hr>
</div>
<div class="row">
<div class="col-md-10 col-xs-10 col-md-offset-1 col-xs-offset-1">${myArtical.logContent}</div>
</div>
</c:forEach>
</div>
</body>
</html>