<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,javax.sql.*,Bean.DbUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除照片</title>
</head>
<body>
<%
 	Connection conn=DbUtil.getConnection();
 	Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
 	String PictureId=request.getParameter("id");
	ResultSet rs=stmt.executeQuery("select * from PictureInfo where PictureId='"+PictureId+"'");
	rs.first();
	rs.deleteRow();
	rs.close();
	conn.close();
	out.print("<script language='javascript'>alert('删除照片成功');window.location.href='single.jsp';</script>");
 
 %>
</body>
</html>