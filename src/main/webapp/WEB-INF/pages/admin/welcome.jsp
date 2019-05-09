<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page language="java" import="com.app.utils.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="<%=basePath %>static/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath %>static/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/admin.css">
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/app.css">
    <script src="<%=basePath %>static/assets/js/echarts.min.js"></script>
</head>

<body data-type="index">

 <div class="row" style="padding-left:35px;padding-right:35px;">
 <div class="tpl-content-scope">
                <div class="note note-info">
                    <h3>${user.username }，欢迎您使用 ！
                        <span class="close" data-close="note"></span>
                    </h3>
                    <p>今天是<%=MainUtils.getTime() %></p>
                    <p><span class="label label-danger">提示:</span>
                    			请在左边菜单栏选择操作菜单操作	
                    </p>
                </div>
            </div>
            
            
            
            
        
 </div>
        
  <!-- end Layout -->


  <!-- script -->
  <script src="<%=basePath %>static/src/plug/jquery.js"></script>
  <script src="<%=basePath %>static/src/plug/tether.js"></script>
  <script src="<%=basePath %>static/src/plug/bootstrap.js"></script>
  <script src="<%=basePath %>static/src/plug/moment.js"></script>
  <script src="<%=basePath %>static/src/plug/jquery.flot.js"></script>
  <script src="<%=basePath %>static/node_modules/CurvedLines/curvedLines.js"></script>
  <script src="<%=basePath %>static/node_modules/peity/jquery.peity.min.js"></script>
  <script src="<%=basePath %>static/node_modules/easy-pie-chart/dist/jquery.easypiechart.min.js"></script>
  <script src="<%=basePath %>static/node_modules/chartist/dist/chartist.min.js"></script>
  <script src="<%=basePath %>static/src/plug/fullcalendar.min.js"></script>
  <script src="<%=basePath %>static/src/dist/js/dashone.js"></script>
  <script src="<%=basePath %>static/src/dist/js/app.js"></script>
  
  <script type="text/javascript" src="http://echarts.baidu.com/build/dist/echarts.js"></script>

				<script type="text/javascript">

					// 路径配置
					// 路径配置
					require.config({
						paths: {
							echarts: 'http://echarts.baidu.com/build/dist'
						}
					});


					// 使用
					require(
						[
							'echarts',
							'echarts/chart/line',
							'echarts/chart/bar',
						],
						function (ec) {
							// 基于准备好的dom，初始化echarts图表
							var myChart = ec.init(document.getElementById('mainRep'));

							var
								option = {
									title : {
										text: '学生请假单',
										subtext: '--'
									},
									tooltip : {
										trigger: 'axis'
									},
									legend: {
										data:[<c:forEach items="${requestScope.lists }" var="u" varStatus="st">
										'${u.username}',
										 </c:forEach>
										]
									},
									toolbox: {
										show : true,
										feature : {
											mark : {show: true},
											dataView : {show: true, readOnly: false},
											magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
											restore : {show: true},
											saveAsImage : {show: true}
										}
									},
									calculable : true,
									xAxis : [
										{
											type : 'category',
											boundaryGap : false,
											data : [
<c:forEach items="${requestScope.lists }" var="u" varStatus="st">
'${u.username}',
 </c:forEach>
											]
										}
									],
									yAxis : [
										{
											type : 'value'
										}
									],
									series : [
										{
											name:'--',
											type:'line',
											smooth:true,
											itemStyle: {normal: {areaStyle: {type: 'default'}}},
											data:[<c:forEach items="${requestScope.lists }" var="u" varStatus="st">
											'${u.ordNum}',
											 </c:forEach>]
										}											
									]
								};

							// 为echarts对象加载数据
							myChart.setOption(option);
						}
					);
				</script>
  
  <script>
  
  </script>
</body>
</html>
