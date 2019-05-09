<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>链家二手物品流转平台</title>

        <!-- CSS -->        
        <link rel="stylesheet" href="<%=basePath %>static/login/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=basePath %>static/login/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=basePath %>static/login/assets/css/form-elements.css">
        <link rel="stylesheet" href="<%=basePath %>static/login/assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
<link href="<%=basePath %>static/dist/sweetalert.css" rel="stylesheet">	
        <script src="<%=basePath %>static/dist/sweetalert.min.js"></script>
        
        <style>
        
        .overlay {
    background: linear-gradient(to top right, #d2b48c, #000000);
    opacity: 0.9;
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 100%;
}</style>

    </head>

    <body>
<div class="overlay"></div>
		<!-- Top menu -->
		<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" 
					data-toggle="collapse" data-target="#top-navbar-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" style="
					width:auto!important;
					text-indent:0px;background:none; font-size:25px;
					color:#fff;font-weight:bold;" href="<%=basePath%>">
					<i class="fa fa-home"></i>
					链家二手物品流转平台</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				
			</div>
		</nav>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        
                        <div style="margin:0 auto;float:none" class="col-sm-5 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>登录</h3>
                            		<p>ONLINE LOGIN</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-bar-chart"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="<%=basePath %>backendui/signin" method="post" class="registration-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-first-name">账号</label>
			                        	<input type="text" name="username" placeholder="账号" class="form-first-name form-control" id="form-first-name">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-last-name">密码</label>
			                        	<input type="password" name="password" placeholder="密码" class="form-last-name form-control" id="form-last-name">
			                        </div>
			                       
			                        <button type="submit" class="btn">马上登录!</button>
			                        <button type="BUTTON" onclick="javascript:location.href='<%=basePath %>backendui/signup';" class="btn pull-right btn-default">创建平台账号</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="<%=basePath %>static/login/assets/js/jquery-1.11.1.min.js"></script>
        <script src="<%=basePath %>static/login/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=basePath %>static/login/assets/js/jquery.backstretch.min.js"></script>
        <script src="<%=basePath %>static/login/assets/js/retina-1.1.0.min.js"></script>
        <script src="<%=basePath %>static/login/assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="<%=basePath %>static/login/assets/js/placeholder.js"></script>
        <![endif]-->
<script>
jQuery(document).ready(function() {
	
    /*
        Fullscreen background
    */
    $.backstretch("<%=basePath %>static/bg0407.jpg");
});
</script>

<c:if test="${!empty inlogin}">
		<c:if test="${user.username!=null}">
			<script>
			swal("登录提示","登录成功，正在跳转","success");
setTimeout(function(){
window.location.href = "<%=basePath%>backendui/index.html";
				}, 1500);
			</script>
		</c:if>
		<c:if test="${user.username==null}">
			<script>
			swal("登录提示","登录失败，请重新输入","error");
			</script>
		</c:if>

	</c:if>

    </body>

</html>