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
    <link rel="stylesheet" href="<%=basePath %>/static/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath %>/static/admin/css/bootstrap-table.min.css">
    <script src="<%=basePath %>static/assets/js/echarts.min.js"></script>

</head>

<body data-type="index">
<div class="row" style="padding-left:30px;padding-right:30px;">
    <div class="tpl-portlet-components">
        <div class="portlet-title">
            <div class="caption font-green bold">
                <span class="am-icon-list"></span> 用户管理
            </div>
            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon right"></div>
                </div>
            </div>
        </div>

        <div class="tpl-block ">
            <div class="am-g tpl-amazeui-form">
                <div class="am-u-sm-12 am-u-md-12">
                    <table id="dataTable" class="table table-hover"></table>
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
<script src="<%=basePath %>/static/admin/js/bootstrap.js"></script>
<script src="<%=basePath %>/static/admin/js/bootstrap-table.min.js"></script>

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
    $('#dataTable').bootstrapTable({
        url: '/users/searchList',
        columns: [
            {
                field: 'username',
                title: '账号'
            },
            {
                field: 'type',
                title: '类型',
                formatter: function (val, r) {
                    if (val == 1) {
                        return '用户';
                    } else if (val == 5) {
                        return '管理员';
                    }else if (val == 4) {
                        return '配送员';
                    }
                }
            },
            {
                field: 'sex',
                title: '性别',
                formatter:function (val,r) {
                    if (val == 'M') {
                        return '男';
                    } else {
                        return '女';
                    }
                }
            },
            {
                field: 'tel',
                title: '联系电话'
            },
            {
                field: 'email',
                title: '邮箱'
            },
            {
                field: 'address',
                title: '联系地址'
            },
            {
                field: 'created',
                title: '创建日期',
                formatter: function (val, r) {
                    return val.substring(0, 10);
                }
            },
            {
                field: 'id',
                title: '操作',
                formatter: function (val, r) {
                    var _html = '<a class="am-icon-edit" style="margin: 0 3px;color:#32c5d2" href="<%=basePath%>users/users/profile?id=' + val + '" title="编辑"></a>' +
                        '<a class="am-icon-key" style="margin: 0 3px;color:#32c5d2" href="<%=basePath%>users/users/password?id=' + val + '" title="修改密码"></a>' +
                        '<a class="am-icon-trash"  style="margin: 0 3px;color:#32c5d2" href="<%=basePath%>users/users/delete?id=' + val + '&ret=list" title="删除"></a>';
                    return _html;
                }
            }
        ]
    });
</script>

</body>

</html>
