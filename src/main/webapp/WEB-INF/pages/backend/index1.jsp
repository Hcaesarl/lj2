<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>链家二手物品流转平台 | 管理中心</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <!-- bootstrap 3.0.2 -->
    <link href="<%=basePath %>static/admin/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- font Awesome -->
    <link href="<%=basePath %>static/admin/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- Ionicons -->
    <link href="<%=basePath %>static/admin/css/ionicons.min.css" rel="stylesheet" type="text/css"/>
    <!-- Morris chart -->
    <link href="<%=basePath %>static/admin/css/morris/morris.css" rel="stylesheet" type="text/css"/>
    <!-- jvectormap -->
    <link href="<%=basePath %>static/admin/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet"
          type="text/css"/>
    <!-- Date Picker -->
    <link href="<%=basePath %>static/admin/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css"/>
    <!-- fullCalendar -->
    <!-- <link href="<%=basePath %>static/admin/css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
    <!-- Daterange picker -->
    <link href="<%=basePath %>static/admin/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet"
          type="text/css"/>
    <!-- iCheck for checkboxes and radio inputs -->
    <link href="<%=basePath %>static/admin/css/iCheck/all.css" rel="stylesheet" type="text/css"/>
    <!-- bootstrap wysihtml5 - text editor -->
    <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->

    <!-- Theme style -->
    <link href="<%=basePath %>static/admin/css/style.css" rel="stylesheet" type="text/css"/>


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
        .skin-black .sidebar .dropdown-menu a {
            color: #39435C
        }

        .submenu {
            display: none;
        }
    </style>
</head>
<body class="skin-black">
<!-- header logo: style can be found in header.less -->
<header class="header">
    <a href="<%=basePath %>" class="logo">
        链家二手物品流转平台
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" style="background-color: #30a5ff;" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>
        <div class="navbar-right">
            <ul class="nav navbar-nav">
                <!-- Messages: style can be found in dropdown.less-->
                <li>
                    <a href="<%=basePath%>">首页</a>
                </li>
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle">
                        <i class="fa fa-user"></i>
                        <span>欢迎您，${user.username } ！<i class="caret"></i></span>
                    </a>
                    <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                        <li class="dropdown-header text-center">${user.email }</li>


                        <li class="divider"></li>

                        <li>
                            <a target="mainFrame" href="<%=basePath%>users/users/profile">
                                <i class="fa fa-user fa-fw pull-right"></i>
                                个人资料
                            </a>
                            <a target="mainFrame" href="<%=basePath%>users/users/password">
                                <i class="fa fa-cog fa-fw pull-right"></i>
                                安全设置
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="<%=basePath%>backendui/logout?retUrl=login"><i
                                    class="fa fa-ban fa-fw pull-right"></i> 退出系统</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
<div class="wrapper row-offcanvas row-offcanvas-left">
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="left-side sidebar-offcanvas">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="<%=basePath %>static/admin/img/26115.jpg" class="img-circle" alt="User Image"/>
                </div>
                <div class="pull-left info">
                    <p>Hello, ${user.username }</p>

                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>
            <!-- search form -->

            <!-- /.search form -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="active">
                    <a href="<%=basePath %>backendui/index">
                        <i class="fa fa-dashboard"></i> <span>管理菜单</span>
                    </a>
                </li>

                <c:if test="${user.type eq 5 }">
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-users"> </i>
                        用户管理 <span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>users/users/list"> 用户管理 </a></li>
                            <li><a target="mainFrame" href="<%=basePath %>users/users/add"> 用户新增 </a></li>
                            <li><a target="mainFrame" href="<%=basePath %>level/list"> 信用等级 </a></li>
                        </ul>
                    </li>


                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-list-ul"> </i>
                        类别管理 <span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>infocate/infocate/list"> 类别管理 </a></li>
                            <li><a target="mainFrame" href="<%=basePath %>infocate/infocate/add"> 类别新增 </a></li>
                        </ul>
                    </li>

                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-list-ul"> </i>
                        仓库管理 <span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>ck/search/all"> 仓库管理 </a></li>
                        </ul>
                    </li>

                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-th-large"> </i>
                        信息管理 <span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>news/news/list"> 信息管理 </a></li>
                            <li><a target="mainFrame" href="<%=basePath %>news/news/add"> 发布信息 </a></li>
                        </ul>
                    </li>

                    <li class="dropdown"><a href="#" class="dropdown-toggle">
                        <i class="fa fa-file"> </i>
                        物品发布 <span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>goods/goods/list"> 物品息管理 </a></li>
                            <li><a target="mainFrame" href="<%=basePath %>goods/goods/add"> 发布物品 </a></li>
                        </ul>
                    </li>

                    <li class="dropdown"><a href="#" class="dropdown-toggle">
                        <i class="fa fa-file"> </i>
                        订单管理 <span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>ordertab/ordertab/list"> 订单管理 </a></li>

                        </ul>
                    </li>

