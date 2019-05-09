<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page  import="com.app.utils.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="header.jsp"></jsp:include>

 <style type="text/css">
            #banner{background: #ffffff url(http://mat1.gtimg.com/campus/login/home-bg01.jpg) no-repeat center top;
                width:100%; height:px;}
            #banner .banbox .bd a{display: block; width:1200px; height:350px; margin: 0 auto;}

            .mod-oauth__box-left {
                position: relative;
                width: 360px;
                padding-bottom: 30px;
                text-align: center;
                border: 1px solid #d8dadd;
            }
            /*banner区域*/
            #banner{ width:100% ;height:560px; float:left;position:relative;}
            #banner .banbox{width:100%; height:560px; margin:0px auto;}
            #banner .banbox img{width:100%;height:560px;}
            #banner .banbox .banlist{width:100%; height:20px; text-align:center; /*margin:315px auto 0px auto; */background:url(http://mat1.gtimg.com/edu/scampus/index/ban-xk-bj.png) no-repeat center center;position:absolute;bottom:22px;left:22px;}
            #banner .banbox .banlist a{ width:10px; height:10px; margin:5px 3px; background:url(http://mat1.gtimg.com/edu/scampus/index/ban-xk-q.png) no-repeat center center; display:inline-block; cursor:pointer}
            #banner .banbox .banlist a:hover,#banner .banbox .banlist .active{ background:url(http://mat1.gtimg.com/edu/scampus/index/ban-xk-sd.png) no-repeat center center}

            #frame{background-color: #ffffff;float: right;margin-top: 65px;margin-right: 15%;}
        </style>
        <!-- footer样式 -->
        <style type="text/css">
            #wraper{ width:100%; height:auto; float:left; position:relative}
            #banner{ width:100% ;height:560px; float:left;position:relative;}
            #frame{background-color: #ffffff;float: right;margin-top: 65px;margin-right: 15%;}
            #footer{width:100%; height:auto; float:left; background:#fff;}
            #footer .footbox{width:1200px; height:auto; margin:0px auto;}
            #footer .footbox .hzlx{width:1200px; height:46px; margin-top:20px; float:left;}
            #footer .footbox .hzlx p{font-size:36px;font-family:"微软雅黑"; text-align:center;color:#444444;}
            #footer .footbox ul{width:1200px; height:auto; margin-top:30px; float:left}
            #footer .footbox li{height:18px; float:left; margin-left:20px; margin-right:20px; font-size:17px; line-height:18px; color:#444;}
            #footer .footbox .smbox{width:1200px; height:80px; margin-top:30px; float:left; margin-top:50px; margin-bottom:100px;}
        </style>
<script language="javascript" src="http://pingjs.qq.com/ping.js"></script>

<script language="javascript">

