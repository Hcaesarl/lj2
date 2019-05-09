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
                <span class="am-icon-list"></span>  审核物品
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

<%--                    <table class="am-table box-shadow am-table-radius am-table-bordered am-table-hover table-main">--%>
<%--                        <thead>--%>
<%--                        <tr class="am-success">--%>
<%--                            <th class="table-id">#</th>--%>
<%--                            <th class="table-title">物品名称</th>--%>
<%--                            <th class="table-title">类别</th>--%>
<%--                            <th class="table-title">发布人</th>--%>
<%--                            <th class="table-title">价格</th>--%>
<%--                            <th class="table-type">物品图片</th>--%>
<%--                            <th class="table-type">库存管理</th>--%>
<%--                            <th class="table-set">操作</th>--%>
<%--                        </tr>--%>
<%--                        </thead>--%>
<%--                        <tbody>--%>
<%--                        <c:forEach items="${requestScope.list }" var="u" varStatus="st">--%>
<%--                            <tr <c:if test="${u.id%2==0 }"> class="am-primary" </c:if>>--%>
<%--                                <td>${st.index+1 }</td>--%>
<%--                                <td>${u.product_name} </td>--%>
<%--                                <td>${u.c.title} </td>--%>
<%--                                <td>${u.u.username} </td>--%>
<%--                                <td>--%>
<%--                                    ￥${u.price }--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <a target="_blank" href="<%=basePath %>${u.thumb }">查看</a>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <a href="<%=basePath %>ck/ck/list?id=${u.id}">库存管理</a>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <div class="am-btn-toolbar">--%>
<%--                                        <div class="am-btn-group am-btn-group-xs">--%>
<%--                                            <a class="am-btn am-btn-success"--%>
<%--                                               href="<%=basePath %>goods/goods/edit?id=${u.id}"--%>
<%--                                               class="am-btn am-btn-default am-btn-xs am-text-secondary"><span--%>
<%--                                                    class="am-icon-pencil-square-o"></span> 编辑</a>--%>
<%--                                            <a class="am-btn am-btn-primary"--%>
<%--                                               href="<%=basePath %>goods/goods/delete?id=${u.id}"--%>
<%--                                               class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span--%>
<%--                                                    class="am-icon-trash-o"></span> 删除</a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                        </tr>--%>
<%--                        </tbody>--%>
<%--                    </table>--%>

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
        url: '/goods/goods/searchReview',
        height: '80px',
        columns: [
            {
                field: 'product_name',
                title: '名称'
            },
            {
                field: 'categoryName',
                title: '类别'

            },
            {
                field: 'id',
                title: '发布人',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
                formatter: function (val, r) {
                    return r.u.username;
                }
            },
            {
                field: 'isReview',
                title: '是否经过安全审核',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
                formatter: function (val, r) {
                    if (val == 'N') {
                        return '未审核';
                    } else {
                        return '已审核';
                    }
                }
            },
            {
                field: 'thumb',
                title: '物品图片',
                width: '80px',
                formatter: function (val, r) {
                    <%--return '<a target="_blank" href="<%=basePath %>' + val + '">查看</a>';--%>
                    return '<img src="<%=basePath %>' + val + '" width="80px" style="overflow: hidden">';
                }
            },
            {
                filed: 'id',
                title: '操作',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
                formatter: function (val, r) {
                    var _html = '<a class="am-icon-check" style="margin: 0 3px;color:#32c5d2" onclick="changeReview(' + r.id + ',1)" title="合格"></a>' +
                        '<a class="am-icon-times" style="margin: 0 3px;color:#32c5d2" onclick="changeReview(' + r.id + ',2)" title="合格"></a>';
                    return _html;

                }
            }
        ]
    });

    function changeReview(id,type) {
        var t;
        if (type = 1) {
            t = 'Y';
        } else {
            t = 'N';
        }
        $.ajax({
            url: '/goods/goods/changeReview/' + id + '/' + t,
            success: function (rsp) {
                $('#dataTable').bootstrapTable('refresh');
            }
        });
    }

</script>

</body>

</html>
