<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<%@include file="../../home/header.jsp" %>

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
<%--    <style>--%>
<%--        #ljtitle {--%>
<%--            display: none;--%>
<%--        }--%>
<%--    </style>--%>
</head>

<body data-type="index">


<div class="row" style="padding-left:30px;padding-right:30px;">

    <div class="tpl-portlet-components">
        <div class="portlet-title">
            <div class="caption font-green bold">
                <span class="am-icon-list"></span> 搜索商品
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
                    填写订单
                </h4>
            </div>
            <form id="form">
                <div class="modal-body">
                    <input type="hidden" name="code" id="code">
                    <input type="hidden" name="pname" id="pname">
                    <input type="hidden" name="pid" id="pid">
                    <input type="hidden" name="total" id="total">
                    <input type="hidden" name="cuid" id="cuid">
                    <input type="hidden" name="price" id="price">
                    <div class="form-group"><label>订单编号:<span id="codeSpan"></span></label></div>
                    <div class="form-group"><label>商品名称:<span id="nameSpan"></span></label></div>

                    <div class="form-group"><label>收件人姓名:</label><input class="form-control" type="text" name="buyer"
                                                                        required placeholder=""></div>
                    <div class="form-group"><label>联系方式:</label><input class="form-control" type="text" name="tel"
                                                                       required placeholder=""></div>
                    <div class="form-group"><label>数量:</label><input class="form-control" type="number" min="1"
                                                                     value="1" name="num" id="num" required placeholder="" onchange="changeTotal(this)"></div>
                    <div class="form-group"><label>收货地址:</label><input class="form-control" type="text" name="address"
                                                                       required placeholder=""></div>
                    <div class="form-group"><label>总价:<span id="totalSpan"></span></label></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="sub()" class="btn btn-primary btntest1">
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
<script>
    $('#dataTable').bootstrapTable({
        url: '/goods/searchByName/${goodsName}',
        height: '80px',
        toolbar: "#toolbar",
        columns: [
            {
                field: 'thumb',
                title: '物品图片',
                width: '80px',
                formatter: function (val, r) {
                    <%--return '<a target="_blank" href="<%=basePath %>' + val + '">查看</a>';--%>
                    return '<img src="<%=basePath %>' + val + '" href="<%=basePath %>app/detail?id=' + r.id + '" width="80px" style="overflow: hidden">';
                }
            },
            {
                field: 'product_name',
                title: '名称',
                formatter: function (val,r) {
                    return '<a href="<%=basePath %>app/detail?id=' + r.id + '">' + val + '</a>';

                }
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
            // {
            //     field: 'price',
            //     title: '价格',
            //     align: 'center', // 左右居中
            //     valign: 'middle', // 上下居中
            //     formatter: function (val, r) {
            //         return '<span style="font-size: 18px;font-family: arial;color: #32c5d2;font-weight: bolder">¥' + val + '</span>';
            //     }
            // },
            {
                filed: 'id',
                title: '操作',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
                formatter: function (val, r) {
                    return '<button style="background-color: #32c5d2;color: #fff" onclick="buy(' + r.id+ ',' + r.u.id + ',' + r.price + ',\'' + r.product_name + '\')">立刻购买</button>';

                }
            }
        ]
    });
    if ('${isNo}' == 'Y') {
        var c = confirm('未搜索到此类货品，持续关注，有上新通知我');
        if (c) {
            $.ajax({
                url: '/notice/save/${goodsName}',
                success: function (rsp) {
                    window.history.go(-1);
                }
            });
        }
    }
    var pr;
    function buy(id,cuid,price,name) {
        var code = 'LJ' + new Date().getTime();
        pr = price;
        $('#code').val(code);
        $('#codeSpan').text(code);
        $("#pid").val(id);
        $('#pname').val(name);
        $('#nameSpan').text(name);
        $('#totalSpan').text(price);
        $('#total').val(price);
        $('#price').val(price);
        $('#cuid').val(cuid);
        $('#num').val(1);
        $('#myModal').modal('show');
    }

    function sub() {
        var data = $('#form').serializeArray();
        $.ajax({
            url: '/ordertab/save',
            data: data,
            type: 'POST',
            success: function (rsp) {
                var flag = confirm("订购成功");
                if (flag) {
                    window.location.reload();
                }
            }
        });
    }

    function changeTotal(obj) {
        var num = $(obj).val();
        $('#totalSpan').text(pr * num);
        $('#total').val(pr * num);
    }

</script>
</body>

</html>
