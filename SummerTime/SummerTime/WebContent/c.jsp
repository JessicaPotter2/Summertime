<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="Bean.*,Login.*"%>
<%
	//接收参数 
	request.setCharacterEncoding("UTF-8");
	
	String PassWord = request.getParameter("PassWord");
	String ClassName = request.getParameter("ClassName");
	String Email = request.getParameter("Email");
	//控制台输出表单数据看看 
	System.out.println("ClassName=" + ClassName + ",Password=" + PassWord
			+ ",Email=" + Email);
	//检查code的合法性 
	ClaOperation u = new ClaOperation();
	int num = u.isExists(ClassName);
	if (ClassName == null || ClassName.trim().length() == 0) {
		out.println("username can't be null or empty");
	} else if (ClassName == null && num != 0) {
		out.println("this loginName is exists!");
	} else {
		out.println("OK");
	}
%>