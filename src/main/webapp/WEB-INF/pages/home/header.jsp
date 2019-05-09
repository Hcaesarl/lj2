<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.app.utils.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
    <title>链家二手物品流转平台</title>
    <link href="<%=basePath %>static/home/css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=basePath %>static/slider/js/jquery-1.11.3.min.js"></script>
    <!-- Custom Theme files -->
    <link href="<%=basePath %>static/home/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!--webfont-->

    <script src="<%=basePath %>static/home/js/jquery.easydropdown.js"></script>

    <link href="<%=basePath %>static/slider/css/responsiveslides.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="<%=basePath %>static/slider/js/responsiveslides.min.js"></script>

    <script src="<%=basePath %>static/home/js/easyResponsiveTabs.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

        });
    </script>
    <script type="text/javascript" src="<%=basePath %>static/home/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
            });
        });
    </script>
    <!-- search-scripts -->

    <!-- //search-scripts -->
</head>
<body>
<!-- header-section-starts -->
<div class="header">
    <div class="top-header" style="background:#10c7bf">
        <div class="container">
            <div class="header-left">
                <p>欢迎您访问本网站</p>
            </div>
            <div class="login-section">
                <ul>
                    <c:if test="${user.username==null}">
                        <li><a href="<%=basePath %>backendui/login">我要登录</a></li>
                        |
                        <li><a href="<%=basePath %>backendui/signup">注册账号</a></li>
                    </c:if>
                    <c:if test="${user.username!=null}">
                        <li><a href="<%=basePath %>backendui/index">欢迎您，${user.username }</a></li>
                        <li><a href="<%=basePath %>backendui/logout?retUrl=index">退出系统</a></li>
                        <li id="noticeUl" class="dropdown user user-menu" style="display: none">
                            <a href="#" class="dropdown-toggle">
                                <i class="fa fa-user"></i>
                                <span>您关注的商品有上新<i class="caret"></i></span>
                            </a>
                            <ul id="notice"  class="dropdown-menu dropdown-custom dropdown-menu-right">

                            </ul>
                        </li>
                    </c:if>
                </ul>
            </div>
            <!-- start search-->
            <div class="search-box">

            </div>
            <!-- search-scripts -->

            <!-- //search-scripts -->
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="bottom-header" id="ljtitle">
        <div class="container">
            <div class="logo">
                <a href="<%=basePath %>"><h1>链家二手LJ</h1></a>
            </div>
            <div class="header_bottom_right">
                <!-- start h_menu4 -->
                <div class="h_menu4">
                    <a class="toggleMenu" href="">Menu</a>
                    <ul class="nav">
                        <li class="active"><a href="<%=basePath %>">首页</a></li>
                        <c:forEach items="${requestScope.clist }" var="u" varStatus="st">
                            <li><a href="<%=basePath %>app/news?cateId=${u.id}">${u.title }</a></li>
                        </c:forEach>
                        <c:forEach items="${requestScope.clist1 }" var="u" varStatus="st">
                            <li><a href="<%=basePath %>app/shop?cateId=${u.id}">${u.title }</a></li>
                        </c:forEach>


                    </ul>

                </div>
                <!-- end h_menu4 -->
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- header-section-ends -->
    