<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		Statement st;
		request.setCharacterEncoding("UTF-8");
		String root = request.getSession().getServletContext()
				.getRealPath("/");
		String savePath = root + "images\\";
		SmartUpload mySmartUpload = new SmartUpload();
		try {
			mySmartUpload.initialize(config, request, response);
			mySmartUpload.upload();
			mySmartUpload.save(savePath);
			String description = mySmartUpload.getFiles().getFile(0)
					.getFileName();
			String ClassName = request.getParameter("banji");
			String PassWord = request.getParameter("password");
			String Email = request.getParameter("email");

			String image = mySmartUpload.getRequest().getParameter("image");

			

			out.print("文件名" + description);
			out.print("文件存储的位置: " + savePath + "<br/>");

		} catch (Exception e) {
			System.out.println("Error : " + e.toString());
		}
	%>
</body>
</html>