<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%@page import="Bean.*,Login.*" %>
<% 
        //接收参数 
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username"); 
        String password = request.getParameter("password"); 
        String ClassName=request.getParameter("ClassName");
        String email = request.getParameter("email");
        //控制台输出表单数据看看 
        System.out.println("username=" + username + ",password=" + password+ ",email=" + email); 
        //检查code的合法性 
        UserOperation u=new UserOperation();
		int num=u.isExists(username,ClassName);
        if (username == null || username.trim().length() == 0) { 
                out.println("username can't be null or empty"); 
        } else if (username == null && num==0) { 
                out.println("this loginName is exists!"); 
        } else { 
                out.println("OK"); 
        } 
%>