if(typeof(pgvMain) == 'function')

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
	body, ol, ul, h1, h2, h3, h4, h5, h6, p, th, td, dl, dd, form, fieldset, legend, input, textarea, select { margin: 0; padding: 0 }
	body { color:#333; -webkit-text-size-adjust: 100%;}
	h1, h2, h3, h4, h5, h6, .yh{ font-family:'微软雅黑', '黑体', '宋体'; font-size:100%; font-weight: normal;}
	a { color:#333; text-decoration: none }
	em { font-style: normal }
	li { list-style: none }
	img{ border: 0; vertical-align: middle }
	p,a{ word-wrap: break-word }
	body { 
		font-family:'微软雅黑';
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
	    font-family: &quot;微软雅黑&quot;;
    	font-size: 14px;
    	line-height: 1.42857143;
	}
	.lists .sc-title span{
	    color: #686868;
	}
		/*左侧列表样式*/
		.news-list,p{
			margin: 0;
			padding: 0;
		}
		.news-list{
			margin-top: -25px;
		}
		.news-list .active{
			color: #1eb97b;
		}
		.news-list .news-list-item{
			margin: 0;
			list-style: none;
			border-bottom: 1px solid #f0f0f0;
			padding: 17px 0;
			overflow: hidden;
			padding-bottom: 28px;
		}
		.news-list .news-list-item:first-child{ 
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
		.news-title{
			font-size: 30px;
			font-weight: bold;
			margin-bottom: 10px;
			color: #444;
			cursor: pointer;
		}
		
		.recommend{
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
		.news-image,.news-content{
			float: left;
		}
		.news-image{
			/*margin-right: 30px;*/
		}
		.news-content{
			width: 700px;
			max-height: 135px;
			font-size: 14px;
			color: #686868;
			position: relative;
		}
		.news-content .news-info{
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
		.news-content .news-label{
			/*position: absolute;
			bottom: 0;
			left: 0;
			right: 0;*/
			/*margin-top: 25px;*/
		}
		.divider{
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
	

		.load-more{
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
.sc-content img,#mainContent img{margin:0 auto;line-height:28px;max-width:90%;}
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
                       ${model.title }
                    </li>
                </ul>
                <ul class="previous">
                	<li><a href="<%=basePath %>">回到首页</a></li>
                </ul>
                <div class="clearfix"></div>
			   </div>
			   </div>
		<div class="container">
		<div class="sc-content" style="display:block;margin:0 auto;float:none" id="C-Main-Article-QQ">
<div class="listZone4" id="listZone4">

<div class="sc-content" id="C-Main-Article-QQ">
<div class="hd">
<h1 class="sc-content-title" style="font-size:25px;font-weight:bold;" id="sc-content-title">${model.title }</h1>
<div style="text-align:center" class="tit-bar sc-tit-bar clearfix" bosszone="titleDown"><div class="ll">
<span style="color: #1eb97b">新闻中心</span><span class="sc-line"></span>
<span style="color: #666;" class="article-time">${model.created }</span><span class="bor-tit"></span>
</div></div>
</div>
<div class="bd" accesskey="3" tabindex="-1"><div id="Cnt-Main-Article-QQ" bosszone="content"><p style="text-indent: 2em">  
<img style="display:block;margin:0 auto;" src="<%=basePath%>${model.thumb}">
</p>
	<div style="background:#f1f1f1;margin-bottom:20px;">
	${model.description }
	</div>
	<div id="mainContent">
	${model.bodytext }
	</div>
</div>

</div>
<script type="text/javascript">
		/* Created by clys 2007-05-22 */	
		function $(v) {return document.getElementById(v);} 	
		var xmlHttp2='';  	
		var listID2='listZone4';
		var loadUrl2='/c/campus/test1037';		
	 
				  
		var firstStr2 = $(listID2).innerHTML;
		function SplitPages2(name,pageID,listID2) {
			this.name = name; 
			this.pageID = pageID;   
			this.page = 1; 
			this.pageCount = 1;
			this.argName = 'p'; 
		}
		SplitPages2.prototype.RequestHTML = function() {
			try {xmlHttp2=new ActiveXObject("Msxml2.XMLHTTP");} 
			catch(e){		
				try {xmlHttp2=new ActiveXObject("Microsoft.XMLHTTP");} 
				catch(e){xmlHttp2=false;}
			}
			if(!xmlHttp2&&typeof XMLHttpRequest!='undefined'){xmlHttp2=new XMLHttpRequest();}				
			return xmlHttp2;
		} 
		SplitPages2.prototype.getStateChange = function() {	
			if(xmlHttp2.readyState == 4) { 
				switch(xmlHttp2.status){ 
					case 200: 
					    $(listID2).innerHTML += xmlHttp2.responseText;
                        // $(listID2).innerHTML = $("listZone4").innerHTML;
					break;
					case 404:
					alert('未找到您请求的页面，请重试或浏览本站其他精彩内容：）');
					break;
					default:
					$(listID2).innerHTML='';
				} 
			}
		}
		SplitPages2.prototype.loadMe = function(n) {
			this.RequestHTML();
			var url = loadUrl2+'_'+n+'.htm?'+Math.random(999);
			xmlHttp2.onreadystatechange = this.getStateChange; 		
			xmlHttp2.open("GET", url, true); 
			xmlHttp2.send(null);
		}   
		SplitPages2.prototype.loadFirst = function(n) {
			 $(listID2).innerHTML=firstStr2;
		}   

		SplitPages2.prototype.getUrlPage = function(){
			var args = location.search;
			var reg = new RegExp('[\?&]?' + this.argName + '=([^&]*)[&$]?', 'gi');
			var chk = args.match(reg);
			this.page = RegExp.$1; 
			this.Output(RegExp.$1);
		}
		SplitPages2.prototype.checkPages = function(){
			if (isNaN(parseInt(this.page))) this.page = 1;
			if (isNaN(parseInt(this.pageCount))) this.pageCount = 1;
			if (this.page < 1) this.page = 1;
			if (this.pageCount < 1) this.pageCount = 1;
			if (this.page > this.pageCount) this.page = this.pageCount;
			this.page = parseInt(this.page);
			this.pageCount = parseInt(this.pageCount);
		}
		SplitPages2.prototype.createHtml = function(mode){ 
			var strHtml = '', prevPage = this.page - 1, nextPage = this.page + 1;
			if (mode == '' || typeof(mode) == 'undefined') mode = 0;
			if (nextPage > this.pageCount) {
				strHtml += ' <span><a class="load-more no-unline" href="javascript:void(0);" >已显示全部内容</a></span> ';
			} else {
				strHtml += ' <span><a class="load-more load-more-i" href="javascript:' + this.name + '.Output(' + nextPage + ');" >点击查看更多</a></span> ';
			}
			return strHtml;
		}  
		SplitPages2.prototype.Output = function(mode){ 	
			this.page=mode;	
			this.checkPages();  
			$(this.pageID).innerHTML = this.createHtml(mode);
			if(this.page==1){this.loadFirst(this.page);}else{this.loadMe(this.page);}
		}  
	
	</script><div class="page" id="pageZone4"> <span><a class="load-more load-more-i" href="javascript:getString2.Output(2);">点击查看更多</a></span> </div>
<style>
	body, ol, ul, h1, h2, h3, h4, h5, h6, p, th, td, dl, dd, form, fieldset, legend, input, textarea, select { margin: 0; padding: 0 }
	body { color:#333; -webkit-text-size-adjust: 100%;}
	h1, h2, h3, h4, h5, h6, .yh{ font-family:'微软雅黑', '黑体', '宋体'; font-size:100%; font-weight: normal;}
	a { color:#333; text-decoration: none }
	em { font-style: normal }
	li { list-style: none }
	img{ border: 0; vertical-align: middle }
	p,a{ word-wrap: break-word }
	body { 
		font-family:'微软雅黑';
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
	    font-family: &quot;微软雅黑&quot;;
    	font-size: 14px;
    	line-height: 1.42857143;
	}
	.lists .sc-title span{
	    color: #686868;
	}
		/*左侧列表样式*/
		.news-list,p{
			margin: 0;
			padding: 0;
		}
		.news-list{
			margin-top: -25px;
		}
		.news-list .active{
			color: #1eb97b;
		}
		.news-list .news-list-item{
			margin: 0;
			list-style: none;
			border-bottom: 1px solid #f0f0f0;
			padding: 17px 0;
			overflow: hidden;
			padding-bottom: 28px;
		}
		.news-list .news-list-item:first-child{ 
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
		.news-title{
			font-size: 30px;
			font-weight: bold;
			margin-bottom: 10px;
			color: #444;
			cursor: pointer;
		}
		
		.recommend{
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
		.news-image,.news-content{
			float: left;
		}
		.news-image{
			/*margin-right: 30px;*/
		}
		.news-content{
			width: 700px;
			max-height: 135px;
			font-size: 14px;
			color: #686868;
			position: relative;
		}
		.news-content .news-info{
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
		.news-content .news-label{
			/*position: absolute;
			bottom: 0;
			left: 0;
			right: 0;*/
			/*margin-top: 25px;*/
		}
		.divider{
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
	

		.load-more{
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

	</style><style>
html,body {
	font-family: Microsoft yahei;
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
.sc-content img {
	margin-bottom: 30px;
	margin-top: 30px;
	max-width: 100%;
}
#Cnt-Main-Article-QQ p {
	font-family: Microsoft yahei;
    margin-bottom: 29px;
    line-height: 28px;
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
.titdd-Article {
	margin-bottom: 30px;
	color: #888888;
}
/* 文章内容样式 */
.sc-content-title {
	text-align: center;
	/*font-weight: bold;*/
}
.sc-line {
	border-left: 2px solid #ccc;
    height: 14px;
    display: inline-block;
    position: relative;
    margin:0 20px;
    top: 2px;
}
.sc-tit-bar {
	overflow: hidden;
	margin-top: 40px;
    padding-bottom: 10px;
    border-bottom: 1px solid #F0F0F0;
    margin-bottom: 25px;
}
</style>
<style>
@media screen and (max-width: 1024px) {
	    body {
    	    background-color: #f0f0f0;
	    }
		.sc-sidebar{
			display: none;
		}
		#header{
			display: none;
		}
		#tcopyright{
			display: none;
		}
		.body-Article-QQ{
			width: 100%;
		}
		.sc-content{
			width: 100%;
		    padding-bottom: 10px;			
		}		
		#Cnt-Main-Article-QQ {
			padding: 15px;
			padding-top: 25px;
		    word-break: break-all;
    		word-wrap: break-word;
		}
		#Cnt-Main-Article-QQ p{		   
		 	color: #212121;
		    line-height: 30px;
		    word-wrap: break-word;
		    margin-bottom: 20px;
    	}
    	#Cnt-Main-Article-QQ div{
			width: 100% !important;
		}
		#Cnt-Main-Article-QQ img {
			width: 100% !important;
		}
		.sc-content-title{
			font-size: 25px;
		    color: #141414;
		    text-align: left;
		    padding: 20px 15px 15px;
		    font-weight: 700;
		    /*line-height: 26px;*/
			text-align: left;
		}
		.tit-bar {
			margin: 0 15px;		
		}	
		.sc-tit-bar {
			padding-bottom: 15px;
		}
		.tit-bar .ll{
			/*margin-bottom: 9px;*/
		}
		.sc-tit-bar{
		    border-bottom: 1px solid #dedede;
		}
		.sc-content img {
		    margin-bottom: 10px;
		    margin-top: 10px;
		}
		
	}
	@media screen and (max-width: 737px) {
		#Cnt-Main-Article-QQ img{
			display: block;
			width: 100%;			
		}
		.tit-bar .ll{
    		font-size: 12px;
		}
		.tit-bar .ll span:nth-child(1){
		    color: #74787b !important;
		}
		.tit-bar .ll .article-time {
			color: #74787b !important;
		}
		.sc-line{
			display: none;
		}
		.article-time{
			float: left;
			margin-right: 10px;
		}
	}
	@media screen and (min-width: 375px) and (max-width: 737px) {
		#Cnt-Main-Article-QQ p{
		     font-size: 19px; 
		     line-height: 30px;
    	}
	}

	@media screen and (min-width: 320px) and (max-width: 374px) {
		.sc-content-title{
			font-size: 21px;
		}
	}	

	
</style>
<script type="text/javascript">
		var getString2 = new SplitPages2('getString2','pageZone4');
		getString2.pageCount = 34;
		getString2.Output(); 
	</script>
<!--[if !IE]>|xGv00|02aa76f93147375a8f6508bc52a3a420<![endif]--><div class="hd" style="display:none;">
<h1 class="sc-content-title"></h1>
<div class="tit-bar sc-tit-bar clearfix" bosszone="titleDown"><div class="ll">
<span class="color-a-1" style="color: #288F66;" bosszone="jgname"></span><span class="sc-line"></span><span style="color: #666;" class="article-time">-- </span><span class="bor-tit"></span>
</div></div>
</div>
<div style="display:none;" class="bd" accesskey="3" tabindex="-1"><div id="Cnt-Main-Article-QQ" bosszone="content"></div></div>
</div></div>
		</div>
		</div>
    <!--content end-->
   <jsp:include page="footer.jsp"></jsp:include>