<%--                    <li class="dropdown"><a href="#" class="dropdown-toggle">--%>
<%--                        <i class="fa fa-file"> </i>--%>
<%--                        滚播图片 <span class="caret"> </span> </a>--%>
<%--                        <ul class="submenu" role="menu">--%>
<%--                            <li><a target="mainFrame" href="<%=basePath %>admin/ads_list.jsp"> 滚播管理 </a></li>--%>
<%--                            <li><a target="mainFrame" href="<%=basePath %>admin/ads_add.jsp"> 发布滚播 </a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>


                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-cog"> </i>
                        反馈信息 <span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">

                            <li><a target="mainFrame" href="<%=basePath %>fixform/fixform/list"> 用户反馈 </a></li>

                        </ul>
                    </li>


                </c:if>

                <c:if test="${user.type eq 1 }">
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-users"> </i>
                        用户管理 <span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>level/list"> 信用等级 </a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-list"> </i>
                        留言反馈管理 <span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>fixform/fixform/mylist"> 我的留言反馈 </a></li>
                            <li><a target="mainFrame" href="<%=basePath %>fixform/fixform/add"> 我要留言反馈 </a></li>
                        </ul>
                    </li>


                    <li class="dropdown"><a href="#" class="dropdown-toggle">
                        <i class="fa fa-ruble  "> </i>
                        物品管理<span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>goods/goods/mylist"> 我的发布 </a></li>
                            <li><a target="mainFrame" href="<%=basePath %>goods/goods/add">发布物品</a></li>
                        </ul>
                    </li>

                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-file"> </i>
                        订单管理<span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>ordertab/ordertab/selflist"> 我的订单 </a></li>

                        </ul>
                    </li>
                </c:if>
                <c:if test="${user.type eq 4 }">
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-users"> </i>
                        用户管理 <span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>level/list"> 信用等级 </a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-list"> </i>
                        留言反馈管理 <span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>fixform/fixform/mylist"> 我的留言反馈 </a></li>
                            <li><a target="mainFrame" href="<%=basePath %>fixform/fixform/add"> 我要留言反馈 </a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle">
                        <i class="fa fa-ruble  "> </i>
                        物品管理<span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>goods/goods/mylist"> 我的发布 </a></li>
                            <li><a target="mainFrame" href="<%=basePath %>goods/goods/add">发布物品</a></li>
                        </ul>
                    </li>

                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-file"> </i>
                        订单管理<span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>ordertab/ordertab/selflist"> 我的订单 </a></li>
                            <li><a target="mainFrame" href="<%=basePath %>ordertab/ordertab/delivery"> 我的配送 </a></li>

                        </ul>
                    </li>
                </c:if>
                <c:if test="${user.type eq 3 }">
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-users"> </i>
                        用户管理 <span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>level/list"> 信用等级 </a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-list"> </i>
                        留言反馈管理 <span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>fixform/fixform/mylist"> 我的留言反馈 </a></li>
                            <li><a target="mainFrame" href="<%=basePath %>fixform/fixform/add"> 我要留言反馈 </a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle">
                        <i class="fa fa-ruble  "> </i>
                        物品管理<span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>goods/goods/mylist"> 我的发布 </a></li>
                            <li><a target="mainFrame" href="<%=basePath %>goods/goods/add">发布物品</a></li>
                            <li><a target="mainFrame" href="<%=basePath %>goods/goods/review">审核物品</a></li>
                        </ul>
                    </li>

                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                    > <i class="fa fa-file"> </i>
                        订单管理<span class="caret"> </span> </a>
                        <ul class="submenu" role="menu">
                            <li><a target="mainFrame" href="<%=basePath %>ordertab/ordertab/selflist"> 我的订单 </a></li>

                        </ul>
                    </li>
                </c:if>


            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>


    <aside class="right-side">

        <!-- Main content -->
        <section class="content">

            <div class="row" style="margin-bottom:5px;">

                <iframe name="mainFrame" id="iframe" style="min-height:1200px;overflow:hidden;" width="100%"
                        height="100%" frameborder="0"></iframe>

            </div>
</div>
<!-- row end -->
</section><!-- /.content -->

</aside><!-- /.right-side -->

</div><!-- ./wrapper -->


<!-- jQuery 2.0.2 -->

<script src="<%=basePath %>static/admin/js/jquery.min.js" type="text/javascript"></script>

<!-- jQuery UI 1.10.3 -->
<script src="<%=basePath %>static/admin/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
<!-- Bootstrap -->
<script src="<%=basePath %>static/admin/js/bootstrap.min.js" type="text/javascript"></script>
<!-- daterangepicker -->
<script src="<%=basePath %>static/admin/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

<script src="<%=basePath %>static/admin/js/plugins/chart.js" type="text/javascript"></script>

<!-- datepicker
<script src="js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>-->
<!-- Bootstrap WYSIHTML5
<script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>-->
<!-- iCheck -->
<script src="<%=basePath %>static/admin/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
<!-- calendar -->
<script src="<%=basePath %>static/admin/js/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>

<!-- Director App -->
<script src="<%=basePath %>static/admin/js/Director/app.js" type="text/javascript"></script>

<!-- Director dashboard demo (This is only for demo purposes) -->
<script src="<%=basePath %>static/admin/js/Director/dashboard.js" type="text/javascript"></script>

<!-- Director for demo purposes -->
<script type="text/javascript">


    $(document).ready(function () {


        $(".dropdown a.dropdown-toggle").click(function () {
            $(".dropdown ul").slideUp();
            $(this).next("ul").slideDown();

        });

    });


    $('input').on('ifChecked', function (event) {
        // var element = $(this).parent().find('input:checkbox:first');
        // element.parent().parent().parent().addClass('highlight');
        $(this).parents('li').addClass("task-done");
        console.log('ok');
    });
    $('input').on('ifUnchecked', function (event) {
        // var element = $(this).parent().find('input:checkbox:first');
        // element.parent().parent().parent().removeClass('highlight');
        $(this).parents('li').removeClass("task-done");
        console.log('not');
    });

</script>
<script>
    $('#noti-box').slimScroll({
        height: '400px',
        size: '5px',
        BorderRadius: '5px'
    });

    $('input[type="checkbox"].flat-grey, input[type="radio"].flat-grey').iCheck({
        checkboxClass: 'icheckbox_flat-grey',
        radioClass: 'iradio_flat-grey'
    });
</script>
</body>
</html>