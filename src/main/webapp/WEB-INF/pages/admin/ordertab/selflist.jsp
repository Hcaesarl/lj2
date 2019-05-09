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
                <span class="am-icon-list"></span> 订单管理
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
<%--                            <th>购买人</th>--%>
<%--                            <th>上传人</th>--%>
<%--                            <th>家具</th>--%>
<%--                            <th>价格</th>--%>
<%--                            <th>时间</th>--%>
<%--                            <th>操作</th>--%>
<%--                        </tr>--%>
<%--                        </thead>--%>

<%--                        <tbody>--%>


<%--                        <c:forEach items="${requestScope.list }" var="u">--%>

<%--                            <tr <c:if test="${u.id%2==0 }"> class="am-primary" </c:if> >--%>
<%--                                <td>--%>
<%--                                        ${u.buy.username }--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                        ${u.saler.username }--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                        ${u.gd.product_name }--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                        ${u.price }--%>
<%--                                </td>--%>

<%--                                <td>--%>
<%--                                        ${u.created }--%>
<%--                                </td>--%>


<%--                                <td>--%>
<%--                                    ----%>
<%--                                </td>--%>
<%--                            </tr>--%>

<%--                        </c:forEach>--%>


<%--                        </tbody>--%>
<%--                    </table>--%>

                    <table id="dataTable" class="table table-hover"></table>

                </div>
            </div>
        </div>

    </div>
</div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width: 800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    填写评价
                </h4>
            </div>
            <form id="form" class="am-form">
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">
                    <input type="hidden" name="cuId" id="cuId">
                    <div id="ck1" class="form-group"><label>请评价（1-5）:</label><input type="number" class="form-control" id="num" name="num" min="1" max="5" required></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="btn" onclick="sub()" class="btn btn-primary btntest1">
                        提交
                    </button>
                </div>
            </form>
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
        url: '/ordertab/searchAll?type=2',
        columns: [
            {
                field: 'code',
                title: '订单编号',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
            },
            {
                field: 'id',
                title: '购买人',
                formatter: function (val, r) {
                    return r.buy.username;
                }
            },
            {
                field: 'id',
                title: '上传人',
                formatter: function (val, r) {
                    return r.saler.username;
                }
            },
            {
                field: 'id',
                title: '商品名称',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
                formatter: function (val, r) {
                    return r.gd.product_name;
                }
            },
            {
                field: 'price',
                title: '价格',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
            },
            {
                field: 'num',
                title: '数量',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
            },
            {
                field: 'total',
                title: '合计',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
            },
            {
                field: 'buyer',
                title: '收件人姓名',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
            },
            {
                field: 'tel',
                title: '联系方式',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
            },
            {
                field: 'address',
                title: '收货地址',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
            },
            {
                filed: 'status',
                title: '状态',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
                formatter: function (val, r) {
                    if (r.status == 'N') {
                        return '未发货';
                    } else if (r.status == 'Y') {
                        return '已发货';
                    } else if (r.status == 'D') {
                        return '配送中';
                    } else {
                        return '已签收';
                    }
                }
            },
            {
                filed: 'id',
                title: '操作',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
                formatter: function (val, r) {
                    if (r.status != 'D') {
                        return '';
                    } else  {
                        return '<a class="am-icon-truck"  style="margin: 0 3px;color:#32c5d2" onclick="showModel(' + r.id + ',' + r.cuid + ')"  title="签收"></a>';
                    }
                }
            }
        ]
    });


    function showModel(id,cuId) {

        $('#id').val(id);
        $('#cuId').val(cuId);
        $('#myModal').modal('show');
    }

    function sign(id) {
        var ckId = $('#ck').val();

    }

    function sub() {
        var id = $('#id').val();
        var cuId = $('#cuId').val();
        var num = $('#num').val();
        if (num == '') {
            return false
        }
        $.ajax({
            url: '/ordertab/sign/' + id + '/' + cuId + '/' + num,
            success: function (rsp) {
                var flag = confirm('签收成功！');
                if (flag) {
                    window.location.reload();
                } else {
                    window.location.reload();

                }

            }
        });
    }
</script>

</body>

</html>
