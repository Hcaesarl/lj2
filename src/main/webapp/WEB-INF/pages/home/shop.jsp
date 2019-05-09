<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.app.utils.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    String message = request.getParameter("message");
%>
<%--<jsp:include page="header.jsp"></jsp:include>--%>
<%@include file="header.jsp" %>

<link rel="stylesheet" href="<%=basePath %>/static/admin/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath %>/static/admin/css/bootstrap-table.min.css">
<style type="text/css">
    #banner {
        background: #ffffff url(http://mat1.gtimg.com/campus/login/home-bg01.jpg) no-repeat center top;
        width: 100%;
        height: px;
    }

    #banner .banbox .bd a {
        display: block;
        width: 1200px;
        height: 350px;
        margin: 0 auto;
    }

    .mod-oauth__box-left {
        position: relative;
        width: 360px;
        padding-bottom: 30px;
        text-align: center;
        border: 1px solid #d8dadd;
    }

    /*banner区域*/
    #banner {
        width: 100%;
        height: 560px;
        float: left;
        position: relative;
    }

    #banner .banbox {
        width: 100%;
        height: 560px;
        margin: 0px auto;
    }

    #banner .banbox img {
        width: 100%;
        height: 560px;
    }

    #banner .banbox .banlist {
        width: 100%;
        height: 20px;
        text-align: center; /*margin:315px auto 0px auto; */
        background: url(http://mat1.gtimg.com/edu/scampus/index/ban-xk-bj.png) no-repeat center center;
        position: absolute;
        bottom: 22px;
        left: 22px;
    }

    #banner .banbox .banlist a {
        width: 10px;
        height: 10px;
        margin: 5px 3px;
        background: url(http://mat1.gtimg.com/edu/scampus/index/ban-xk-q.png) no-repeat center center;
        display: inline-block;
        cursor: pointer
    }

    #banner .banbox .banlist a:hover, #banner .banbox .banlist .active {
        background: url(http://mat1.gtimg.com/edu/scampus/index/ban-xk-sd.png) no-repeat center center
    }

    #frame {
        background-color: #ffffff;
        float: right;
        margin-top: 65px;
        margin-right: 15%;
    }
