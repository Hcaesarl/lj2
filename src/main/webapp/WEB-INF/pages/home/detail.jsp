<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.app.utils.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@include file="header.jsp" %>

<link rel="stylesheet" href="<%=basePath %>/static/admin/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/admin/css/bootstrap-table.min.css">

<style>

    .widget__header {
        padding: 0 15px;
        height: 54px;
        font-family: Montserrat;
        font-size: 14px;
        font-weight: 700;
        line-height: 52px;
        text-transform: uppercase;
        color: #fff;
        background-color: #001a33;
        box-shadow: inset 0 -2px 0 #ffea00;
    }

    .blog-category__link {
        padding: 15px;
        display: block;
        text-decoration: none;
        list-style: none;
    }

    .blog-category__item {
        list-style: none;
    }

    .article__body blockquote {
        position: relative;
        margin-bottom: 3em;
        padding: 52px 20px 60px;
        font-family: Montserrat;
        font-size: 14px;
        font-weight: 700;
        line-height: 1.71429;
        text-align: center;
        text-transform: uppercase;
        color: #204866;
        background-color: #f5f9fc;
    }

    .article__body blockquote:after, .article__body blockquote:before {
        position: absolute;
        font-size: 56px;
        font-weight: 400;
        line-height: 1;
        color: #d6e3ed;
    }

    .btn {
        position: relative;
        padding: 0 33px;
        display: inline-block;
        height: 48px;
        font-size: 13px;
        font-weight: 700;
        line-height: 48px;
        text-align: center;
        vertical-align: middle;
        text-transform: uppercase;
        text-decoration: none;
        color: #02050a;
        background-color: #ffea00;
        border: none;
        border-radius: 2px;
        box-shadow: inset 0 -2px 0 #ffd200;
        transition: background-color .3s;
    }
</style>
<div class="content">
    <div class="dreamcrub">
        <div class="container">
            <ul class="breadcrumbs">
                <li class="home">
                    <a href="<%=basePath %>" title="Go to Home Page">
                        <img src="<%=basePath %>static/home/images/home.png" alt=""></a>&nbsp;
                    <span>&gt;</span>
                </li>
                <li>
                    物品详细
                </li>
            </ul>
            <ul class="previous">
                <li><a href="<%=basePath %>">回到首页</a></li>
            </ul>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="container">


        <div class="col-md-9">
            <article class="article ">
                <figure class="article__figure">
                    <img src="<%=basePath %>${model.thumb }" alt="">
                </figure>
                <header class="article__header">
                    <h2 class="article__title">
                        ${model.product_name }
                    </h2>
                    <div class="article__meta">
                        <div class="article__meta-item">

                            <a style="display:block;height:63px" class="" onclick="open3D('${model.id}')">
                                <button class="add2cart">
                                    <i class="am-icon-search"></i>
                                    <span>| 查看3D视图</span>
                                </button>
                            </a>

                            <a style="display:block;height:63px" class="" onclick="buy(${model.id},${model.u.id},null,'${model.product_name}')">
                                <button class="add2cart">
                                    <i class="white-cart1"></i>
                                    <span>| 点击购买</span>
                                </button>
                            </a>

                        </div>

                    </div>


                </header>
                <div class="article__body">

                    <blockquote>
                        ${model.description }
                        .
                    </blockquote>

                    <p>
                        ${model.content }
                    </p>
                </div>
            </article>
        </div>
        <div class="col-md-3">

            <div class="widget">
                <div class="widget__body">
                    <div class="btn btn-success" style="width:100%;height:150px;line-height:150px;color:#fff;
font-size:38px;
">
<%--                        ￥${model.price }--%>
                    </div>
                </div>
            </div>


            <div class="widget">
                <div class="widget__header">
                    <span class="widget__header-text">物品类目</span>
                </div>
                <div class="widget__body">
                    <div class="blog-category">


                        <ul class="blog-category__list">


                            <c:forEach items="${requestScope.clist }" var="u" varStatus="st">


                                <li class="blog-category__item">
                                    <a href="<%=basePath %>app/shop?cateId=${u.id}" class="blog-category__link">
                                        <span class="blog-category__name">${u.title }</span>

                                    </a>
                                </li>
                            </c:forEach>

                        </ul>
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
<script src="<%=basePath %>/static/admin/js/bootstrap.js"></script>
<script src="<%=basePath %>/static/admin/js/bootstrap-table.min.js"></script>
<script src="<%=basePath%>source/scripts/window.js"></script>

<script>
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

    function open3D(vpath) {
        openWindow("/goods/three/" + vpath);
    }
</script>
<!--content end-->
<jsp:include page="footer.jsp"></jsp:include>