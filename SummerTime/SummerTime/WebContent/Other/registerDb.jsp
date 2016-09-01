<%@page import="summer.java.DbUtil"%>
<%@ page import="java.sql.*,javax.sql.DataSource,javax.naming.*,summer.java.DbUtil"
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>恭喜注册成功</title>
</head>
<body>
	<%
		String username = request.getParameter("name");
		String password = request.getParameter("pw");
		String email = request.getParameter("banji");
		String banji=request.getParameter("banji");
		Context context = new InitialContext();
		
		
		
		
		Connection conn = DbUtil.getConnection();
		//创建查询
		PreparedStatement stmt = conn
				.prepareStatement("insert into ClassInfo(UserName,Email,PassWord,Class)values(?,?,?,?)",
						ResultSet.TYPE_SCROLL_SENSITIVE,
						ResultSet.CONCUR_UPDATABLE);
		stmt.setString(1, username);
		stmt.setString(2, email);
		stmt.setString(3, password);
		stmt.setString(4, banji);
		ResultSet rs = stmt.executeQuery();
		stmt.close();
		conn.close();
	%>
	<p>恭喜您注册成功</p>
</body>
</html>