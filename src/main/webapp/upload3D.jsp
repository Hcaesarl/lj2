<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">

	<title>File Upload Page.</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
	<!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<form enctype="multipart/form-data"  id="form" method="POST" action="<%=basePath%>upload">
	<input type="file" id="file" name="file" required>

	<button type="button" onclick="upload()">上传文件</button>
	<br>
	<div id="save" style="display: none">
		<span style="color:#c00">保存成功</span><br>
		路径：<span id="path"></span><br>
		<a href="javscript:;" onclick="copy()">拷贝路径</a>
	</div>

</form>
<script>
	//上传文件
	function upload() {
		var fileObj = document.getElementById("file").files[0]; // js 获取文件对象

		var tokenv="ssssssss";

		//var data = {"token":token,"file":fileObj};

		var formData = new FormData();

		formData.append("file",fileObj);

		formData.append("token",tokenv);

		$.ajax({

			url: '/upload3D',

			type: 'POST',

			cache: false,

			data: new FormData($('#form')[0]),

			processData: false,

			contentType: false,
			success: function (rsp) {
				if (rsp != 'error') {
					$('#path').text(rsp);
					$('#save').show();
				}
			}
		})
	}
	function copy()
	{
		window.opener.document.getElementById("vpath").value = $('#path').text();
		window.close();
	}
</script>
</body>
</html>
