<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>链家二手物品流转平台</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<%=basePath%>/static/admin/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/admin/css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/admin/css/fullcalendar.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/admin/css/maruti-style.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/admin/css/maruti-media.css" class="skin-color"/>
</head>
<body>
<a href="<%=basePath %>" class="logo" style="color: #fff;padding-top: 5px">
    -----------
</a>
<!-- Header Navbar: style can be found in header.less -->
<nav class="navbar navbar-static-top" role="navigation">
    <!-- Sidebar toggle button-->
    <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </a>
    <div class="navbar-right">
        <ul class="nav navbar-nav">
            <!-- Messages: style can be found in dropdown.less-->
            <li>
                <a style="color: #fff" href="<%=basePath%>">首页</a>
            </li>
            <!-- User Account: style can be found in dropdown.less -->
            <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle">
                    <i class="fa fa-user"></i>
                    <span style="color: #fff">欢迎您，${user.username }|</span>
                </a>
            </li>
            <li class="dropdown user user-menu">
                <a target="mainFrame" href="<%=basePath%>users/users/profile" style="color: #fff">
                    <i class="fa fa-user fa-fw pull-right"></i>
                    个人资料
                </a>
            </li>
            <li class="dropdown user user-menu">
                <a target="mainFrame" href="<%=basePath%>users/users/password" style="color: #fff">
                    <i class="fa fa-cog fa-fw pull-right"></i>
                    安全设置
                </a>
            </li>
            <li class="dropdown user user-menu">

                <a href="<%=basePath%>backendui/logout?retUrl=login" style="color: #fff">
                    <i class="fa fa-cog fa-fw pull-right"></i>
                    安全设置
                </a>
            </li>
        </ul>
    </div>
</nav>
<c:if test="${user.type eq 5 }">

    <div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
        <ul>
            <li class="active"><a><i class="icon icon-home"></i> <span>用户管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>users/users/list"> 用户管理 </a></li>
                    <li><a target="mainFrame" href="<%=basePath %>users/users/add"> 用户新增 </a></li>
                    <li><a target="mainFrame" href="<%=basePath %>level/list"> 信用等级 </a></li>
                </ul>
            </li>

            <li class="active"><a><i class="icon icon-home"></i> <span>类别管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>infocate/infocate/list"> 类别管理 </a></li>
                    <li><a target="mainFrame" href="<%=basePath %>infocate/infocate/add"> 类别新增 </a></li>
                </ul>
            </li>

            <li class="active"><a><i class="icon icon-home"></i> <span>仓库管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>ck/search/all"> 仓库管理 </a></li>
                </ul>
            </li>

            <li class="active"><a><i class="icon icon-home"></i> <span>信息管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>news/news/list"> 信息管理 </a></li>
                    <li><a target="mainFrame" href="<%=basePath %>news/news/add"> 发布信息 </a></li>
                </ul>
            </li>

            <li class="active"><a><i class="icon icon-home"></i> <span>物品管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>goods/goods/list"> 物品信息管理 </a></li>
                    <li><a target="mainFrame" href="<%=basePath %>goods/goods/add"> 发布物品 </a></li>
                </ul>
            </li>

            <li class="active"><a><i class="icon icon-home"></i> <span>订单管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>ordertab/ordertab/list"> 订单管理 </a></li>

                </ul>
            </li>
        </ul>
    </div>
</c:if>
<c:if test="${user.type eq 1 }">

    <div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
        <ul>
            <li class="active"><a><i class="icon icon-home"></i> <span>用户管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>level/list"> 信用等级 </a></li>
                </ul>
            </li>


            <li class="active"><a><i class="icon icon-home"></i> <span>留言反馈管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>fixform/fixform/mylist"> 我的留言反馈 </a></li>
                    <li><a target="mainFrame" href="<%=basePath %>fixform/fixform/add"> 我要留言反馈 </a></li>
                </ul>
            </li>

            <li class="active"><a><i class="icon icon-home"></i> <span>物品管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>goods/goods/mylist"> 我的发布 </a></li>
                    <li><a target="mainFrame" href="<%=basePath %>goods/goods/add">发布物品</a></li>
                </ul>
            </li>

            <li class="active"><a><i class="icon icon-home"></i> <span>订单管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>ordertab/ordertab/selflist"> 我的订单 </a></li>

                </ul>
            </li>
        </ul>
    </div>
