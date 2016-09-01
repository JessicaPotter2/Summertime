
<%@ page import="java.sql.*,javax.sql.*,summer.java.DbUtil,java.text.*"
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通讯录</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">
h1 {
	font-size: 50px;
	line-height: 60px;
	color: #fff;
	font-family: 楷体;
}

h2 {
	font-size: 30px;
	line-height: 30px;
	color: #fff;
	font-family: 楷体;
}
</style>

<script src="../js/jquery-1.11.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</head>
<body style="background-image: url(../image/111.jpg); background-repeat: repeat;">
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
				<br><br><br>
	<div class="container-fluid">
		<header class="main-header">
			<div class="container">
				<div class="row">
					<div class="col-xs-6 col-sm-4 text-center">
						<h1></h1>
					</div>
					<div class="col-xs-6 col-sm-4 text-center">
						<h1>通讯录</h1>
					</div>
					<div class="col-xs-6 col-sm-4 text-center">
						<h1></h1>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-12 text-right">
						<h2>友谊地久天长</h2>
					</div>
				</div>
			</div>
		</header>
		<br> <br>
		<div style="background-color:#CCCCFF " class="container">
			<table class="table table-striped table-responsive table-bordered">
				<thead>
					<tr>
						<th>姓名</th>
						<th>电话</th>
						<th>住址</th>
						<th>其他</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
					<%
						Connection conn = DbUtil.getConnection();
						PreparedStatement stmt = conn
								.prepareStatement("select * from AddressBook order by ID desc ");
						ResultSet rs = stmt.executeQuery();
						while (rs.next()) {
							out.println("<tr>");
							out.println("<td>");
							out.print(rs.getString("Name"));
							out.println("</td>");

							out.println("<td>");
							out.print(rs.getString("Tel"));
							out.println("</td>");

							out.println("<td>");
							out.print(rs.getString("Address"));
							out.println("</td>");

							out.println("<td>");
							out.print(rs.getString("Other"));
							out.println("</td>");

							out.println("<td>");
							out.print("<a href='../deladdress?Name=" + rs.getString("Name")
									+ "'>删除</a>");
							out.println("</td>");

							out.println("</div>");

						}

						stmt.close();
						conn.close();
					%>
				</tbody>
			</table>
		</div>
		<div class="row text-center">
			<br> <br>
			<form class="form-inline" role="form" action="../address"
				method="post">
				<div class="form-group">
					<label class="sr-only" for="Name">姓名</label> <input type="text"
						class="form-control" id="Name" name="Name" placeholder="请输入姓名">
				</div>
				<div class="form-group">
					<label class="sr-only" for="Tel">联系方式</label> <input type="text"
						class="form-control" id="Tel" name="Tel" placeholder="请输入联系方式">
				</div>
				<div class="form-group">
					<label class="sr-only" for="Address">住址</label> <input type="text"
						class="form-control" id="Address" name="Address"
						placeholder="请输入籍贯">
				</div>
				<div class="form-group">
					<label class="sr-only" for="Other">其他</label> <input type="text"
						class="form-control" id="Other" name="Other" placeholder="其他联系方式">
				</div>
				<button type="submit" class="btn btn-default">添加</button>
			</form>
			<br> <br>
		</div>
	</div>
	
</body>
</html>