</style>
<!-- footer样式 -->
<style type="text/css">
    #wraper {
        width: 100%;
        height: auto;
        float: left;
        position: relative
    }

    #banner {
        width: 100%;
        height: 560px;
        float: left;
        position: relative;
    }

    #frame {
        background-color: #ffffff;
        float: right;
        margin-top: 65px;
        margin-right: 15%;
    }

    #footer {
        width: 100%;
        height: auto;
        float: left;
        background: #fff;
    }

    #footer .footbox {
        width: 1200px;
        height: auto;
        margin: 0px auto;
    }

    #footer .footbox .hzlx {
        width: 1200px;
        height: 46px;
        margin-top: 20px;
        float: left;
    }

    #footer .footbox .hzlx p {
        font-size: 36px;
        font-family: "微软雅黑";
        text-align: center;
        color: #444444;
    }

    #footer .footbox ul {
        width: 1200px;
        height: auto;
        margin-top: 30px;
        float: left
    }

    #footer .footbox li {
        height: 18px;
        float: left;
        margin-left: 20px;
        margin-right: 20px;
        font-size: 17px;
        line-height: 18px;
        color: #444;
    }

    #footer .footbox .smbox {
        width: 1200px;
        height: 80px;
        margin-top: 30px;
        float: left;
        margin-top: 50px;
        margin-bottom: 100px;
    }


    @charset "utf-8";
    article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary {
        display: block
    }

    audio, canvas, video {
        display: inline-block;
        *display: inline;
        *zoom: 1
    }

    [hidden] {
        display: none
    }

    html {
        font-size: 100%;
        -webkit-text-size-adjust: 100%;
        -ms-text-size-adjust: 100%
    }

    body {
        _height: 100%
    }

    body, div, p, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, form, fieldset, legend, input, textarea, button, select, th, td, blockquote, pre, code, hr, article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary {
        margin: 0;
        padding: 0
    }

    body, button, input, select, textarea {
        font: 12px/1.5 Arial, "Microsoft YaHei", "Hiragino Sans GB", "STHeiti", SimSun
    }

    table {
        border-collapse: collapse;
        border-spacing: 0
    }

    th {
        text-align: inherit
    }

    caption, th {
        text-align: left;
        font-weight: normal
    }

    img {
        border: 0;
        vertical-align: bottom
    }

    iframe {
        display: block;
        border: 0
    }

    ol, ul {
        list-style: none
    }

    a {
        outline: 0;
        text-decoration: none
    }

    a:hover {
        cursor: pointer;
        text-decoration: underline
    }

    em, i {
        font-style: normal
    }

    fieldset {
        border: 0
    }

    button, input, select, textarea {
        vertical-align: baseline;
        *vertical-align: middle;
        outline: 0
    }

    button, html input[type="button"], input[type="reset"], input[type="submit"] {
        -webkit-appearance: button;
        cursor: pointer
    }

    button[disabled], html input[disabled] {
        cursor: default
    }

    input[type="checkbox"], input[type="radio"] {
        box-sizing: border-box
    }

    input[type="search"] {
        -webkit-appearance: textfield;
        -moz-box-sizing: content-box;
        -webkit-box-sizing: content-box;
        box-sizing: content-box
    }

    input[type="search"]::-webkit-search-cancel-button, input[type="search"]::-webkit-search-decoration {
        -webkit-appearance: none
    }

    textarea {
        overflow: auto;
        vertical-align: top
    }

    h1, h2, h3, h4, h5, h6 {
        font-size: 100%;
        font-weight: normal
    }

    hr {
        -moz-box-sizing: content-box;
        box-sizing: content-box;
        height: 0
    }

    mark {
        background: #FF0;
        color: #000
    }

    code, pre {
        font-family: monospace, serif
    }

    pre {
        white-space: pre-wrap
    }

    html {
        color: #333
    }

    .yahei {
        font-family: Arial, "STHeiti", "Microsoft YaHei", SimSun
    }

    .clearfix, .layout {
        zoom: 1
    }

    .clearfix:after, .layout:after {
        visibility: hidden;
        display: block;
        content: ".";
        font-size: 0;
        height: 0;
        clear: both
    }

    a {
        color: #0041d9
    }

    a:hover {
        color: #F60;
        text-decoration: none
    }

    #header {
        width: 100%
    }

    #container, #footer {
        width: 1080px;
        margin: 0 auto
    }

    .sitenav, .site-search, .lp-navtabs-warp, .lp-secnav-box, #header .lp-info, #header .lp-nav, #header .lp-toppic, #header .top-banner {
        width: 1080px;
        margin: 0 auto
    }

    .avoid-blame {
        width: 1010px !important
    }

    .gray {
        color: #999
    }

    .btn {
        display: inline-block;
        *display: inline;
        *zoom: 1;
        border: 0 none;
        cursor: pointer;
        vertical-align: middle;
        border-radius: 3px;
        color: #FFF;
        overflow: hidden;
        background: #62ab00
    }

    .btn:hover {
        color: #FFF;
        background: #599700
    }

    .btn-a {
        padding: 0 9px 0 10px;
        font-size: 14px;
        height: 30px;
        line-height: 30px
    }

    .btn-b {
        padding: 0 29px 0 30px;
        font-size: 18px;
        height: 40px;
        line-height: 40px
    }

    .btn-c {
        border-radius: 3px;
        padding: 0 29px 0 30px;
        font-size: 18px;
        height: 40px;
        line-height: 40px;
        color: #FFF;
        background: #F60
    }

    .btn-c:hover {
        color: #FFF;
        background: #db5700
    }

    .int-text {
        border: 1px solid #CCC;
        background: #FFF;
        vertical-align: middle;
        font-size: 14px;
        height: 40px;
        line-height: 40px \9;
        font-size: 14px;
        padding: 0 10px;
        color: #999;
        font-family: Arial, "STHeiti", "Microsoft YaHei", SimSun
    }

    .int-text-max {
        width: 220px
    }

    .int-text-mid {
        width: 150px
    }

    .int-text-min {
        width: 30px
    }

    .int-focus {
        border: 1px solid #62ab00;
        color: #333
    }

    .int-err {
        border: 1px solid #F00
    }

    .int-blur {
        color: #333
    }

    .com-msg {
        font-size: 12px;
        font-family: Arial, SimSun;
        color: #F00;
        display: none
    }

    .lp-icons {
        display: inline-block;
        font-size: 0;
        overflow: hidden;
        vertical-align: middle;
        background-image: url("//pages.anjukestatic.com/xinfang/img/house/view/viewindex-icons-16.png");
        background-repeat: no-repeat
    }

    .error-icon {
        background-position: -268px -120px;
        width: 14px;
        height: 14px;
        margin-right: 5px
    }

    .date-icon {
        position: absolute;
        right: 10px;
        top: 14px;
        background-position: -267px -85px;
        width: 16px;
        height: 13px;
        cursor: pointer
    }

    .err-tips-icon {
        background-position: -303px -85px;
        width: 32px;
        height: 32px;
        margin-right: 14px
    }

    .ok-tips-icon {
        background-position: -355px -85px;
        width: 32px;
        height: 32px;
        margin-right: 14px
    }

    .warn-tips-icon {
        background-image: url("//pages.anjukestatic.com/xinfang/img/house/comm/tips-sprites.png");
        background-position: 0 -40px;
        width: 32px;
        height: 32px;
        margin-right: 14px
    }

    .i-triangle {
        display: inline-block;
        *display: inline;
        *zoom: 1;
        width: 0;
        height: 0;
        font-size: 0;
        line-height: 0;
        overflow: hidden;
        border-width: 4px;
        border-style: solid dashed dashed dashed;
        border-color: #969695 transparent transparent transparent;
        vertical-align: -1px
    }

    .triangle-up {
        border-style: dashed dashed solid dashed;
        border-color: transparent transparent #969695 transparent;
        vertical-align: 4px;
        border-bottom-width: 5px \9
    }

    .sitenav-warp .line {
        display: inline-block;
        width: 1px;
        height: 15px;
        background: #DDD;
        margin: 0 7px;
        vertical-align: -3px;
        font-size: 0;
        line-height: 0 \9;
        overflow: hidden
    }

    .fl {
        float: left;
        _display: inline
    }

    .fr {
        float: right;
        _display: inline
    }

    .sitenav-warp a {
        color: #666
    }

    .sitenav-warp a:hover {
        color: #F60;
        text-decoration: none
    }

    .sitenav-warp p {
        padding: 0;
        margin: 0
    }

    .sitenav-warp a {
        cursor: pointer
    }

    .sitenav-warp {
        width: 100%;
        height: 44px;
        line-height: 44px;
        color: #666;
        border-bottom: #DDD 1px solid;
        background: #FFF
    }

    .sitenav .hicon, .site-favlist .btn-viewall {
        background-image: url("//pages.anjukestatic.com/xinfang/img/house/comm/sitenav-bg6.png");
        background-repeat: no-repeat
    }

    .sitenav {
        margin: 0 auto
    }

    .sitenav .site-logo {
        display: inline;
        width: 85px;
        height: 25px;
        margin-top: 10px;
        background: url("//pages.anjukestatic.com/xinfang/img/house/comm/logo.svg") no-repeat 0 0;
        background: url("//pages.anjukestatic.com/xinfang/img/house/comm/trans-logo.png") no-repeat 0 0 \0;
        *background: url("//pages.anjukestatic.com/xinfang/img/house/comm/sitenav-bg6.png") no-repeat 0 0;
        background-size: 85px 25px;
        overflow: hidden;
        text-indent: -99999px
    }

    .sitenav .site-nav {
        padding-left: 20px
    }

    .sitenav .site-user .u {
        margin-left: 5px
    }

    .sitenav .site-user-login li {
        float: left
    }

    .sitenav .site-user-login .user-name {
        display: inline-block;
        max-width: 100px;
        _width: 100px;
        height: 16px;
        line-height: 16px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        vertical-align: -3px;
        *vertical-align: -1px
    }

    .sitenav .site-user-login .user-out {
        padding: 0 9px
    }

    .sitenav .site-user-login .user-out em {
        font-family: Simsun, sans-serif, arial;
        display: inline-block
    }

    .sitenav .site-user-login .user-out:hover em {
        color: #666
    }

    .sitenav .site-user-login .user-mail {
        display: inline-block;
        color: #FFF;
        line-height: 15px;
        margin-left: 3px;
        background: #F60;
        border-radius: 3px;
        padding: 0 2px
    }

    .sitenav .site-user-login .line {
        margin: 0 10px;
        *margin-top: 15px
    }

    .sitenav .site-nav a, .site-user-login li {
        font-size: 14px
    }

    .sitenav .site-nav a, .site-user-login .u {
        _display: inline-block
    }

    .site-user, .site-user-login, .site-fav {
        font-size: 14px;
        display: inline-block;
        *display: inline;
        *zoom: 1;
        vertical-align: middle
    }

    .sitenav .hicon {
        display: inline-block;
        *display: inline;
        *zoom: 1;
        font-size: 0;
        line-height: 0;
        vertical-align: middle;
        overflow: hidden
    }

    .sitenav .hicon-trig {
        width: 9px;
        height: 5px;
        background-position: -20px -60px;
        vertical-align: 1px;
        margin-left: 2px
    }

    .sitenav .hicon-user, .sitenav .hicon-heart {
        width: 14px;
        vertical-align: -2px;
        margin-right: 5px;
        *margin-right: 5px
    }

    .sitenav .hicon-user {
        height: 14px;
        background-position: -40px -60px
    }

    .sitenav .hicon-heart {
        height: 12px;
        background-position: -80px -60px
    }

    .sitenav a:hover .hicon-trig {
        background-position: -20px -60px
    }

    .sitenav a:hover .hicon-user {
        background-position: -60px -60px
    }

    .sitenav a:hover .hicon-heart {
        background-position: -100px -60px
    }

    .sitenav .hicon-heart2 {
        width: 40px;
        height: 32px;
        background-position: -120px -60px;
        margin-right: 5px;
        vertical-align: -10px
    }

    .site-user, .site-fav, .site-user-login {
        position: relative;
        z-index: 50
    }

    .site-userlist, .site-favlist, .site-favlist-none, .site-myajk-list {
        position: absolute;
        top: 43px;
        *top: 44px;
        width: 100px;
        padding: 0 10px 15px 23px;
        background: #f7f7f7;
        border: 1px solid #d6d6d6;
        border-radius: 0 0 4px 4px;
        overflow: hidden
    }

    .site-userlist {
        left: -53px;
        line-height: 28px
    }

    .dropdown .list ul {
        border-top: 0
    }

    .site-userlist a {
        display: block;
        font-size: 13px;
        line-height: 18px;
        margin-top: 14px
    }

    .site-favlist, .site-favlist-none {
        right: 0;
        width: 378px;
        padding: 10px;
        line-height: 1.5
    }

    .site-favlist .title {
        color: #999;
        height: 28px;
        line-height: 22px
    }

    .site-favlist a {
        color: #1950b8
    }

    .site-favlist a:hover {
        color: #F60
    }

    .site-favlist .nologin-info {
        border: 1px solid #FC6;
        background: #fefded;
        height: 34px;
        line-height: 34px;
        padding: 0 10px;
        margin-bottom: 10px
    }

    .site-favlist li {
        padding: 10px 0;
        height: 34px;
        cursor: pointer;
        overflow: hidden
    }

    .site-favlist li.hover, .site-favlist li.invalid {
        background: #f8f8f8
    }

    .site-favlist li.invalid {
        cursor: default;
        height: auto
    }

    .site-favlist li .img, .site-favlist li .name, .site-favlist li .desc {
        float: left;
        display: inline
    }

    .site-favlist li .price, .site-favlist li .del {
        float: right;
        display: inline;
        width: 82px;
        text-align: right
    }

    .site-favlist li .name, .site-favlist li .desc {
        width: 246px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis
    }

    .site-favlist li .img {
        margin-right: 5px
    }

    .site-favlist li .name {
        color: #333
    }

    .site-favlist li .name:hover {
        color: #F60
    }

    .site-favlist li .desc {
        color: #999
    }

    .site-favlist li .price {
        color: #F60;
        font-weight: bold
    }

    .site-favlist .ft {
        text-align: right;
        border-top: 1px solid #e6e6e6;
        padding: 5px 0
    }

    .site-favlist .btn-viewall {
        display: inline-block;
        *display: inline;
        *zoom: 1;
        width: 98px;
        height: 23px;
        overflow: hidden;
        text-indent: -99999px;
        font-size: 0;
        background-position: 0 -80px;
        vertical-align: bottom;
        margin-top: 5px
    }

    .site-favlist-none {
        height: 120px;
        line-height: 120px;
        text-align: center;
        overflow: hidden
    }

    .site-favlist-none span {
        zoom: 1
    }

    .site-user-login .hicon-user {
        margin-right: 6px
    }

    .site-user-login .i-triangle {
        margin-left: 7px
    }

    .site-myajk-list {
        left: -8px
    }

    .site-myajk-list a {
        display: block;
        font-size: 13px;
        line-height: 18px;
        margin-top: 14px
    }

    .site-myajk-list .hline {
        display: block;
        font-size: 0;
        line-height: 0;
        height: 0;
        margin: 15px 0 0 -15px;
        border-top: 1px solid #ccc
    }

    .site-myajk-list .user-mail {
        _margin: 5px 0 5px 6px
    }

    .site-user-login .count-mail {
        color: #f60
    }

    .site-user .drop-user {
        display: inline-block;
        *display: inline;
        zoom: 1
    }

    .site-user .drop-user .i-triangle {
        margin-left: 2px
    }

    .site-user .reg {
        margin-left: 7px
    }

    .site-user span, .site-fav span, .site-user-login span {
        zoom: 1
    }

    .site-fav .num {
        color: #666
    }

    .site-fav .drop-fav:hover .num {
        color: #F60
    }

    .site-search .crumb-item {
        width: 432px;
        height: 34px;
        overflow: hidden
    }

    .site-search .crumb-item em {
        font-family: Simsun, sans-serif, arial;
        padding: 0 6px;
        display: inline-block
    }

    .sel-city {
        float: left;
        position: relative;
        z-index: 40;
        margin: 10px 0 0 15px;
        cursor: pointer
    }

    .sel-city .sel-opt {
        display: inline-block;
        height: 22px;
        padding-right: 21px;
        position: relative;
        cursor: pointer
    }

    .sel-city .city {
        display: inline-block;
        color: #666;
        font-size: 14px;
        line-height: 22px
    }

    .sel-city .i-triangle {
        position: absolute;
        top: 9px;
        right: 3px
    }

    .sel-city .triangle-up {
        top: 4px
    }

    .sel-city .city-mod, .sel-city .city-ifr {
        border: 1px solid #d8d8d8;
        width: 322px;
        padding: 7px 13px 0 13px;
        position: absolute;
        top: 21px;
        left: 0;
        background: #f9f9f9;
        overflow: hidden;
        display: none
    }

    .sel-city .city-mod {
        z-index: 40
    }

    .sel-city .city-ifr {
        z-index: 39
    }

    .sel-city .city-mod dl {
        border-bottom: 1px solid #ccc;
        padding: 10px 0 6px;
        line-height: 23px
    }

    .sel-city .city-mod dt {
        width: 72px;
        float: left;
        color: #666
    }

    .sel-city .city-mod dd {
        width: 250px;
        overflow: hidden;
        zoom: 1
    }

    .sel-city .city-mod dd a {
        float: left;
        _display: inline;
        margin: 0 11px 0 0;
        white-space: nowrap
    }

    .sel-city .city-mod .more-city {
        width: 320px;
        text-align: right;
        height: 22px;
        line-height: 14px;
        margin: -3px 0 0;
        background: #f9f9f9
    }

    .sel-city .city-mod a {
        color: #1a519f
    }

    .sel-city .city-mod a:hover {
        color: #f60;
        text-decoration: underline
    }

    .search-box {
        float: right;
        position: relative;
        z-index: 30;
        zoom: 1
    }

    .search-box:after {
        visibility: hidden;
        display: block;
        content: ".";
        font-size: 0;
        height: 0;
        clear: both
    }

    .search-box .input-search {
        float: left;
        width: 370px;
        height: 16px;
        line-height: 16px;
        _line-height: 1.41;
        padding: 8px 10px;
        overflow: hidden;
        border: 1px solid #ccc;
        border-right: 0;
        color: #999;
        border-top-left-radius: 3px;
        border-bottom-left-radius: 3px;
        font-size: 14px
    }

    .search-box .btn-search {
        float: left;
        width: 120px;
        height: 34px;
        font-size: 18px;
        overflow: hidden;
        border: 0;
        background: #f60;
        border-top-right-radius: 3px;
        border-bottom-right-radius: 3px;
        cursor: pointer;
        color: #fff;
        letter-spacing: 4px
    }

    .search-box .btn-search:hover {
        background: #db5700
    }

    .search-box .f-int-focus {
        border-color: #f60;
        border-right: 0 none;
        color: #333
    }

    .brand-itm {
        font-size: 16px;
        color: #f60
    }

    .brand-itm img {
        display: inline-block;
        vertical-align: middle;
        margin: -2px 15px 0 0
    }

    .search-autocomplete .brand-itm a, .search-autocomplete .brand-itm a:hover {
        color: #f60
    }

    .search-autocomplete li.itm {
        display: block;
        height: 50px;
        padding: 10px 10px 0;
        color: #333;
        cursor: pointer
    }

    .search-autocomplete li.hover {
        background: #f6f6f6
    }

    .search-autocomplete .itm strong {
        color: #f60;
        font-weight: normal
    }

    .search-autocomplete .itm i {
        color: #999;
        padding-left: 10px;
        font-size: 10px
    }

    .search-autocomplete .itm p {
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
        cursor: pointer;
        line-height: 18px;
        _line-height: 18px;
        height: 18px;
        position: relative
    }

    .search-autocomplete .itm p.address {
        color: #999;
        font-size: 10px;
        padding-top: 5px
    }

    .search-autocomplete .itm em {
        position: absolute;
        right: 5px;
        color: #999
    }

    .search-autocomplete li.cnt-item {
        width: 370px;
        padding: 0 10px;
        height: 30px;
        line-height: 30px;
        color: #333;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        cursor: pointer
    }

    .search-autocomplete {
        display: none;
        width: 390px;
        border: 1px solid #ddd;
        border-top: 0 none;
        background: #fff;
        color: #333;
        position: absolute;
        left: 0;
        top: 34px;
        z-index: 9
    }

    .search-autocomplete li.cnt-item .hover {
        background: #eee;
        color: #333
    }

    .search-autocomplete li em, .search-autocomplete li.hover em {
        color: #666
    }

    .search-autocomplete, .hot-search-box {
        width: 390px;
        position: absolute;
        z-index: 30;
        left: 0;
        top: 34px;
        display: none;
        border: 1px solid #ccc;
        border-top: 0;
        background: #FFF;
        font-size: 13px;
        overflow: hidden
    }

    .hot-search-box h3 {
        font-weight: 100;
        color: #F60;
        height: 33px;
        line-height: 33px;
        padding: 3px 0 0 10px
    }

    .hot-search-box .hot-list li, .search-autocomplete li {
        height: 33px;
        line-height: 33px;
        padding-left: 10px;
        position: relative;
        cursor: pointer;
        overflow: hidden
    }

    .hot-search-box .hot-list .current {
        background: #EEE;
        cursor: pointer
    }

    .hot-search-box .hot-list em {
        color: #999
    }

    .hot-search-box .aver-price {
        position: absolute;
        right: 10px;
        top: 0;
        color: #999
    }

    .hot-search-box .plate {
        margin-left: 5px
    }

    .search-autocomplete li {
        width: 380px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis
    }

    .search-autocomplete li.hover {
        background: #eee;
        color: #333
    }

    .search-autocomplete li em, .search-autocomplete li.hover em {
        color: #666
    }

    .hot-business {
        color: #60ad00;
        display: block;
        padding-left: 10px
    }

    #header {
        position: relative;
        z-index: 50
    }

    .sitenav .site-logo {
        display: none
    }

    .sitenav .site-nav {
        padding: 0
    }

    .site-search {
        margin-top: 15px
    }

    .site-search:after, .site-search .site-logo:after {
        visibility: hidden;
        display: block;
        content: ".";
        font-size: 0;
        height: 0;
        clear: both
    }

    .site-search, .site-logo {
        zoom: 1
    }

    .site-search .site-logo {
        margin-top: 5px
    }

    .site-search .site-logo .ajk-logo {
        width: 85px;
        height: 25px;
        background: url("//pages.anjukestatic.com/xinfang/img/house/comm/logo.svg") no-repeat 0 0;
        background: url("//pages.anjukestatic.com/xinfang/img/house/comm/trans-logo.png") no-repeat 0 0 \0;
        *background: url("//pages.anjukestatic.com/xinfang/img/house/comm/sitenav-bg6.png") no-repeat 0 0;
        background-size: 85px 25px;
        overflow: hidden;
        text-indent: -99999px
    }

    .site-search .site-logo .xf-logo {
        line-height: 25px;
        font-size: 24px;
        color: #62ab00;
        font-family: "Microsoft YaHei", "微软雅黑", "Hiragino Sans GB", tahoma, arial, simhei
    }

    .site-search .site-logo .ver-line {
        width: 1px;
        height: 24px;
        background: #DDD;
        margin: 2px 15px 0;
        font-size: 0;
        line-height: 0 \9;
        overflow: hidden
    }

    .lp-navtabs-warp {
        margin-top: 15px;
        background: #62ab00;
        height: 40px;
        line-height: 40px;
        font-size: 16px
    }

    .lp-navtabs li {
        float: left;
        _display: inline
    }

    .lp-navtabs li a {
        display: block;
        _display: inline-block;
        height: 40px;
        line-height: 40px;
        padding: 0 24px 0 25px;
        color: #fff;
        position: relative
    }

    .lp-navtabs li a .icon-new {
        display: inline-block;
        width: 27px;
        height: 18px;
        background: url("//pages.anjukestatic.com/xinfang/img/house/view/icon_new.gif") no-repeat;
        position: absolute;
        top: 0;
        right: -9px
    }

    .lp-navtabs li a:hover {
        background: #4a8101;
        color: #fff;
        text-decoration: none
    }

    .lp-navtabs li .item-focus, .lp-navtabs li .item-focus:hover {
        background: #599700;
        color: #fff;
        text-decoration: none
    }

    .lp-secnav-box {
        background: #d9d9d9;
        height: 41px
    }

    .lp-secnav {
        background: #f9f9f9;
        margin: 0 1px;
        font-family: Simsun;
        font-size: 0;
        height: 40px;
        line-height: 40px;
        overflow: hidden
    }

    .lp-secnav a {
        color: #666;
        margin: 0 20px;
        font-size: 14px;
        _display: inline-block
    }

    .lp-secnav a:hover {
        color: #62ab00;
        text-decoration: none
    }

    .lp-secnav .focus {
        color: #62ab00;
        font-weight: 700
    }

    .lp-secnav .line {
        margin: 0
    }

    .lp-toppic {
        padding-bottom: 10px
    }

    .lp-toppic img {
        width: 100%;
        height: 150px;
        vertical-align: bottom;
        display: inline
    }

    .icon-hot {
        display: inline-block;
        width: 27px;
        height: 18px;
        background: url("//pages.anjukestatic.com/xinfang/img/house/view/icon_new.gif") no-repeat;
        position: absolute;
        top: 2px;
        right: -9px
    }

    .tips-box {
        border: 1px solid #febe6f;
        background: #fffcee;
        padding: 5px 20px;
        line-height: 18px;
        font-size: 12px;
        width: 1038px;
        margin: 14px auto -6px;
        color: #666
    }

    .avoid-blame {
        background-color: #f7f7f7;
        color: #999;
        margin: 0 auto 20px;
        width: auto;
        padding: 12px 35px 12px 35px;
        text-align: left
    }

    .footer-infos {
        text-align: center;
        margin: 30px 0 50px
    }

    .footer-infos .intro {
        border-top: 1px solid #e0e0e0;
        padding-top: 15px
    }

    .footer-infos .intro, .footer-infos .copyright {
        margin: 0 auto
    }

    .footer-infos a, .footer-infos a:hover, .footer-infos p {
        color: #666
    }

    .city-plates a, .footer-infos .intro .item {
        display: inline-block;
        *display: inline;
        *zoom: 1
    }

    .footer-infos .intro em {
        padding: 0 10px
    }

    .city-plates {
        border: 1px solid #e0e0e0;
        text-align: left;
        padding: 7px 0 10px 1px;
        margin: 10px 0 0;
        display: none
    }

    .city-plates a {
        width: 86px;
        padding: 0 0 0 10px;
        height: 22px;
        line-height: 22px
    }

    .footer-infos .copyright {
        margin: 8px 0 0
    }

    .footer-infos .copyright a:hover {
        text-decoration: underline
    }

    .footer-infos .copyright span {
        padding: 0 10px
    }

    .modal-ifr {
        width: 100%;
        height: 100%;
        position: absolute;
        z-index: 97;
        top: 0;
        left: 0;
        border: 0 none;
        opacity: 0;
        filter: alpha(opacity=0)
    }

    .modal-mask {
        width: 100%;
        height: 100%;
        position: absolute;
        z-index: 98;
        top: 0;
        left: 0;
        background: #000;
        opacity: .5;
        filter: alpha(opacity=50)
    }

    .modal-cover {
        position: fixed;
        _position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        z-index: 99
    }

    .xf-modal {
        position: absolute;
        top: 50%;
        left: 50%;
        padding: 30px 0
    }

    .xf-modal .con {
        position: relative;
        z-index: 2
    }

    .xf-modal .close {
        position: absolute;
        z-index: 3;
        overflow: hidden
    }

    .modal-custom .con {
        padding: 0 30px;
        border-radius: 6px;
        background: #FFF;
        border: 1px solid #787878;
        font-size: 16px
    }

    .modal-custom .hd {
        height: 46px;
        line-height: 32px;
        padding-top: 27px;
        border-bottom: 2px solid #62ab00
    }

    .modal-custom .hd .title {
        display: inline-block;
        *display: inline;
        font-size: 24px;
        color: #62ab00;
        text-indent: 10px
    }

    .modal-custom .hd .subtitle {
        display: inline-block;
        *display: inline;
        font-size: 14px;
        color: #999;
        margin-left: 10px
    }

    .modal-custom .close {
        top: 61px;
        right: 28px;
        width: 20px;
        height: 20px;
        color: #ccc;
        font-size: 17px;
        padding: 0 0 2px 3px
    }

    .modal-custom .close:hover {
        background-position: -30px -190px
    }

    .xf-select {
        display: inline-block;
        *display: inline;
        *zoom: 1;
        z-index: 9;
        cursor: pointer
    }

    .xf-select .text {
        position: relative;
        background: #FFF;
        height: 40px;
        line-height: 40px;
        border: 1px solid #CCC;
        padding-right: 30px
    }

    .xf-select .text, .xf-select li {
        padding-left: 10px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis
    }

    .xf-select-max {
        font-size: 16px
    }

    .xf-select-min {
        font-size: 14px
    }

    .xf-select-max .text {
        width: 198px
    }

    .xf-select-min .text {
        width: 58px
    }

    .xf-select .text .icon-tip {
        width: 15px;
        height: 8px;
        line-height: 0;
        position: absolute;
        top: 17px;
        right: 8px;
        background-position: -135px -160px
    }

    .xf-select ul {
        display: none;
        position: absolute;
        left: 0;
        top: 41px;
        width: 100%;
        background: #FFF;
        color: #333;
        border-top: 1px solid #CCC;
        border-bottom: 1px solid #CCC;
        overflow-y: auto;
        max-height: 300px;
        _height: 300px
    }

    .xf-select li {
        height: 35px;
        line-height: 35px;
        border-left: 1px solid #CCC;
        border-right: 1px solid #CCC
    }

    .xf-select .option-hv {
        background: #62ab00;
        color: #FFF
    }

    .xf-select .option-dis {
        color: #999;
        cursor: default
    }

    .xf-select-fo {
        position: relative
    }

    .xf-select-fo .text {
        border: 1px solid #62ab00
    }

    .xf-select-fo .text .icon-tip {
        background-position: -110px -160px
    }

    .xf-select-fo ul {
        display: block
    }

    .modal-car-bd {
        padding-bottom: 50px;
        display: none
    }

    .kft-car-step {
        width: 561px;
        height: 87px;
        margin: 10px 0 0;
        background: url("//pages.anjukestatic.com/xinfang/img/house/hui/kft-car-steps.png") no-repeat 0 0
    }

    .modal-car-bd .theme-hd {
        font-size: 20px;
        margin: 22px 0 20px;
        padding-left: 8px
    }

    .modal-car-bd .tips {
        font-size: 16px;
        color: #999;
        padding-left: 8px
    }

    .valid-infos {
        overflow: hidden;
        zoom: 1;
        margin: 25px 0 0
    }

    .valid-infos dt, .valid-infos dd {
        float: left
    }

    .valid-infos dt .required {
        color: #f00
    }

    .valid-infos dt {
        clear: left;
        font-size: 16px;
        width: 170px;
        padding-right: 15px;
        text-align: right;
        line-height: 40px
    }

    .valid-infos .inp-text {
        width: 220px;
        height: 40px;
        border: 1px solid #e6e6e6;
        font-size: 14px;
        padding: 0 10px;
        color: #999
    }

    .valid-infos .int-err {
        border-color: #f00
    }

    .valid-infos .int-focus {
        border-color: #62ab00
    }

    .valid-infos dd .msg-box {
        color: #f00;
        font-size: 12px;
        height: 24px;
        line-height: 24px
    }

    .valid-infos dd .msg-box p {
        display: none
    }

    .valid-btn {
        margin: 6px 0 0;
        padding-left: 180px
    }

    .modal-car-status .apply-tips {
        margin: 0;
        display: none;
        padding: 49px 0 0 46px
    }

    .modal-car-status .apply-tips dt {
        font-size: 20px;
        margin-bottom: 8px
    }

    .modal-car-status .apply-tips dd {
        margin: 0;
        padding: 8px 20px 0 48px;
        font-size: 14px;
        color: #999;
        line-height: 22px
    }

    .apply-tips .err-tips-icon, .apply-tips .ok-tips-icon {
        vertical-align: -8px
    }

    .xf-verify-module {
        margin: 30px 0 0
    }

    .xf-verify-module .j-is-show, .xf-verify-module .j-sms-show {
        display: none
    }

    .xf-verify-module dd, .xf-verify-module dt {
        float: left;
        height: 68px
    }

    .xf-verify-module dt {
        width: 140px;
        line-height: 40px;
        text-align: right;
        padding-right: 10px
    }

    .xf-verify-module dd {
        width: 410px
    }

    .xf-verify-module .required {
        padding-right: 5px;
        color: #f00;
        font-family: "SimSun"
    }

    .xf-verify-module .int-text {
        width: 200px;
        margin-right: 5px
    }

    .xf-verify-module .send-sms-btn {
        display: inline-block;
        width: 130px;
        height: 40px;
        line-height: 40px;
        background: #f4f4f4;
        color: #666;
        border: 1px solid #ededed;
        text-align: center;
        vertical-align: middle;
        border-radius: 3px
    }

    .xf-verify-module .send-sms-btn:hover {
        background: #eee
    }

    .xf-verify-module .refresh-btn {
        display: inline-block;
        cursor: pointer;
        width: 17px;
        height: 17px;
        background: url("//pages.anjukestatic.com/xinfang/img/house/qfj/refresh.png");
        vertical-align: middle
    }

    .xf-verify-module .msg-box {
        display: none
    }

    .xf-verify-module .msg-box span {
        font-size: 12px;
        color: #f00
    }

    .xf-verify-module .j-is-show {
        display: none
    }

    .modal-car-bd-v2 {
        height: 531px;
        padding-bottom: 50px
    }

    .modal-car-bd-v2 .xf-verify-module {
        margin-top: 30px
    }

    .modal-car-bd-v2 .theme-hd {
        font-size: 20px;
        margin: 22px 0 20px;
        padding-left: 8px
    }

    .modal-car-bd-v2 .tips {
        font-size: 16px;
        color: #999;
        padding-left: 8px
    }

    .modal-car-bd-v2 {
        display: none
    }

    .modal-car-status .mail-info {
        width: 560px;
        height: 128px;
        padding: 0;
        margin: 30px 0 20px -96px;
        background-color: #f9f9f9
    }

    .modal-car-status .mail-info p {
        margin: 0;
        color: #666;
        font-size: 18px;
        text-align: left;
        padding: 15px 0 22px 15px
    }

    .modal-car-status .mail-info .com-msg {
        float: left;
        margin-left: 140px
    }

    .modal-car-status .mail-info label {
        color: #333;
        font-size: 16px;
        margin-left: 47px
    }

    .subscribe-mix {
        margin-top: 25px
    }

    .subscribe-mix .tip {
        font-size: 20px;
        text-indent: .4em
    }

    .subscribe-mix .tip .tint {
        color: #999
    }

    .subscribe-mix .notice-list {
        margin: 18px auto 20px auto;
        background-color: #f3f3f3;
        font-size: 16px;
        width: 560px;
        height: 70px
    }

    .subscribe-mix .notice-list li {
        float: left;
        height: 70px;
        line-height: 70px
    }

    .subscribe-mix .notice-list li input {
        width: 16px;
        height: 16px;
        margin: 0 8px 0 8px;
        vertical-align: text-bottom
    }

    .subscribe-mix .notice-list li span {
        margin-right: 11px;
        _display: inline-block
    }

    .subscribe-mix .cell-info, .collect-result .cell-info {
        width: 360px;
        height: 63px;
        margin: 0 auto
    }

    .subscribe-mix .cell-info input, .collect-result .cell-info input {
        width: 240px;
        margin-left: 10px
    }

    .subscribe-mix .cell-info .com-msg, .collect-result .cell-info .com-msg {
        display: block;
        margin: 5px 0 0 104px
    }

    .subscribe-mix a, .collect-result a {
        margin: 10px 0 0 195px;
        _margin-left: 200px
    }

    .subscribe-result {
        height: 35px;
        font-size: 20px;
        margin: 106px auto;
        text-align: center;
        vertical-align: bottom
    }

    .subscribe-result span {
        *zoom: 1;
        vertical-align: middle
    }

    .subscribe-result i, .collect-result i {
        margin-right: 10px
    }

    .subscribe-result .hint-tips-icon {
        width: 32px;
        height: 32px;
        margin-right: 5px;
        background: url(//pages.anjukestatic.com/xinfang/img/house/view/tp-sprites-icon.png) no-repeat -50px 0
    }

    .submail-result {
        margin: 50px auto
    }

    .submail-result .result-text {
        text-align: left;
        text-indent: 50px
    }

    .submail-result .mail-info {
        width: 560px;
        height: 128px;
        padding: 0;
        margin-top: 30px;
        background-color: #f9f9f9
    }

    .submail-result .mail-info p {
        margin: 0;
        color: #666;
        font-size: 18px;
        text-align: left;
        padding: 15px 0 22px 15px
    }

    .submail-result .mail-info .com-msg {
        float: left;
        margin-left: 180px
    }

    .submail-result .mail-info label {
        font-size: 16px
    }

    .collect-result {
        height: auto;
        margin-top: 43px
    }

    .collect-result .result-tip {
        font-size: 20px;
        text-align: center
    }

    .collect-result .result-tip span {
        vertical-align: middle
    }

    .collect-result .result-tip p {
        color: #999;
        font-size: 16px;
        margin: 37px auto 28px auto
    }

    .subscribe-inopen-v2 {
        padding-bottom: 30px
    }

    .xf-verify-module {
        margin: 30px 0 0
    }

    .xf-verify-module .j-is-show, .xf-verify-module .j-sms-show {
        display: none
    }

    .xf-verify-module dd, .xf-verify-module dt {
        float: left;
        height: 68px;
        margin: 0
    }

    .xf-verify-module dt {
        width: 140px;
        line-height: 40px;
        text-align: right;
        padding-right: 10px
    }

    .xf-verify-module dd {
        width: 410px
    }

    .xf-verify-module .required {
        padding-right: 5px;
        color: #f00;
        font-family: "SimSun"
    }

    .xf-verify-module .int-text {
        width: 200px;
        margin-right: 5px
    }

    .xf-img-code img {
        vertical-align: middle
    }

    .xf-verify-module .send-sms-btn {
        display: inline-block;
        width: 130px;
        height: 40px;
        line-height: 40px;
        background: #f4f4f4;
        color: #666;
        border: 1px solid #ededed;
        text-align: center;
        vertical-align: middle;
        border-radius: 3px;
        margin: 0
    }

    .xf-verify-module .send-sms-btn:hover {
        background: #eee
    }

    .xf-verify-module .refresh-btn {
        display: inline-block;
        cursor: pointer;
        width: 17px;
        height: 17px;
        background: url("//pages.anjukestatic.com/xinfang/img/house/qfj/refresh.png");
        vertical-align: middle
    }

    .xf-verify-module .msg-box {
        display: none
    }

    .xf-verify-module .msg-box span {
        font-size: 12px;
        color: #f00
    }

    .collect-result-v2 {
        padding-bottom: 30px
    }

    .collect-result-v2 a {
        margin-left: 150px
    }

    .collect-result-v2 .result-tip {
        padding-left: 50px;
        text-align: left
    }

    #mailsub-success {
        text-align: left;
        text-indent: 51px;
        margin: 49px auto
    }

    html, body {
        _background-image: url(about:blank);
        _background-attachment: fixed
    }

    .site-gotop {
        text-align: center;
        position: fixed;
        z-index: 89;
        left: 50%;
        margin-left: 555px;
        bottom: 100px;
        width: 80px;
        _position: absolute;
        _top: expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight)-200);
        _bottom: auto;
        zoom: 1
    }

    @media screen and (max-width: 1300px) {
        .site-gotop {
            margin-left: 0;
            left: inherit;
            right: 0
        }
    }

    .site-gotop .btn-gotop, .site-gotop .g-icon {
        display: inline-block;
        vertical-align: top;
        *display: inline;
        zoom: 1
    }

    .site-gotop .g-icon {
        font-size: 0;
        line-height: 0;
        overflow: hidden;
        background: url("//pages.anjukestatic.com/xinfang/img/house/comm/sitenav-bg6.png") no-repeat
    }

    .site-gotop .fav i {
        width: 30px;
        height: 28px;
        background-position: -220px -60px;
        margin-bottom: 2px
    }

    .site-gotop .fav-dis i {
        background-position: -180px -60px
    }

    .site-gotop .fav, .site-gotop .feedback, .site-gotop .kf-intention {
        color: #5fac00;
        cursor: pointer
    }

    .site-gotop .fav-dis {
        color: #999;
        cursor: default
    }

    .site-gotop .feedback {
        margin-bottom: 12px
    }

    .site-gotop .feedback i {
        width: 32px;
        height: 32px;
        background-position: -200px 0;
        margin-bottom: 7px
    }

    .site-gotop .btn-gotop i {
        width: 28px;
        height: 16px;
        background-position: -260px -60px;
        margin-top: 17px
    }

    .site-gotop .btn-gotop {
        visibility: hidden;
        width: 50px;
        height: 50px;
        line-height: 50px;
        cursor: pointer;
        margin-top: 4px;
        background: #60ad00;
        border-radius: 2px
    }

    .site-gotop .btn-gotop:hover {
        background: #039500
    }

    .modal-fav-ok .oktit .ok-tips-icon {
        vertical-align: top;
        *vertical-align: middle
    }

    .modal-fav-ok .oktit {
        font-size: 20px;
        line-height: 32px;
        margin: 65px 0 15px 50px
    }

    .modal-fav-ok .desc {
        font-size: 14px;
        color: #999;
        margin-left: 97px
    }

    .modal-fav-ok a {
        color: #0041d9
    }

    .modal-fav-ok a:hover {
        color: #F60
    }

    .tg-banner {
        position: absolute;
        top: -95px;
        left: -10px
    }

    .tg-banner a {
        display: block;
        width: 115px;
        height: 81px;
        background: url("//pages.anjukestatic.com/xinfang/img/house/comm/sitenav-tg.gif") no-repeat 0 0;
        text-indent: -999999px;
        overflow: hidden
    }

    .site-gotop .kf-intention {
        margin-bottom: 18px
    }

    .site-gotop .kf-intention i {
        width: 32px;
        height: 22px;
        background-position: -250px 0;
        margin-bottom: 7px
    }

    .modal-intention-bd, .modal-intention-status, .modal-intention-status-err {
        display: none
    }

    .modal-intention-bd .tips {
        margin: 14px 0 26px 14px
    }

    .modal-intention-bd .area-info, .modal-intention-bd .phone-info, .modal-intention-bd .ways-info {
        height: 72px
    }

    .modal-intention-bd .info .lab-tit {
        float: left;
        width: 182px;
        padding-right: 8px;
        text-align: right;
        line-height: 40px
    }

    .modal-intention-bd .ways-info .radio-box {
        display: inline-block;
        *display: inline;
        *zoom: 1;
        width: 90px;
        margin: 8px 0 0
    }

    .modal-intention-bd .ways-info .radio-text {
        padding-left: 5px
    }

    .modal-intention-bd .area-info .area-box {
        float: left
    }

    .modal-intention-bd .phone-info .lab-tit em {
        color: #F60
    }

    .modal-intention-bd .phone-info .phone-box {
        float: left
    }

    .modal-intention-bd .com-msg {
        margin-top: 4px;
        display: block
    }

    .modal-intention-bd .intention-info {
        height: 113px
    }

    .modal-intention-bd .intention-info textarea {
        float: left;
        width: 220px;
        height: 66px;
        padding: 5px 10px;
        border: 1px solid #ccc;
        font-size: 14px;
        resize: none
    }

    .modal-intention-bd .intention-info .des {
        color: #999
    }

    .modal-intention-bd .intention-info .int-focus {
        border: 1px solid #62ab00;
        color: #333
    }

    .modal-intention-bd .btn-box {
        margin-left: 190px;
        padding-bottom: 36px
    }

    .modal-intention-bd .btn-box .btn-b {
        padding: 0 47px
    }

    .modal-intention-status .apply-tips, .modal-intention-status-err .apply-tips {
        padding: 73px 0 0 50px
    }

    .modal-intention-status .apply-tips dt {
        font-size: 20px;
        margin-bottom: 8px
    }

    .modal-intention-status .apply-tips dd {
        padding: 8px 20px 0 48px;
        font-size: 14px;
        color: #999;
        line-height: 22px
    }

    .apply-tips .err-tips-icon, .apply-tips .ok-tips-icon {
        vertical-align: -8px
    }

    .modal-intention-bd .xf-select ul {
        max-height: 180px;
        _height: 180px
    }

    .site-gotop .conbox {
        cursor: pointer;
        position: relative;
        width: 32px;
        height: 38px;
        line-height: 19px;
        padding: 5px 8px;
        color: #62ab00;
        margin: 5px auto 0 auto;
        font-size: 16px;
        border-radius: 3px;
        background-color: #fff;
        border: 1px solid #62ab00
    }

    .site-gotop .conbox p {
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        margin: auto;
        *top: 5px;
        *left: 8px;
        width: 32px;
        height: 38px;
        position: absolute;
        line-height: 20px;
        vertical-align: text-bottom
    }

    .site-gotop .conbox a {
        color: #62ab00;
        display: block;
        width: 100%;
        height: 100%
    }

    .site-gotop .conbox a:hover {
        text-decoration: none
    }

    .site-gotop .favored {
        color: #999;
        border: 1px solid #e6e6e6
    }

    .site-gotop .consult {
        color: #fff;
        background-color: #62ab00
    }

    .site-gotop .highlight {
        color: #fff;
        background-color: #589600
    }

    .site-gotop .light {
        color: #fff;
        background-color: #5caf00
    }

    .site-gotop .light a {
        color: #fff
    }

    .site-gotop .phoneBanner {
        width: 450px;
        height: 54px;
        overflow: hidden;
        position: absolute;
        top: -1px;
        left: -455px
    }

    .site-gotop .phoneBanner div {
        position: absolute;
        padding: 0 25px;
        left: 450px;
        height: 50px;
        color: #62ab00;
        font-size: 40px;
        line-height: 50px;
        border-radius: 3px;
        vertical-align: middle;
        background-color: #f7fded;
        border: 1px solid #e9f3d9
    }

    .site-gotop .phoneBanner .static {
        left: 0;
        top: 54px
    }

    .site-gotop .phoneBanner div span {
        color: #333;
        font-size: 16px;
        line-height: 50px;
        padding: 0 9px 0 12px;
        vertical-align: middle
    }

    .mailsub-wrap {
        padding: 28px 0 0 11px
    }

    .mailsub-wrap .tip-a {
        color: #666;
        font-size: 18px;
        padding-bottom: 11px
    }

    .mailsub-wrap .tip-b {
        color: #999;
        font-size: 14px
    }

    .mail-info {
        width: 284px;
        height: 70px;
        padding: 27px 0 0 18px
    }

    .mail-info label em {
        color: #f60
    }

    .mail-info .com-msg {
        margin-left: 92px
    }

    .mailsub-wrap .btn-c {
        margin: 2px 0 0 108px
    }

    .icon-entrance {
        width: 98px;
        height: 85px;
        display: block;
        cursor: pointer;
        margin-left: -7px;
        background: url("//pages.anjukestatic.com/xinfang/img/house/view/chat-icon.png") no-repeat;
        background-position: 0 -177px
    }

    a.sweep-code {
        display: block;
        width: 74px;
        height: 114px;
        padding: 3px;
        background: #a1cd66;
        color: #FFF;
        font-size: 14px;
        margin-bottom: 16px
    }

    a.sweep-code:hover {
        background: #62ab00;
        color: #FFF
    }

    .sweep-code .code-img {
        width: 70px;
        height: 70px;
        padding: 2px;
        background: #FFF
    }

    html {
        _background-image: url(about:blank);
        _background-attachment: fixed
    }

    .none {
        display: none !important
    }

    .iframe-layer-mask {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 1001;
        display: none;
        _position: absolute;
        _top: expression(eval(document.documentElement.scrollTop));
        _left: expression(eval(document.documentElement.scrollLeft));
        _height: expression(eval(document.documentElement.clientHeight));
        _width: expression(eval(document.documentElement.clientWidth))
    }

    .iframe-layer-bg {
        position: absolute;
        width: 100%;
        height: 100%;
        background: #000;
        filter: alpha(opacity=60);
        background: rgba(0, 0, 0, .6);
        z-index: 1002
    }

    .iframe-login-wrap {
        margin: -260px 0 0 -250px;
        padding: 0 20px 20px;
        position: absolute;
        top: 50%;
        left: 50%;
        width: 460px;
        height: 500px;
        background: #fff;
        box-shadow: 0 0 8px #888;
        border-radius: 5px;
        z-index: 1003;
        overflow: hidden
    }

    .no-head .iframe-login-wrap {
        height: 440px
    }

    .iframe-login-ifm {
        display: block;
        width: 460px;
        height: 100%
    }

    .no-thirds .iframe-login-wrap {
        margin-top: -230px;
        height: 440px
    }

    .no-thirds.no-head .iframe-login-wrap {
        height: 380px
    }

    .no-others .iframe-login-wrap {
        margin-top: -240px;
        height: 460px
    }

    .no-others.no-head .iframe-login-wrap {
        height: 400px
    }

    .no-thirds.no-others .iframe-login-wrap {
        margin-top: -188px;
        height: 376px
    }

    .no-thirds.no-others.no-head .iframe-login-wrap {
        height: 316px
    }

    .forms-single .iframe-login-wrap {
        margin-top: -229px;
        height: 458px
    }

    .forms-single.no-head .iframe-login-wrap {
        height: 398px
    }

    .forms-single.no-thirds .iframe-login-wrap {
        margin-top: -199px;
        height: 398px
    }

    .forms-single.no-thirds.no-head .iframe-login-wrap {
        height: 338px
    }

    .forms-single.no-others .iframe-login-wrap {
        margin-top: -209px;
        height: 418px
    }

    .forms-single.no-others.no-head .iframe-login-wrap {
        height: 358px
    }

    .forms-single.no-thirds.no-others .iframe-login-wrap {
        margin-top: -165px;
        height: 334px
    }

    .forms-single.no-thirds.no-others.no-head .iframe-login-wrap {
        height: 274px
    }

    .not-in-layer {
        position: static;
        display: block
    }

    .not-in-layer .iframe-layer-bg {
        display: none
    }

    .not-in-layer .iframe-login-wrap {
        position: relative;
        left: 0;
        top: 0;
        margin: 0 auto !important;
        width: 600px;
        height: 470px
    }

    .not-in-layer.no-head .iframe-login-wrap {
        height: 410px
    }

    .not-in-layer .iframe-login-ifm {
        width: 600px
    }

    .not-in-layer.no-thirds .iframe-login-wrap {
        height: 381px
    }

    .not-in-layer.no-thirds.no-head .iframe-login-wrap {
        height: 321px
    }

    .not-in-layer.no-others .iframe-login-wrap {
        width: 460px;
        height: 472px
    }

    .not-in-layer.no-others.no-head .iframe-login-wrap {
        height: 412px
    }

    .not-in-layer.no-others .iframe-login-ifm {
        width: 460px
    }

    .not-in-layer.no-thirds.no-others .iframe-login-wrap {
        height: 381px
    }

    .not-in-layer.no-thirds.no-others.no-head .iframe-login-wrap {
        height: 321px
    }

    .not-in-layer.forms-single .iframe-login-wrap {
        height: 425px
    }

    .not-in-layer.forms-single.no-head .iframe-login-wrap {
        height: 365px
    }

    .not-in-layer.forms-single.no-thirds .iframe-login-wrap {
        height: 334px
    }

    .not-in-layer.forms-single.no-thirds.no-head .iframe-login-wrap {
        height: 274px
    }

    .not-in-layer.forms-single.no-others .iframe-login-wrap {
        width: 460px;
        height: 426px
    }

    .not-in-layer.forms-single.no-others.no-head .iframe-login-wrap {
        height: 366px
    }

    .not-in-layer.forms-single.no-others .iframe-login-ifm {
        width: 460px
    }

    .not-in-layer.forms-single.no-thirds.no-others .iframe-login-wrap {
        height: 334px
    }

    .not-in-layer.forms-single.no-thirds.no-others.no-head .iframe-login-wrap {
        height: 274px
    }

    .loading-item {
        position: relative
    }

    .loading-wrap {
        position: absolute;
        width: 100%;
        top: 50%;
        left: 0;
        margin-top: -47px
    }

    .loading-wrap .loading-tip {
        padding-top: 73px;
        text-align: center;
        font-size: 16px;
        color: #999
    }

    .loading-wrap .loading-progress {
        position: absolute;
        top: 16px;
        left: 50%;
        transform: translate(-50%, 0)
    }

    .spinner {
        position: absolute;
        left: 50%;
        width: 45px;
        height: 45px;
        margin-left: -23px;
        z-index: 2
    }

    .container1 > div, .container2 > div, .container3 > div {
        width: 8px;
        height: 8px;
        background-color: #62ab00;
        border-radius: 100%;
        position: absolute;
        -webkit-animation: bouncedelay 1.2s infinite ease-in-out;
        animation: bouncedelay 1.2s infinite ease-in-out;
        -webkit-animation-fill-mode: both;
        animation-fill-mode: both
    }

    .spinner .spinner-container {
        position: absolute;
        width: 100%;
        height: 100%
    }

    .container2 {
        -webkit-transform: rotateZ(45deg);
        transform: rotateZ(45deg)
    }

    .container3 {
        -webkit-transform: rotateZ(90deg);
        transform: rotateZ(90deg)
    }

    .circle1 {
        top: 0;
        left: 0
    }

    .circle2 {
        top: 0;
        right: 0
    }

    .circle3 {
        right: 0;
        bottom: 0
    }

    .circle4 {
        left: 0;
        bottom: 0
    }

    .container2 .circle1 {
        -webkit-animation-delay: -1.1s;
        animation-delay: -1.1s
    }

    .container3 .circle1 {
        -webkit-animation-delay: -1.0s;
        animation-delay: -1.0s
    }

    .container1 .circle2 {
        -webkit-animation-delay: -0.9s;
        animation-delay: -0.9s
    }

    .container2 .circle2 {
        -webkit-animation-delay: -0.8s;
        animation-delay: -0.8s
    }

    .container3 .circle2 {
        -webkit-animation-delay: -0.7s;
        animation-delay: -0.7s
    }

    .container1 .circle3 {
        -webkit-animation-delay: -0.6s;
        animation-delay: -0.6s
    }

    .container2 .circle3 {
        -webkit-animation-delay: -0.5s;
        animation-delay: -0.5s
    }

    .container3 .circle3 {
        -webkit-animation-delay: -0.4s;
        animation-delay: -0.4s
    }

    .container1 .circle4 {
        -webkit-animation-delay: -0.3s;
        animation-delay: -0.3s
    }

    .container2 .circle4 {
        -webkit-animation-delay: -0.2s;
        animation-delay: -0.2s
    }

    .container3 .circle4 {
        -webkit-animation-delay: -0.1s;
        animation-delay: -0.1s
    }

    @-webkit-keyframes bouncedelay {
        0%, 80%, 100% {
            -webkit-transform: scale(0.0)
        }
        40% {
            -webkit-transform: scale(1.0)
        }
    }

    @keyframes bouncedelay {
        0%, 80%, 100% {
            transform: scale(0.0);
            -webkit-transform: scale(0.0)
        }
        40% {
            transform: scale(1.0);
            -webkit-transform: scale(1.0)
        }
    }

    .spinner-wrap {
        z-index: 2;
        position: absolute;
        top: 0;
        left: 50%;
        margin-left: -26px;
        width: 52px;
        height: 52px;
        background: url(//pages.anjukestatic.com/xinfang/img/affxd/public/loading-img.png) no-repeat center center
    }

    .spinner-wrap .spinner {
        display: none
    }

    .no-stepover .iframe-login-wrap {
        height: 420px
    }

    .no-stepover.no-head .iframe-login-wrap {
        height: 310px
    }

    .user-pa-box {
        display: none;
        font-size: 16px;
        color: #333;
        -webkit-font-smoothing: antialiased
    }

    .user-pa-hint .con {
        height: 320px !important
    }

    .user-pa-header {
        display: none
    }

    .user-pa-show {
        position: relative;
        display: block
    }

    .user-pa-header .pa-label {
        padding-top: 20px
    }

    .user-pa-header .pa-tap {
        font-size: 16px;
        color: #999
    }

    .new-type .pa-flow {
        display: none
    }

    .pa-flow {
        margin-top: 10px;
        background-repeat: no-repeat;
        background-position: 0 0;
        background-size: 100% 100%;
        height: 80px;
        width: 540px
    }

    .user-pa-kanfang .pa-flow {
        background-image: url(//pages.anjukestatic.com/xinfang/img/phoneactivate/kanfang@1x.png);
        background-image: -webkit-image-set(url(//pages.anjukestatic.com/xinfang/img/phoneactivate/kanfang@1x.png) 1x, url(//pages.anjukestatic.com/xinfang/img/phoneactivate/kanfang@2x.png) 2x)
    }

    .user-pa-zhuanche .pa-flow {
        background-image: url(//pages.anjukestatic.com/xinfang/img/phoneactivate/zhuanche@1x.png);
        background-image: -webkit-image-set(url(//pages.anjukestatic.com/xinfang/img/phoneactivate/zhuanche@1x.png) 1x, url(//pages.anjukestatic.com/xinfang/img/phoneactivate/zhuanche@2x.png) 2x)
    }

    .user-pa-zutuan .pa-flow {
        background-image: url(//pages.anjukestatic.com/xinfang/img/phoneactivate/zutuan@1x.png);
        background-image: -webkit-image-set(url(//pages.anjukestatic.com/xinfang/img/phoneactivate/zutuan@1x.png) 1x, url(//pages.anjukestatic.com/xinfang/img/phoneactivate/zutuan@2x.png) 2x)
    }

    .user-pa-youhui .pa-flow {
        background-image: url(//pages.anjukestatic.com/xinfang/img/phoneactivate/youhui@1x.png);
        background-image: -webkit-image-set(url(//pages.anjukestatic.com/xinfang/img/phoneactivate/youhui@1x.png) 1x, url(//pages.anjukestatic.com/xinfang/img/phoneactivate/youhui@2x.png) 2x)
    }

    .pa-label-sec {
        padding-top: 15px;
        color: #999
    }

    .user-pa-wenda .pa-label {
        color: #999;
        font-size: 18px;
        padding-top: 26px
    }

    .pa-discount {
        color: #f60
    }

    .user-pa-verify {
        height: 315px;
        overflow: hidden;
        position: relative
    }

    .user-pa-verify .loading-wrap {
        margin-top: -47px;
        display: none
    }

    .user-pa-verify .iframe-login-ifm {
        margin: 0 auto;
        height: 315px;
        margin-left: 60px
    }

    .user-pa-verify .iframe-bind-ifm {
        width: 540px;
        margin-left: -40px
    }

    #pa-iframe-box {
        height: 315px;
        overflow: hidden
    }

    .pa-book {
        display: none;
        background-color: #f9f9f9;
        border-radius: 10px;
        margin-top: 10px;
        height: 162px;
        padding: 14px 20px;
        margin-bottom: 15px
    }

    .pa-book .pa-book-row {
        height: 54px;
        line-height: 54px;
        font-size: 16px;
        color: #666
    }

    .pa-book-row .iconfont {
        font-size: 40px;
        color: #5eab00
    }

    .pa-book-one {
        float: left
    }

    .pa-book-title {
        font-size: 18px;
        color: #333;
        margin: 0 20px 0 15px
    }

    .user-pa-book .pa-label-sec {
        padding: 0;
        line-height: 40px;
        display: block
    }

    .user-pa-subscribe .pa-notice {
        margin-top: 20px;
        background-color: #f6f6f6;
        font-size: 16px;
        width: 100%;
        height: 50px
    }

    .pa-notice li {
        float: left;
        height: 50px;
        line-height: 50px;
        margin-left: 15px
    }

    .pa-notice li input {
        width: 16px;
        height: 16px;
        margin-right: 5px;
        vertical-align: text-bottom
    }

    .user-apply-modal {
        display: none
    }

    .user-am-msg {
        padding: 50px 0 0 40px
    }

    .user-am-msg .suc-icon {
        float: left;
        height: 60px;
        line-height: 60px;
        font-size: 60px;
        color: #62ab00
    }

    .user-am-msg .am-msg-box {
        margin-left: 80px
    }

    .am-msg-label, .am-msg-comment {
        height: auto;
        line-height: 30px;
        font-size: 16px;
        color: #666
    }

    .am-msg-comment {
        padding-top: 5px;
        font-size: 14px;
        color: #999
    }

    .am-msg-middle .am-msg-label {
        line-height: 60px;
        height: 60px
    }

    .am-msg-middle .am-msg-comment {
        display: none
    }

    .am-msg-comment .comfirm-btn {
        display: block;
        background-color: #62ab00;
        width: 75px;
        line-height: 30px;
        text-align: center;
        color: #fff;
        margin-top: 10px;
        font-size: 14px;
        border-radius: 3px
    }

    .user-confrim-label {
        font-size: 18px;
        color: #333;
        padding-top: 30px
    }

    .user-confrim-tips {
        color: #999;
        padding-top: 15px;
        font-size: 18px
    }

    .user-confrim-btn {
        margin: 60px 40px 0;
        background: #62ab00;
        color: #fff;
        line-height: 50px;
        height: 50px;
        text-align: center;
        font-size: 16px;
        cursor: pointer
    }

    .filter-nav {
        margin: 30px 0 0
    }

    .filter-nav a {
        color: #333
    }

    .fliter-tab {
        position: relative
    }

    .fliter-tab a {
        display: inline-block;
        *display: inline;
        *zoom: 1;
        height: 26px;
        line-height: 16px;
        font-size: 16px;
        text-align: center;
        padding-top: 9px
    }

    .fliter-tab .curr {
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        border: 1px solid #DDD;
        border-bottom: 0;
        background: #FFF;
        padding: 9px 20px 0;
        cursor: default
    }

    .fliter-tab .map {
        padding-left: 15px
    }

    .fliter-tab .skip {
        font-size: 14px;
        position: absolute;
        right: 10px;
        top: 0;
        color: #666
    }

    .fliter-tab .skip:hover {
        color: #F60
    }

    .fliter-tab .lt-icons {
        height: 15px;
        margin-right: 5px
    }

    .fliter-tab .list-ico {
        width: 15px;
        background-position: -30px 0
    }

    .fliter-tab .map-ico {
        width: 11px;
        background-position: -50px 0
    }

    .filter-mod {
        border: 1px solid #DDD;
        margin-top: -1px;
        padding: 0 18px;
        *zoom: 1
    }

    .filter-mod dl {
        padding: 8px 0 15px 0
    }

    .filter-mod:after {
        clear: both;
        content: ".";
        display: block;
        font-size: 0;
        height: 0;
        line-height: 0;
        visibility: hidden
    }

    .filter-mod dt, .filter-mod dd {
        font-size: 14px;
        line-height: 32px
    }

    .filter-mod dt {
        float: left;
        width: 52px
    }

    .filter-mod dd {
        overflow: hidden;
        zoom: 1
    }

    .filter-mod a, .filter-mod span {
        display: inline-block;
        *display: inline;
        *zoom: 1;
        margin-right: 8px
    }

    .filter-mod a:hover, .filter-mod span {
        color: #F60
    }

    .filter-mod .filter-item {
        position: relative;
        zoom: 1;
        padding-left: 0
    }

    .filter-item span {
        font-weight: 700
    }

    .filter-plate {
        border: 1px solid #DDD;
        padding: 2px 0 0 10px;
        margin: 3px 0 8px
    }

    .filter-plate .letter {
        color: #F60
    }

    .tuangou_entry .group-hd {
        padding: 13px 0 0 20px
    }

    .tuangou_entry .group-hd .chk-more {
        font-size: 14px;
        color: #999;
        position: absolute;
        right: 20px;
        top: 13px
    }

    .tuangou_entry .group-hd .chk-more:hover {
        color: #F60
    }

    .tuangou_entry .group-wrapbox {
        overflow: hidden;
        zoom: 1;
        height: auto;
        *position: relative;
        margin-top: -1px
    }

    .tuangoulist a {
        display: block;
        width: 210px;
        height: 205px;
        padding: 15px 18px 0 20px;
        text-decoration: none;
        background: #fff;
        color: #333;
        cursor: pointer
    }

    .tuangoulist a:hover {
        background: #f9f9f9;
        text-decoration: none
    }

    .tuangoulist .loupaninfo {
        height: 20px;
        line-height: 20px;
        margin-top: 8px
    }

    .tuangoulist .tginfo {
        height: 32px;
        line-height: 32px;
        color: #999;
        overflow: hidden;
        *zoom: 1
    }

    .tuangoulist .tginfo strong {
        float: left;
        font-size: 16px;
        font-weight: 100;
        color: #f60
    }

    .tuangoulist .tginfo span {
        float: right
    }

    .tuangoulist .line {
        display: block;
        margin: 0 auto;
        width: 210px;
        height: 0;
        line-height: 0;
        font-size: 0;
        border-bottom: 1px dotted #ddd;
        overflow: hidden
    }

    .build-mod {
        margin-bottom: 20px;
        padding: 0 19px;
        line-height: 22px
    }

    .build-mod h3 {
        padding: 11px 0 12px
    }

    .build-mod .list-box {
        color: #999
    }

    .build-mod .list-date {
        border-top: 1px dashed #ccc;
        padding: 14px 0 12px
    }

    .build-mod .list-item {
        padding-bottom: 16px
    }

    .build-mod .list-item .item-name {
        float: left;
        width: 120px;
        height: 22px;
        overflow: hidden;
        white-space: normal;
        word-break: break-all;
        word-wrap: break-word
    }

    .build-mod .list-item .item-name a {
        color: #666
    }

    .build-mod .list-item .item-name a:hover {
        color: #f60
    }

    .build-mod .list-item .item-price {
        width: 85px;
        float: right;
        text-align: right;
        white-space: nowrap
    }

    .build-mod .list-item .item-price em {
        color: #f60
    }

    .build-mod .list-item:after {
        clear: both;
        content: ".";
        display: block;
        font-size: 0;
        height: 0;
        line-height: 0;
        visibility: hidden
    }

    .build-mod .list-item {
        *zoom: 1
    }

    .price-trend {
        margin-bottom: 10px;
        padding: 13px 10px 20px;
        border: 1px solid #ddd
    }

    .price-trend a:hover {
        text-decoration: none
    }

    .price-trend h3 {
        margin-bottom: 15px;
        color: #666;
        font-size: 16px;
        font-weight: 700
    }

    .price-trend p {
        padding: 0;
        margin: 0;
        line-height: 18px;
        color: #999
    }

    .price-trend p em {
        color: #f60
    }

    .price-trend p .down {
        color: #61ab00
    }

    .price-trend .chart {
        overflow: hidden;
        width: 210px;
        height: 100px;
        margin-top: 15px
    }

    .wide-price-trend a:hover {
        text-decoration: none
    }

    .list-recomm {
        margin: 25px 0 0
    }

    .list-recomm .info-item:after {
        clear: both;
        content: ".";
        display: block;
        font-size: 0;
        height: 0;
        line-height: 0;
        visibility: hidden
    }

    .list-recomm .info-item {
        *zoom: 1
    }

    .list-recomm .info-item label, .list-recomm .info-item a {
        font-size: 14px
    }

    .list-recomm .info-item label {
        float: left;
        width: 80px;
        padding-left: 18px
    }

    .list-recomm .info-item ul {
        overflow: hidden;
        zoom: 1
    }

    .list-recomm .info-item li {
        float: left;
        white-space: nowrap;
        margin-bottom: 5px
    }

    .list-recomm .info-item a, .list-recomm .info-item em {
        padding-left: 8px;
        color: #999
    }

    .list-recomm .info-item a:hover {
        color: #F60
    }

    .info-item-mod {
        padding-bottom: 10px;
        overflow: hidden;
        zoom: 1
    }

    .info-item-mod .item {
        display: none
    }

    .list-recomm .info-item .info-item-mod a, .list-recomm .info-item .info-item-mod .area-item {
        display: inline-block;
        white-space: nowrap;
        margin: 0 0 5px 0
    }

    .list-recomm .info-item .info-item-mod .area-item {
        color: #999;
        padding-left: 8px;
        font-size: 14px;
        cursor: pointer
    }

    .listarea-mod {
        margin-top: 10px
    }

    .listarea-mod p {
        font-size: 16px;
        color: #999;
        border-bottom: 2px solid #62ab00;
        line-height: 30px;
        margin-bottom: 20px;
        text-align: center;
        padding-bottom: 10px
    }

    .listarea-mod p, .listarea-mod p a {
        color: #999
    }

    .listarea-mod p a:hover {
        color: #F60
    }

    .region-item:after, .region-item .nav:after {
        clear: both;
        content: ".";
        display: block;
        font-size: 0;
        height: 0;
        line-height: 0;
        visibility: hidden
    }

    .region-item .region-mod {
        overflow: hidden;
        zoom: 1;
        font-size: 14px
    }

    .region-item .region-mod a {
        color: #999;
        padding-left: 8px;
        white-space: nowrap;
        margin-bottom: 20px;
        display: inline-block;
        *display: inline;
        *zoom: 1
    }

    .region-item .region-mod a:hover {
        color: #F60
    }

    .region-item label, .region-item .nav li, .region-mod li {
        float: left;
        font-size: 14px
    }

    .region-item label {
        color: #333;
        width: 80px;
        padding-left: 18px
    }

    .region-item .clip .item {
        display: none
    }

    .seo_common {
        border-top: #ddd 1px solid;
        background-color: #f9f9f9;
        padding: 10px 20px 10px 20px;
        *padding: 10px 20px 5px 20px;
        line-height: 20px;
        overflow: hidden;
        position: relative;
        zoom: 1
    }

    .seo_common span {
        display: block;
        float: left;
        width: 70px
    }

    .seo_common ul {
        float: left;
        width: 860px;
        list-style: none
    }

    .seo_common li, #footer .seo_topic a {
        float: left;
        width: auto;
        height: 20px;
        text-align: left;
        overflow: hidden
    }

    .seo_common a {
        color: #999
    }

    .seo_common a:hover {
        color: #eb6100
    }

    .seo_partner li {
        width: 85px
    }

    .item-mod {
        padding: 20px 20px 30px;
        border-bottom: 1px dashed #ddd;
        *zoom: 1;
        cursor: pointer
    }

    .item-mod:after {
        clear: both;
        content: ".";
        display: block;
        font-size: 0;
        height: 0;
        line-height: 0;
        visibility: hidden
    }

    .item-mod .F-pic {
        float: left;
        position: relative;
        z-index: 2
    }

    .item-mod .F-pic .jingping-ico {
        position: absolute;
        top: 0;
        left: 0;
        width: 40px;
        height: 20px;
        line-height: 20px;
        font-size: 12px;
        font-family: Simsun;
        text-align: center;
        color: #fff;
        background: #000;
        filter: alpha(opacity=75);
        opacity: .75
    }

    .item-mod .F-info {
        float: left;
        padding: 0 0 0 20px;
        width: 460px;
        line-height: 28px
    }

    .item-mod .F-info dt {
        white-space: normal;
        word-break: break-all;
        word-wrap: break-word;
        font-size: 18px;
        margin: -5px 0 9px;
        _margin-top: 0
    }

    .item-mod .F-info .list-icons {
        display: inline-block;
        padding: 0 2px 0 3px;
        height: 16px;
        line-height: 16px;
        font-size: 12px;
        font-family: Simsun;
        color: #fff;
        vertical-align: 3px;
        _vertical-align: 5px
    }

    .item-mod .F-info .duotu-ico {
        background: #59b200
    }

    .item-mod .F-info .tuangou-ico {
        background: #f60
    }

    .item-mod .F-info dd {
        color: #666;
        height: 28px;
        line-height: 28px;
        overflow: hidden;
        zoom: 1
    }

    .item-mod .F-price {
        float: right;
        width: 128px;
        text-align: right;
        font-size: 14px;
        color: #666;
        padding-top: 40px
    }

    .item-mod .F-price em {
        font-size: 30px;
        padding-right: 7px;
        color: #f60
    }

    .item-hover {
        background: #f9f9f9
    }

    .item-hover .F-info dt a {
        color: #f60
    }

    .no-result {
        height: 170px;
        line-height: 170px;
        background: #f9f9f9;
        border-bottom: 1px dashed #ccc;
        color: #61ab00;
        font-size: 16px;
        padding-left: 20px
    }

    .pagination {
        margin: 10px 0;
        font-size: 0;
        margin-right: -10px
    }

    .pagination a, .pagination a:hover {
        text-decoration: none;
        color: #999
    }

    .pagination a:hover {
        background: #62ab00;
        border: 1px solid #62ab00;
        color: #FFF
    }

    .pagination span, .pagination a {
        display: inline-block;
        text-align: center;
        font-size: 14px;
        line-height: 28px;
        border-radius: 2px;
        margin-right: 10px;
        vertical-align: top
    }

    .pagination a {
        border: 1px solid #CCC;
        color: #999
    }

    .pagination a, .pagination .curr-page {
        width: 28px;
        height: 28px
    }

    .pagination .prev-page {
        width: 62px;
        height: 28px
    }

    .pagination .stat-disable {
        color: #ccc;
        border: 1px solid #CCC
    }

    .pagination .stat-link {
        color: #999
    }

    .pagination .prev-page-link:hover {
        color: #FFF
    }

    .pagination .curr-page {
        border: 1px solid #62ab00;
        background: #62ab00;
        color: #fff;
        font-weight: 700
    }

    .pagination .next-page {
        background: #CCC;
        width: 82px;
        height: 30px;
        line-height: 30px;
        color: #FFF;
        font-weight: 700;
        font-family: '\5B8B\4F53';
        border: 0
    }

    .pagination .next-link {
        background: #62ab00
    }

    .pagination .next-link:hover {
        border: 0;
        background: #4a8101
    }

    .pagination .ellipsis {
        width: 18px;
        color: #777;
        font-weight: 700
    }

    .pagination .multi {
        width: auto;
        padding: 0 5px
    }

    .btm-filter {
        border: 1px solid #ddd;
        padding: 13px 0 11px 20px;
        line-height: 30px;
        margin-top: 40px
    }

    .btm-filter h3 {
        font-size: 16px
    }

    .btm-filter dl {
        margin-top: 4px;
        overflow: hidden;
        zoom: 1
    }

    .btm-filter dt {
        float: left;
        color: #666
    }

    .btm-filter dd {
        overflow: hidden;
        zoom: 1
    }

    .btm-filter a {
        color: #333;
        margin-right: 10px;
        display: inline-block;
        white-space: normal;
        word-break: break-all;
        word-wrap: break-word
    }

    .new-kaipan {
        border: 1px solid #e7e7e7;
        border-radius: 5px;
        padding: 13px 0 0 14px;
        line-height: 30px;
        margin-bottom: 20px;
        line-height: 22px
    }

    .new-kaipan h3 {
        font-size: 16px;
        padding-bottom: 14px;
        color: #666
    }

    .new-kaipan ul li {
        color: #999;
        padding-bottom: 15px;
        overflow: hidden;
        zoom: 1;
        width: 100%
    }

    .new-kaipan ul li span {
        float: left;
        height: 22px;
        overflow: hidden
    }

    .new-kaipan ul .li1 {
        width: 125px;
        padding-right: 4px
    }

    .new-kaipan ul .li2 {
        width: 38px
    }

    .new-kaipan ul .li3 em {
        color: #f60
    }

    .new-kaipan ul li a {
        color: #666
    }

    .new-kaipan ul li a:hover {
        color: #f60
    }

    .new-list-recomm {
        margin: 25px 0 -25px
    }

    .new-list-recomm .info-item:after {
        clear: both;
        content: ".";
        display: block;
        font-size: 0;
        height: 0;
        line-height: 0;
        visibility: hidden
    }

    .new-list-recomm .info-item {
        *zoom: 1
    }

    .new-list-recomm .info-item label, .new-list-recomm .info-item a {
        font-size: 14px
    }

    .new-list-recomm .info-item label {
        float: left;
        width: 80px;
        padding-left: 18px
    }

    .new-list-recomm .info-item ul {
        overflow: hidden;
        zoom: 1
    }

    .new-list-recomm .info-item li {
        float: left;
        white-space: nowrap;
        margin-bottom: 5px
    }

    .new-list-recomm .info-item a, .new-list-recomm .info-item em {
        padding-left: 8px;
        color: #999
    }

    .new-list-recomm .info-item a:hover {
        color: #F60
    }

    .new-item-mod {
        padding-bottom: 10px;
        overflow: hidden;
        zoom: 1
    }

    .new-item-mod .item {
        display: none
    }

    .new-list-recomm .info-item .new-item-mod a, .new-list-recomm .info-item .new-item-mod .area-item {
        display: inline-block;
        white-space: nowrap;
        margin: 0 0 5px 0
    }

    .new-list-recomm .info-item .new-item-mod .area-item {
        color: #999;
        padding-left: 8px;
        font-size: 14px;
        cursor: pointer
    }

    .side-switch-mod {
        border: 1px solid #e7e7e7;
        border-radius: 5px;
        margin-bottom: 20px;
        padding: 25px 0;
        width: 248px;
        height: 200px;
        position: relative
    }

    .side-switch-mod .clip {
        height: 200px
    }

    .side-switch-mod .banner-box {
        width: 210px;
        height: 200px;
        margin: 0 auto;
        overflow: hidden
    }

    .side-switch-mod .banner-item {
        display: block;
        width: 210px;
        height: 200px
    }

    .side-switch-mod .banner-item img {
        width: 100%;
        height: 100%
    }

    .side-switch-mod:after {
        clear: both;
        content: ".";
        display: block;
        font-size: 0;
        height: 0;
        line-height: 0;
        visibility: hidden
    }

    .side-switch-mod {
        *zoom: 1
    }

    #container {
        font-size: 14px
    }

    .lt-icons {
        display: inline-block;
        font-size: 0;
        overflow: hidden;
        vertical-align: middle;
        background-image: url(//pages.anjukestatic.com/xinfang/img/house/list/list_icons_1.png);
        background-repeat: no-repeat
    }

    .list-contents {
        *zoom: 1;
        margin: 30px 0 0
    }

    .list-contents:after {
        clear: both;
        content: ".";
        display: block;
        font-size: 0;
        height: 0;
        line-height: 0;
        visibility: hidden
    }

    .sort-mod a, .key-sort a, .F-list a {
        color: #333
    }

    .sort-mod a:hover, .key-sort a:hover, .F-list a:hover {
        color: #f60
    }

    .list-results {
        float: left;
        width: 810px
    }

    .list-advs {
        float: right;
        width: 250px
    }

    .sort-mod {
        height: 35px;
        line-height: 34px
    }

    .sort-tabs a {
        display: inline-block;
        border: 1px solid #ddd;
        border-bottom: 0 none;
        font-size: 16px;
        padding: 0 39px;
        margin-right: 6px
    }

    .sort-tabs a:hover {
        border: 1px solid #61ab00;
        border-bottom: 0 none;
        color: #61ab00
    }

    .sort-tabs .cur {
        border: #61ab00 1px solid;
        border-bottom: 0 none;
        background: #61ab00;
        color: #fff
    }

    .sort-tabs .cur:hover {
        color: #fff
    }

    .sort-page {
        padding-right: 19px
    }

    .sort-page a {
        font-size: 14px;
        color: #666;
        margin-left: 12px
    }

    .key-sort {
        height: 43px;
        line-height: 43px;
        border: 1px solid #DDD;
        border-top: 2px solid #62ab00
    }

    .sort-items a {
        float: left;
        display: inline;
        margin-left: 20px
    }

    .sort-items .cur {
        color: #F60
    }

    .sort-items .lt-icons {
        width: 8px;
        height: 9px;
        margin-left: 4px;
        _position: absolute
    }

    .sort-items .orange-down {
        background-position: -70px 0
    }

    .sort-items .orange-up {
        background-position: -80px 0
    }

    .total-tips {
        padding-right: 19px;
        color: #999
    }

    .total-tips em {
        color: #61ab00;
        padding: 0 3px
    }

    .s-mod, .list-advs .ifxside-recomm， .list-advs .map-sidebar {
        border: 1px solid #ddd;
        margin-bottom: 20px;
        font-size: 14px
    }

    .s-mod h3, .ifxside-recomm .hd {
        height: 24px;
        line-height: 24px;
        font-size: 18px;
        position: relative;
        z-index: 1;
        background: #fff
    }

    .list-advs .tuangou_entry {
        margin-bottom: 20px
    }

    .list-advs .price-trend {
        padding-left: 20px;
        margin-bottom: 20px
    }

    .list-advs .price-trend h3 {
        font-size: 16px;
        font-weight: 100;
        font-weight: 700 \9
    }

    .list-advs .map-app {
        display: block;
        padding-left: 25px
    }

    .list-advs .map-sidebar {
        border: 1px solid #DDD;
        padding: 25px 0;
        margin: 20px 0 0
    }

    .list-page {
        height: 32px;
        line-height: 32px;
        overflow: hidden;
        margin: 30px 0 0;
        padding: 0 20px
    }

    .list-page .pagination {
        float: right;
        margin: 0
    }

    .list-page .total {
        float: left;
        font-size: 14px;
        color: #666
    }

    .IF-58BD-mod {
        margin-top: 15px
    }

    .IF-58BD-mod .IF-58BD {
        padding: 0;
        margin: 0;
        border-style: none
    }
</style>
<script language="javascript" src="http://pingjs.qq.com/ping.js"></script>

<script language="javascript">

    if (typeof (pgvMain) == 'function')

        pgvMain();

</script>
<!--[if !IE]>|xGv00|59c743676957e2486e270f5721e5a7f7<![endif]--><!--[if !IE]>|xGv00|941381b51534e7f8e72ade7f9e307861<![endif]--><style>
html, html body {
font-family: Microsoft yahei;
padding: 0;
font: normal;
}
#header {
float: none;
border-bottom: 1px solid #ddd;
box-shadow: 0px 2px 2px #f0f0f0;
margin-bottom: 40px;
}
.body-Article-QQ {
width: 1200px;
margin: 0 auto;
}

.sc-main {
overflow: hidden;
}

.sc-content {
float: left;
width: 840px;
}

.sc-sidebar {
float: right;
width: 300px;
}
div.tcopyright {
padding-top: 30px;
}
#header div.hbox {
margin: 0 auto 0px auto;
padding-top: 27px;
}
/* 文章内容样式 */
.sc-content-title {
text-align: center;
font-weight: bold;
}
.sc-line {
border-left: 2px solid #ccc;
height: 14px;
display: inline-block;
position: relative;
margin:0 8px;
top: 2px;
}
.sc-tit-bar {
margin-top: 40px;
padding-bottom: 10px;
border-bottom: 1px solid #F0F0F0;
margin-bottom: 25px;
}
</style><style type="text/css">
/*.wrap{
width: 1000px;
margin: 0 auto;
}
#header{
height: 113px;
width: 100%;
background-color: yellow;
}
#main{
width: 100%;
overflow: hidden;
font-family: Microsoft yahei;
}
#main .left{
float: left;
width: 640px;
height: 600px;
}
#main .right{
float: right;
width: 300px;
}*/
.topic{
font-size: 24px;
border-bottom: 1px solid #ccc;
/*padding-bottom: 5px;margin-top: 40px;*/
}
.topic .heat{
width: 100px;
border-bottom: 2px solid #1eb97b;
padding-bottom: 5px;
}
.heat-list{
padding: 0;
margin: 20px 0;
}
.heat-list .heat-list-item{
list-style: none;
padding: 8px 0;
font-size: 16px;
color: #686868;
}
.heat-list .heat-list-item .top-link {
color: #686868;
font-size: 16px;
cursor: pointer;
text-decoration: none;
}
.heat-list .heat-list-item .label{
display: inline-block;
width: 18px;
height: 18px;
line-height: 18px;
text-align: center;
background-color: #bcbcbc;
color: #fff;
margin-right: 12px;
font-size: 14px;
}
.heat-list .heat-list-item .active{
background-color: #1eb97b;
}
.ad{
margin-top: 25px;
text-align: center;
display: block;
cursor: pointer;
text-decoration: none;
}
.ad img {
max-width: 300px;
}
.ad .ad-title{
font-size: 18px;
}
</style>

<style>
    body, ol, ul, h1, h2, h3, h4, h5, h6, p, th, td, dl, dd, form, fieldset, legend, input, textarea, select {
        margin: 0;
        padding: 0
    }

    body {
        color: #333;
        -webkit-text-size-adjust: 100%;
    }

    h1, h2, h3, h4, h5, h6, .yh {
        font-family: '微软雅黑', '黑体', '宋体';
        font-size: 100%;
        font-weight: normal;
    }

    a {
        color: #333;
        text-decoration: none
    }

    em {
        font-style: normal
    }

    li {
        list-style: none
    }

    img {
        border: 0;
        vertical-align: middle
    }

    p, a {
        word-wrap: break-word
    }

    body {
        font-family: '微软雅黑';
        padding-right: 50px;
        padding-top: 50px;
        padding-left: 50px;
    }

    .news-list {
        min-width: 800px;
    }

    .lists {
        margin-bottom: 20px;
    }

    .lists li:first-child {
        border-top-left-radius: 4px;
        border-top-right-radius: 4px;
    }

    .lists li:last-child {
        margin-bottom: 0;
        border-bottom-right-radius: 4px;
        border-bottom-left-radius: 4px;
    }

    .lists li {
        position: relative;
        display: block;
        padding: 10px 15px;
        margin-bottom: -1px;
        background-color: #fff;
        border: 1px solid #ddd;
    }

    .lists .sc-time {
        float: right;
        font-family: 微软雅黑;
    }

    .lists .sc-title {
        color: #686868;
        text-decoration: none;
        font-family: & quot;
        微软雅黑 & quot;;
        font-size: 14px;
        line-height: 1.42857143;
    }

    .lists .sc-title span {
        color: #686868;
    }

    /*左侧列表样式*/
    .news-list, p {
        margin: 0;
        padding: 0;
    }

    .news-list {
        margin-top: -25px;
    }

    .news-list .active {
        color: #1eb97b;
    }

    .news-list .news-list-item {
        margin: 0;
        list-style: none;
        border-bottom: 1px solid #f0f0f0;
        padding: 17px 0;
        overflow: hidden;
        padding-bottom: 28px;
    }

    .news-list .news-list-item:first-child {
        margin-top: -23px;
    }

    .news-list .news-list-item:hover .news-title a {
        color: #1eb97b;
        text-decoration: none;
    }

    .news-list .news-title-a {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        display: inline-block;
        padding: 5px 0;
        max-width: 90%;
    }

    .news-title {
        font-size: 30px;
        font-weight: bold;
        margin-bottom: 10px;
        color: #444;
        cursor: pointer;
    }

    .recommend {
        display: inline-block;
        width: 25px;
        height: 25px;
        color: #fff;
        background-color: #e49a18;
        font-size: 16px;
        text-align: center;
        line-height: 25px;
        vertical-align: text-top;
        font-weight: normal;
        margin-left: 20px;
        position: relative;
        top: -3px;
    }

    .news-image, .news-content {
        float: left;
    }

    .news-image {
        /*margin-right: 30px;*/
    }

    .news-content {
        width: 700px;
        max-height: 135px;
        font-size: 14px;
        color: #686868;
        position: relative;
    }

    .news-content .news-info {
        line-height: 23px;
        max-height: 95px;
        display: -webkit-box;
        text-overflow: ellipsis;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 4;
        overflow: hidden;
        word-break: break-all;
    }

    .news-image .min92 {
        min-height: 92px;
        _height: 92px;
    }

    .news-content .news-label {
        /*position: absolute;
			bottom: 0;
			left: 0;
			right: 0;*/
        /*margin-top: 25px;*/
    }

    .divider {
        padding: 0 22px;
        color: #ccc;
    }

    .news-image {
        /*max-width: 240px;*/
        max-height: 135px;
        font-size: 14px;
    }

    .news-image img {
        max-width: 240px;
        height: 135px;
        float: left;
        margin-right: 30px;
    }

    .news-image .news-info {
        max-height: 95px;
        line-height: 23px;
        display: -webkit-box;
        text-overflow: ellipsis;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 4;
        overflow: hidden;
        word-break: break-all;
        font-size: 14px;
        color: #686868;
    }

    .news-image .news-label {
        margin-top: 25px;
    }


    .load-more {
        display: block;
        width: 90%;
        height: 40px;
        background-color: #f3f3f3;
        text-align: center;
        line-height: 40px;
        text-decoration: none;
        color: #666;
        margin: 20px auto;
    }

    .load-more-i:after {
        content: '';
        display: inline-block;
        width: 21px;
        height: 21px;
        vertical-align: -5px;
        margin-left: 5px;
        background-image: url(http://mat1.gtimg.com/www/mobi/image/icon.png);
        background-repeat: no-repeat;
        background-position: -42px 0;
        -webkit-background-size: 119px 21px;
        -moz-background-size: 119px 21px;
        -o-background-size: 119px 21px;
        background-size: 119px 21px;
    }

    .no-unline {
        text-decoration: none;
        text-decoration: none !important;
    }

    #mainContent img {
        margin: 0 auto;
        line-height: 28px;
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
                    流转物品
                </li>
            </ul>
            <ul class="previous">
                <li><a href="<%=basePath %>">回到首页</a></li>
            </ul>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="container">
        <div class="biseller-info">
            <h3 class="new-models"> 流转物品
                <span style="color:#fff">
					<% if (message != null) { %>
					<script>
					alert("<%=message %>");
					</script>
					<% } %>
					</span>
            </h3>
            <ul id="flexiselDemo3" style="display:block;">
                <c:forEach items="${requestScope.list }" var="u" varStatus="st">
                    <li class="nbs-flexisel-item">
                        <div class="biseller-column">
                            <img src="<%=basePath %>${u.thumb}" style="width:243px;height:287px;"
                                 alt="" class="veiw-img">
                            <div class="veiw-img-mark">
                                <a href="<%=basePath %>app/detail?id=${u.id}">物品详细</a>
                            </div>
                            <div class="biseller-name">
                                <h4>${u.product_name}</h4>
<%--                                <p>￥${u.price }</p>--%>
                            </div>
                            <a
<%--                                    href="<%=basePath %>app/buy?id=${u.id}"--%>
                                    onclick="buy(${u.id},${u.u.id},'${u.product_name}')">
                                <button class="add2cart">
                                    <i class="white-cart1"></i>
                                    <span>| 点击购买</span>
                                </button>
                            </a>
                        </div>
                    </li>

                </c:forEach>

            </ul>
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
                    <input type="hidden" class="data" name="code" id="code">
                    <input type="hidden" class="data" name="pname" id="pname">
                    <input type="hidden" class="data" name="pid" id="pid">
                    <input type="hidden" class="data" name="total" id="total">
                    <input type="hidden" class="data" name="cuid" id="cuid">
                    <div class="form-group"><label>订单编号:<span id="codeSpan"></span></label></div>
                    <div class="form-group"><label>商品名称:<span id="nameSpan"></span></label></div>

                    <div class="form-group"><label>收件人姓名:</label><input class="form-control data" type="text" name="buyer"
                                                                        required placeholder=""></div>
                    <div class="form-group"><label>联系方式:</label><input class="form-control data" type="text" name="tel"
                                                                       required placeholder=""></div>
                    <div class="form-group"><label>数量:</label><input class="form-control data" type="number" min="1"
                                                                     value="1" name="num" id="num" required placeholder=""></div>
                    <div class="form-group"><label>收货地址:</label><input class="form-control data" type="text" name="address"
                                                                       required placeholder=""></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" onclick="clear()" data-dismiss="modal">关闭
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
<script>
    function buy(id,cuid,name) {
        $('.data').val('');
        $('#num').val(1);
        var code = 'LJ' + new Date().getTime();
        $('#code').val(code);
        $('#codeSpan').text(code);
        $("#pid").val(id);
        $('#pname').val(name);
        $('#nameSpan').text(name);
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

</script>
<!--content end-->
<jsp:include page="footer.jsp"></jsp:include>