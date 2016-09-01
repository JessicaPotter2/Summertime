<%@ page import="java.sql.*,javax.servlet.*" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jspsmart.upload.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String className = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433; DatabaseName=SummerTime";
		String user = "sa";
		String password = "123";
		Connection conn;
		request.setCharacterEncoding("UTF-8");
		String username=(String)request.getSession().getAttribute("user");
		String root = request.getSession().getServletContext()
				.getRealPath("/");
		String savePath = root + "images\\";
		SmartUpload mySmartUpload = new SmartUpload();
		try {
			mySmartUpload.initialize(config, request, response);
			mySmartUpload.upload();
			mySmartUpload.save(savePath);
			String HeadPicture = mySmartUpload.getFiles().getFile(0)
					.getFileName();
			Class.forName(className);
			  conn=DriverManager.getConnection(url, user, password);
			  Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			  ResultSet rs=stmt.executeQuery( "select * from ClassInfo where ClassName='"+username+"'");
				rs.first();
				rs.updateString(5,HeadPicture);
				rs.updateRow();
			    conn.close();
			    out.print("头像修改成功，2秒钟后自动跳转"); 
			    response.setHeader("Refresh","2;URL=../Other/double.jsp");
		} catch (Exception e) {
			System.out.println("Error : " + e.toString());
		}
	%>
</body>
</html>