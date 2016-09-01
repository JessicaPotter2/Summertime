<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.io.*,Bean.DbUtil"%>
    <%@ page import="com.jspsmart.upload.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<%
SmartUpload su =new SmartUpload();// 新建一个SmartUpload对象
long file_size_max=4000000;//文件最大值
String fileExt="";
String url="/image/"; //将上传文件全部保存到指定目录
su.initialize(pageContext);// 上传初始化
try {
su.setAllowedFilesList("jpg,gif,png,jpeg");//只允许上载文件类型
su.upload();//上传
} catch (Exception e){
%>
<SCRIPT language=javascript>
alert("只允许上传.jpg和.gif,png,jpeg类型图片文件");
window.location='upload.jsp';
</script>
<%
}
try{
com.jspsmart.upload.File myFile = su.getFiles().getFile(0);
//文件不能为空,否则返回
if (myFile.isMissing()){%>
<script language=javascript>
alert("请先选择你要上传的文件");
window.location='com.jsp';
</script>
<%}
else{
fileExt= myFile.getFileExt(); //取得文件后缀名
int file_size=myFile.getSize(); //取得文件的大小
String fileurl="";
if(file_size<file_size_max){
//更改文件名，取得当前上传时间的毫秒数值
Connection conn=DbUtil.getConnection();
Calendar calendar = Calendar.getInstance();
String filename = String.valueOf(calendar.getTimeInMillis());
fileurl=application.getRealPath("/")+url;
fileurl+=filename+"."+fileExt; //图片上传后的路径
String media=url+filename+"."+fileExt;
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
java.util.Date currentTime = new java.util.Date();//得到当前系统时间 
String logdate =formatter.format(currentTime);
String intro=su.getRequest().getParameter("topic");
String logContent=su.getRequest().getParameter("artical");
String username=(String)session.getAttribute("user");
PreparedStatement stmt=conn.prepareStatement("insert into myArtical(logdate,intro,media,logContent,username) values(?,?,?,?,?)");
stmt.setString(1, logdate);
stmt.setString(2, intro);
stmt.setString(3,media);
stmt.setString(4,logContent);
stmt.setString(5,username);
stmt.executeUpdate();
stmt.clearParameters();
stmt.close();
conn.close();
myFile.saveAs(fileurl,SmartUpload.SAVE_PHYSICAL);//保存上传的文件到web服务器路径下
out.print("<script language='javascript'>alert('文章发表成功！');$.post('../WriteJsServlet');window.location.href='Artical.jsp';</script>");
}

}
}catch (Exception e){
out.print(e.toString());
}
%>
</body>
</html>