<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>图片上传</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
</head>
<link href="../uploadify/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../uploadify/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../uploadify/swfobject.js"></script>
<script type="text/javascript" src="../uploadify/jquery.uploadify.v2.1.0.min.js"></script>
<body style="background-image: url(../image/222.gif);background-repeat: repeat;">

	<script type="text/javascript">
		$(document).ready(function() {
			$("#uploadify").uploadify({

				'uploader' : '../uploadify/uploadify.swf',
				'script' : '../upload',//servlet的路径或者.jsp 这是访问servlet 'scripts/uploadif'   
				'method' : 'GET', //如果要传参数，就必须改为GET  
				'cancelImg' : '../uploadify/cancel.png',
				'folder' : 'uploads', //要上传到的服务器路径，  
				'queueID' : 'fileQueue',
				'auto' : false, //选定文件后是否自动上传，默认false  
				'multi' : true, //是否允许同时上传多文件，默认false  
				'simUploadLimit' : 1, //一次同步上传的文件数目    
				'sizeLimit' : 99999999999, //设置单个文件大小限制，单位为byte    
				'queueSizeLimit' : 100, //限制在一次队列中的次数（可选定几个文件）。默认值= 999，而一次可传几个文件有 simUploadLimit属性决定。  
				'fileDesc' : '支持格式:jpg或gif', //如果配置了以下的'fileExt'属性，那么这个属性是必须的    
				'fileExt' : '*.jpg;*.gif',//允许的格式  
				'scriptData' : {
					'name' : $('#name').val(),
					'state' : $('#state').val()
				}, // 多个参数用逗号隔开 'name':$('#name').val(),'num':$('#num').val(),'ttl':$('#ttl').val()                    
				// onComplete : function(event, queueID, fileObj, response, data) {
					// var value = response;
					// alert("文件:" + fileObj.name + "上传成功");
				//},
				onError : function(event, queueID, fileObj) {
					alert("文件:" + fileObj.name + "上传失败");
				},
				onCancel : function(event, queueID, fileObj) {
					alert("取消了" + fileObj.name);
				}
			});
		});

		function uploasFile() {
			//校验  
			var name = document.getElementById("name").value;
			if (name.replace(/\s/g, '') == '') {
				alert("名称不能为空！");
				return false;
			}
			//设置 scriptData 的参数  
			$('#uploadify').uploadifySettings('scriptData', {
				'name' : $('#name').val()
			});
			//上传  
			jQuery('#uploadify').uploadifyUpload()

		}
	</script>
	相册名称:
	<input type="text" id="name" name="name" value="Picture">
	<br /> <br />  是否公开:
	<select name="state" id="state">
		<option value="1">公开</option>
		<option value="0">不公开</option>
	</select>
	<br />
	<br /><br /> 

	<div id="fileQueue"></div>

	<input type="file" name="uploadify" id="uploadify" />
	<p>
		<a href="javascript:jQuery('#uploadify').uploadifyUpload()">开始上传</a>&nbsp;
		<a href="javascript:jQuery('#uploadify').uploadifyClearQueue()">取消所有上传</a>
	</p>

</body>
</html>
