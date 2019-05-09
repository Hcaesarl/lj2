<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="com.app.utils.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="src/img/fav.png">
    <!-- style -->
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/admin.css">
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/app.css">
    <script src="<%=basePath %>static/assets/js/echarts.min.js"></script>
    <!-- titel -->
    <title></title>
    <style>
        .form {
            margin-bottom: 15px;
        }

        .form p {
            color: #333 !important;
            margin-bottom: 0px;
        }
    </style>
</head>
<body>


<div class="admin-content am-u-lg-6 am-cf am-padding am-padding-bottom-0" style="padding:15px;width: 100%">
    <!-- big box -->
    <div class="big-box">
        <div class="col-lg-6">

            <form method="POST" action="<%=basePath%>users/users/updatepassword">
                <div class="card am-tab-panel am-fade am-in am-active">
                    <div class="card-head">
                        <div class="left am-bg-primary">
                            <h4>
                                更新密码
                            </h4>
                        </div>
                        <div class="right">
                            <p class="am-text-danger">
                                ${message }</p>
                            <i class="zmdi zmdi-chevron-down"></i>
                            <i class="zmdi zmdi-refresh-sync"></i>
                            <i class="zmdi zmdi-close-circle-o"></i>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="form">
                            <p>用户名</p>
                            <input name="username" class="form-control" readonly value="${user.username }" type="text"
                                   placeholder="">
                            <input name="id" type="hidden" value="${user.id }">
                        </div>

                        <div class="form">
                            <p>新密码</p>
                            <input name="password" class="form-control" type="text" required value="">
                        </div>

                        <div class="form">
                            <p>确认新密码</p>
                            <input name="password2" class="form-control" type="text" required value="">
                        </div>


                        <div class="form">
                            <p></p>
                            <button class="am-btn am-btn-primary" type="submit">提交</button>
                        </div>
                        <div class="form">
                            <h1 style="height:50px;"></h1>
                        </div>
                    </div>
                </div>

            </form>


        </div>

    </div>
</div>
</div>

<!-- end Layout -->


</body>
</html>

