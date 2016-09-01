
<%@ page import="java.sql.*,javax.sql.*,summer.java.DbUtil,java.text.*"
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script src="../js/sample.js"></script>

<link rel="stylesheet" href="../ckeditor/samples/css/samples.css">
<link rel="stylesheet"
	href="../ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">

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
								<li><a href="Artical.jsp">文章</a></li>
								<li><a href="addmessage.jsp">留言</a></li>
								<li><a href="address.jsp">通讯录</a></li>
								<li><a href="../contact.jsp">联系我们</a></li>
							</ul>
						</div>
				</div>	
				</nav>
				<br>
		<form role="form" class="form-horizontal" method="post"
			action="../addmessage">
			<div class="adjoined-top">
				<div class="grid-container">
					<div class="content grid-width-100">
						<h1>留言板</h1>
						<p>列车纵向我们相逢处驶去 在这座熟悉的城市</p>
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
		<hr>
		<div class="row projects-holder">
			<%
			Connection conn = DbUtil.getConnection();
			PreparedStatement stmt = conn
					.prepareStatement("select * from MessageInfo order by MessageTime desc");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
			out.println("<div class=\"row text-center\">");	
			out.println("<div class=\"col-md-3 col-sm-3\">");			
			out.print(  rs.getString("userName"));
			out.println("</div>");
			
			out.println("<div class=\"col-md-6 col-sm-6\">");			
			out.print(  rs.getString("Message"));
			out.println("</div>");
			
			out.println("<div class=\"col-md-3 col-sm-3\">");			
			out.print(  rs.getString("MessageTime"));
			out.println("</div>");
			out.println("</div>");
			out.println("<hr>");
			}
			

			stmt.close();
			conn.close();
			%>
		</div>
		
	</div>
<script src="../js/jquery-1.11.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
