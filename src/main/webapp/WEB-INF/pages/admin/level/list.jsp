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
                <span class="am-icon-list"></span> 信用等级
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
                    <div id="toolbar">
                        <span>当前信用等级：<a id="sum"></a></span>
                    </div>
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
    var sum = 0;
    $('#dataTable').bootstrapTable({
        url: '/level/searchByUser',
        toolbar: "#toolbar",
        columns: [
            {
                field: 'createDate',
                title: '时间',
                formatter: function (val, r) {

                    var d = new Date(val);
                    var curr_day = d.getDate();
                    var curr_month = d.getMonth()+1;
                    var curr_year = d.getFullYear();
                    var curr_hour = d.getHours();
                    var curr_min = d.getMinutes();
                    var curr_sec = d.getSeconds();
                    return curr_year + '-' + curr_month + '-' + curr_day + ' ' + curr_hour + ':' + curr_min + ':' + curr_sec;

                }
            },
            {
                field: 'num',
                title: '增加',
                formatter:function (val) {
                    changeSum(val);
                    return '+' + val;
                },

            },
            {
                field: 'remark',
                title: '备注'
            }
            ]
    });

    function changeSum(val) {
        sum += val;
        $('#sum').text(sum);

    }
</script>

</body>

</html>