</c:if>
<c:if test="${user.type eq 4 }">

    <div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
        <ul>
            <li class="active"><a><i class="icon icon-home"></i> <span>用户管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>level/list"> 信用等级 </a></li>
                </ul>
            </li>


            <li class="active"><a><i class="icon icon-home"></i> <span>留言反馈管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>fixform/fixform/mylist"> 我的留言反馈 </a></li>
                    <li><a target="mainFrame" href="<%=basePath %>fixform/fixform/add"> 我要留言反馈 </a></li>
                </ul>
            </li>

            <li class="active"><a><i class="icon icon-home"></i> <span>物品管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>goods/goods/mylist"> 我的发布 </a></li>
                    <li><a target="mainFrame" href="<%=basePath %>goods/goods/add">发布物品</a></li>
                </ul>
            </li>

            <li class="active"><a><i class="icon icon-home"></i> <span>订单管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>ordertab/ordertab/selflist"> 我的订单 </a></li>
                    <li><a target="mainFrame" href="<%=basePath %>ordertab/ordertab/delivery"> 我的配送 </a></li>

                </ul>
            </li>
        </ul>
    </div>
</c:if>
<c:if test="${user.type eq 3 }">

    <div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
        <ul>
            <li class="active"><a><i class="icon icon-home"></i> <span>用户管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>level/list"> 信用等级 </a></li>
                </ul>
            </li>


            <li class="active"><a><i class="icon icon-home"></i> <span>留言反馈管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>fixform/fixform/mylist"> 我的留言反馈 </a></li>
                    <li><a target="mainFrame" href="<%=basePath %>fixform/fixform/add"> 我要留言反馈 </a></li>
                </ul>
            </li>

            <li class="active"><a><i class="icon icon-home"></i> <span>物品管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>goods/goods/mylist"> 我的发布 </a></li>
                    <li><a target="mainFrame" href="<%=basePath %>goods/goods/add">发布物品</a></li>
                    <li><a target="mainFrame" href="<%=basePath %>goods/goods/review">审核物品</a></li>
                </ul>
            </li>

            <li class="active"><a><i class="icon icon-home"></i> <span>订单管理</span></a>
                <ul>
                    <li><a target="mainFrame" href="<%=basePath %>ordertab/ordertab/selflist"> 我的订单 </a></li>

                </ul>
            </li>
        </ul>
    </div>
</c:if>
<div id="content">
    <iframe name="mainFrame" id="iframe" style="min-height:1200px;overflow:hidden;" width="100%"
            height="100%" frameborder="0"></iframe>
</div>
<script src="<%=basePath%>/static/admin/js/excanvas.min.js"></script>
<script src="<%=basePath%>/static/admin/js/jquery.min.js"></script>
<script src="<%=basePath%>/static/admin/js/jquery.ui.custom.js"></script>
<script src="<%=basePath%>/static/admin/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/static/admin/js/jquery.flot.min.js"></script>
<script src="<%=basePath%>/static/admin/js/jquery.flot.resize.min.js"></script>
<script src="<%=basePath%>/static/admin/js/jquery.peity.min.js"></script>
<script src="<%=basePath%>/static/admin/js/fullcalendar.min.js"></script>
<script src="<%=basePath%>/static/admin/js/maruti.js"></script>
<script src="<%=basePath%>/static/admin/js/maruti.dashboard.js"></script>
<script src="<%=basePath%>/static/admin/js/maruti.chat.js"></script>
<script type="text/javascript">
    // This function is called from the pop-up menus to transfer to
    // a different page. Ignore if the value returned is a null string:
    function goPage(newURL) {

        // if url is empty, skip the menu dividers and reset the menu selection to default
        if (newURL != "") {

            // if url is "-", it is this page -- reset the menu:
            if (newURL == "-") {
                resetMenu();
            }
            // else, send page to designated URL
            else {
                document.location.href = newURL;
            }
        }
    }

    // resets the menu selection upon entry to this page:
    function resetMenu() {
        document.gomenu.selector.selectedIndex = 2;
    }

    function click() {
        $('#ul').toggle();
    }
</script>

</body>

</html>
