<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>--</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=basePath %>static/login/css/style.css" rel='stylesheet' type='text/css' />
<style>
body{
    background-image: url(<%=basePath %>static/home/images/bg.gif);
    background-color: #C1E6F5;
    background-repeat: repeat-x;}
</style>

</head>
<body>
	<div class="main">
		<div class="login">
			<h1>
			<a href="<%=basePath %>">
			--
			</a>
			</h1>
			<div class="inset">
				<!--start-main-->
				<form action="<%=basePath %>application/dologin" method="POST">
			         <div>
			         	<h2>用户登录</h2>
						<span><label>用户名</label></span>
						<span><input type="text" name="username" required class="textbox" ></span>
					 </div>
					 <div>
						<span><label>密码</label></span>
					    <span><input type="password" name="password" required class="password"></span>
					 </div>
					<div class="sign">
                        <input type="submit" value="登录" class="submit" />
                        
                        <a href="<%=basePath %>application/findPwd">找回密码</a>|
                        <a href="<%=basePath %>application/reg">注册账号</a>
					</div>
					</form>
				</div>
			</div>
		<!--//end-main-->
		</div>

<div class="copy-right">
	<p style="color:#333">&copy; 2018  --. All Rights Reserved</p>

</div>
<div style="text-align:center;">
<p>-</p>
</div>

  <script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
  <script src="<%=basePath %>static/layer/layer.js"></script>
  <c:if test="${!empty inlogin}">
		<c:if test="${user.username!=null}">
			<script>
			layer.alert("验证成功",{icon: 1});
setTimeout(function(){
window.location.href = "<%=basePath%>application/index.html";
				}, 1500);
			</script>
		</c:if>
		<c:if test="${user.username==null}">
			<script>
			layer.alert("验证失败，账号或者密码错误",{icon: 0});
			</script>
		</c:if>

	</c:if>
</body>
</html>