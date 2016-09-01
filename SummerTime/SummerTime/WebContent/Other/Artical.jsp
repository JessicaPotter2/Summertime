<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource dataSource="jdbc/SummerTime" />
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>发表文章</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<script type="text/javascript">
function test() {  
    var editor_data = CKEDITOR.instances.content.getData();  
    if(editor_data==null || editor_data==""){  
        alert("请填写内容！");  
        return false;  
    }  
    var topic = document.all.topic.value;
    var file = document.all.file.value;
    if(topic==null || topic==""){  
        alert("请填写文章标题！");  
        return false;  
    }
    if(file==null || file==""){  
        alert("请选择一张标志这篇文章的图片上传！");  
        return false;  
    }
}  
</script>
<script type="text/javascript" src="../ckeditor2/ckeditor.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<!--[if lt IE9]> 
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
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
				<br><br>
<sql:query sql="select * from myArtical" var="myArtical" />
<div class="container">
<h2 class="page-header">我的文章</h2>
<c:forEach var="myArtical" items="${myArtical.rows}">
<tr><div class="row" style="background:#000; color:#FFF">
<div class="col-md-4 col-xs-4">文章编号：<c:out value="${myArtical.Id}"/></div>
<div class="col-md-4 col-xs-4">发表日期：<c:out value="${myArtical.logdate}"/></div>
<div class="col-md-4 col-xs-4">发表人：<c:out value="${myArtical.username}"/></div>
</div>
<div>文章标题：<c:out value="${myArtical.intro}"/>&nbsp;&nbsp;&nbsp;
<a href="details.jsp?Id=<c:out value="${myArtical.Id}"/>">
<span class="glyphicon glyphicon-search" style="font-size:15px"></span>&nbsp;查看</a><hr></div>

<a href=studelartical.jsp?id=<c:out value="${myArtical.Id}"/>>删除</a>
					</tr>
</c:forEach>
</div>
<div class="container">
<form role='form' class="form-horizontal" method="post" action="myArtical.jsp" enctype="multipart/form-data">
<div class="row">
                  <div class="col-md-6 col-sm-8 col-xs-10 col-sm-offset-2 col-md-offset-3 col-xs-offset-1" >
                          <div class="form-group">
                              <div class="col-md-2 col-xs-2">
                              <label for="topic" class="control-label"><span class="glyphicon glyphicon-pencil" style="font-size:25px"></span></label>
                              </div>
                              <div class="col-md-10 col-xs-10">
                                  <input type="text" class="form-control" name="topic" 

id="topic" placeholder='请键入您的文章名'>
                              </div>
                          </div>
                          <div class="form-group">
                              <div class="col-md-2 col-xs-2">
                              <label for="file" class="control-label"><span class="glyphicon glyphicon-upload" style="font-size:25px"></span></label>
                              </div>
                              <div class="col-md-10 col-xs-10">
								<input type="file" name="file" size="30" class="form-control" id="file">
								<span class="help-block">请上传一张这篇文章的标志图片</span>
                              </div>
                          </div>
                  </div>
              </div>
<textarea name="artical">
</textarea>
<script type="text/javascript">CKEDITOR.replace('artical');</script>
<div class="form-group">
<br>
                          <div class="col-md-2 col-xs-2">
                          </div>
                          <div class="col-md-2  col-xs-6 col-md-offset-10 col-xs-offset-6">
                                  <button class="btn  btn-default btn-block" type="submit" onclick="test();">提交</button>
                                  </div>
                          </div>
</form>
</div>
</body>
</html>