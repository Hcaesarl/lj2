<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>

    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="<%=basePath %>static/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath %>static/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/admin.css">
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/app.css">
    <script src="<%=basePath %>static/assets/js/echarts.min.js"></script>
    <style>

        .am-form-group {
            padding: 15px;
            text-align: left;
        }

        .am-form-group label {
            width: 100px;
            height: 45px;
            padding-top: 10px;
            text-align: right;
            float: left;
        }
    </style>
</head>

<body data-type="index">


<div class="row am-u-md-4" style="padding-left:30px;padding-right:30px;width: 100%;">

    <div class="tpl-portlet-components">
        <div class="portlet-title">
            <div class="caption font-green bold">
                <span class="am-icon-plus"></span> 新增用户
            </div>
            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon right">

                    </div>
                </div>
            </div>


        </div>
        <div class="tpl-block ">

            <div class="am-g tpl-amazeui-form">


                <div class="am-u-sm-12 am-u-md-12">
                    <form class="am-form " action="<%=basePath %>users/users/save" method="POST">

                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-2 am-form-label">类型</label>
                            <div class="am-u-sm-8">
                                <select name="type" style="height:40px;" class="form-control">
                                    <option value="1">用户</option>
                                    <option value="5">管理员</option>
                                    <option value="3">配送员</option>
                                </select>
                                <small></small>
                            </div>
                        </div>


                        <div style="clear:both"></div>

                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-2 am-form-label">账号</label>
                            <div class="am-u-sm-8">
                                <input type="text" name="username" required placeholder="">
                                <small></small>
                            </div>
                        </div>
                        <div style="clear:both"></div>
                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-2 am-form-label">密码</label>
                            <div class="am-u-sm-8">
                                <input type="password" name="password" required placeholder="">
                                <small></small>
                            </div>
                        </div>
                        <div style="clear:both"></div>
                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-2 am-form-label">确认密码</label>
                            <div class="am-u-sm-8">
                                <input type="password" name="password2" required placeholder="">
                                <small></small>
                            </div>
                        </div>

                        <div style="clear:both"></div>


                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-2 am-form-label">头像</label>
                            <div class="am-u-sm-8">
                                <input readonly type="text" required id="thumb" value="" name="thumb">
                                <a href="javascript:;" class="uploadImg">点击上传</a>
                                <small></small>
                            </div>
                        </div>
                        <div style="clear:both"></div>
                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-2 am-form-label">姓名</label>
                            <div class="am-u-sm-8">
                                <input type="text" name="realname" required placeholder="">
                                <small></small>
                            </div>
                        </div>


                        <!--
                         <div style="clear:both"></div>
                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-2 am-form-label">性别</label>
                            <div class="am-u-sm-8">
                                <input type="text" name="sex" required placeholder="">
                                <small></small>
                            </div>
                        </div>

                      <div style="clear:both"></div>
                            <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-2 am-form-label">年龄</label>
                            <div class="am-u-sm-8">
                                <input type="number" name="age" required placeholder="">
                                <small></small>
                            </div>
                        </div>
<div style="clear:both"></div>

<div class="am-form-group">
                            <label for="user-name" class="am-u-sm-2 am-form-label">身份证</label>
                            <div class="am-u-sm-8">
                                <input type="text" name="ecard" required placeholder="">
                                <small></small>
                            </div>
                        </div>
                         <div style="clear:both"></div>
                         <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-2 am-form-label">联系地址</label>
                            <div class="am-u-sm-8">
                                <input type="text" name="address" required placeholder="">
                                <small></small>
                            </div>
                        </div>

                         <div style="clear:both"></div>

                            <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-2 am-form-label">邮箱</label>
                            <div class="am-u-sm-8">
                                <input type="text" name="email" required placeholder="">
                                <small></small>
                            </div>
                        </div>
                            <div style="clear:both"></div>

                           <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-2 am-form-label">qq</label>
                            <div class="am-u-sm-8">
                                <input type="text" name="qq" required placeholder="">
                                <small></small>
                            </div>
                        </div>
                         <div style="clear:both"></div>
                         <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-2 am-form-label">电话</label>
                            <div class="am-u-sm-8">
                                <input type="text" name="tel" required placeholder="">
                                <small></small>
                            </div>
                        </div>

-->
                        <div style="clear:both"></div>
                        <div class="am-form-group">
                            <div class="am-u-sm-9 am-u-sm-push-3">
                                <button type="submit" class="am-btn am-btn-primary">保存数据</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
</div>


<script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
<script src="<%=basePath %>static/assets/js/amazeui.min.js"></script>
<script src="<%=basePath %>static/assets/js/iscroll.js"></script>
<script src="<%=basePath %>static/assets/js/app.js"></script>
<script src="<%=basePath %>static/layer/layer.js"></script>
<script src="<%=basePath%>source/scripts/window.js"></script>
<c:if test="${!empty message}">
    <script>
        var btn = $("#showMsgBtn", window.parent.document);
        var msg = $("#msg", window.parent.document);
        $(msg).val("${message}");
        $(btn).click();
        //layer.alert("${message}",{icon: 1});
    </script>
</c:if>

<script>
    window.onload = function () {
        $(".uploadImg").click(function () {
            openWindow("<%=basePath%>upload.jsp");
        });
        $("#thumb").on("input", function () {
            $(".oldImg").attr("src", "<%=basePath%>" + $("#thumb").val());
        });
    };
</script>


</body>

</html>
