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
    <title>--</title>

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
                <span class="am-icon-list"></span> 库存管理
            </div>
            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon right">
                        <p class="am-text-danger">
                            ${message }</p>
                    </div>
                </div>
            </div>


        </div>
        <div class="tpl-block ">

            <div class="am-g tpl-amazeui-form">


                <div class="am-u-sm-12 am-u-md-12">

                    <form class="am-form am-form-inline" action="<%=basePath %>ck/ck/addst" method="POST">
                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-3 am-form-label">数量</label>
                            <div class="am-u-sm-9">
                                <input type="text" name="num" style="padding: 0" required placeholder="">
                                <input type="hidden" value="${id }" name="pid" required placeholder="">
                                <small></small>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-3 am-form-label">仓库</label>
                            <div class="am-u-sm-9">
                                <select name="sid" style="padding: 0">
                                    <c:forEach items="${requestScope.list }" var="u" varStatus="st">
                                        <option value="${u.id }">
                                                ${u.title }
                                        </option>
                                    </c:forEach>
                                </select>
                                <small></small>
                            </div>
                        </div>
                        <div class="am-form-group">

                            <button class="am-btn am-btn-primary" type="submit">提交</button>
                        </div>
                    </form>

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
        url: '/stores/searchStoresById/${id}',
        columns: [
            {
                field: 'id',
                title: '仓库名称',
                formatter: function (val, r) {
                    return r.ck.title;
                }
            },
            {
                field: 'num',
                title: '库存'
            },
            {
                field: 'id',
                title: '操作',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
                formatter: function (val, r) {
                    return '<a class="am-icon-trash"  style="margin: 0 3px;color:#32c5d2" onclick="delectStores('+r.id+')" title="删除"></a>';
                }
            }
        ]
    });

    function delectStores(id) {
        $.ajax({
            url: '/ck/ck/delete2?id=' + id,
            success: function (rsp) {
                window.location.reload();
            }
        });
    }

</script>

</body>

</html>
