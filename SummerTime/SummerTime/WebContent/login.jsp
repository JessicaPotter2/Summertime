<%@ page import="java.util.*,java.sql.*,java.net.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>登陆</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#txtUserName").val($.cookie("username"));
		$("#txtPassword").val($.cookie("password"));
		
		$("form").submit(function(){
			if ($("input#chkRememberPwd:checked").length > 0) {
				$.cookie("username", $("#txtUserName").val());
				$.cookie("password", $("#txtPassword").val());
			}
		});
		
	});
	
	
</script>
    
<!--[if lt IE9]> 
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
  <body style="background-image: url(image/y14.jpg);background-repeat: repeat;">
<div class="container">
      <div style="margin-top:10%;">
          <div class="container"  >
              <div class="row">
                  <div class="col-md-4 col-sm-6 col-xs-12 col-sm-offset-3 col-md-offset-4 well" >
                  <h3>请登录</h3><hr>
                      <form action="loginServlet" role='form' class="form-horizontal" method="post">
                          <div class="form-group">
                              <div class="col-md-2 col-xs-2">
                              <label for="username" class="control-label"><span class="glyphicon glyphicon-user" style="font-size:25px"></span></label>
                              </div>
                              <div class="col-md-10 col-xs-10">
                                  <input type="text" class="form-control" name="username" 

id="username" placeholder='请输入您的用户名' >
                              </div>
                          </div>
                          <div class="form-group">
                              <div class="col-md-2 col-xs-2">
                              <label for="password" class="control-label"><span class="glyphicon glyphicon-lock" style="font-size:25px"></span></label>
                              </div>
                              <div class="col-md-10 col-xs-10">
                                  <input type="password" class="form-control" name="password" 

id="password" placeholder='请输入您的密码' value="${pass}">
                              </div>
                          </div>
                        <div class="form-group">
                            <div class="col-md-9 col-md-offset-3 col-xs-9 col-xs-offset-3">
                                <input type="checkbox" name="Remember_me" >记住密码
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-9 col-md-offset-3 col-xs-9 col-xs-offset-3">
                                <input type="radio" name="type" value="个人">个人登录
                                <input type="radio" name="type" value="班级">班级登录
                            </div>
                        </div>
                          <div class="form-group">
                          <div class="col-md-2 col-xs-2">
                          </div>
                          <div class="col-md-10  col-xs-10 ">
                                  <button class="btn btn-info btn-block" type="submit">登录</button>
                                  </div>
                          </div>
                      </form>
                      <div class="bottom" id="bottom-web" style="display:block;">
                      <a href="#" class="link" id="forgetpwd" target="_blank">忘记密码？</a>
                      <span class="dotted">|</span>
                      <a href="#" class="link" target="_blank">注册</a>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      </div>
  </body>
  <script src="js/bootstrap.js"></script>
    <script src="js/jQuery.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
</html>
