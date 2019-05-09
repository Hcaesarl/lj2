<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="com.app.utils.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

DB db = new DB();
db.open();
ResultSet rs = db.executeQuery("SELECT * FROM ads");


Object message = request.getAttribute("message"); 
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
    <script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
    <script src="<%=basePath %>static/My97DatePicker/WdatePicker.js"></script>
    <script src="<%=basePath %>static/assets/js/echarts.min.js"></script>
<script src="https://cdn.bootcss.com/jquery/2.1.4/jquery.js"></script>
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<script src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>

<link rel="stylesheet" href="<%=basePath%>static/animate.css">
<script src="<%=basePath%>static/js.js" charset="utf-8"></script>
<style>
body {
	overflow-x: hidden
}

body::-webkit-scrollbar { /*滚动条整体样式*/
	width: 5px; /*高宽分别对应横竖滚动条的尺寸*/
	height: 1px;
}

body::-webkit-scrollbar-thumb { /*滚动条里面小方块*/
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
	background: #EEE;
}

body::-webkit-scrollbar-track { /*滚动条里面轨道*/
	-webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	background: #DDD;
}

.dataTables_filter input {
	border: 1px solid #ddd;
}
</style>
<script>
	$(document).ready(function() {
		$('table').DataTable({
			language : {
				"sProcessing" : "处理中...",
				"sLengthMenu" : "显示 _MENU_ 项结果",
				"sZeroRecords" : "没有匹配结果",
				"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
				"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
				"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
				"sInfoPostFix" : "",
				"sSearch" : "搜索:",
				"sUrl" : "",
				"sEmptyTable" : "表中数据为空",
				"sLoadingRecords" : "载入中...",
				"sInfoThousands" : ",",
				"oPaginate" : {
					"sFirst" : "首页",
					"sPrevious" : "上页",
					"sNext" : "下页",
					"sLast" : "末页"
				},
				"oAria" : {
					"sSortAscending" : ": 以升序排列此列",
					"sSortDescending" : ": 以降序排列此列"
				}
			}
		});

	});
</script>
<!-- Shared on MafiaShare.net  --><!-- Shared on MafiaShare.net  --></head>
<style>
body,html{background:none;width:100%;height:100%;}
.sTable tr td{text-align:center;}
</style>
<body>
 <% if(message!=null){ %>
                    <div class="nNote nInformation hideit">
            			<p>
            				<strong>SUCCESS: </strong><%=message %>.            				
            			</p>
        			</div>
                    <% } %>
   <div class="widget">
          <div class="title">
          <img src="<%=basePath %>static/admin/images/icons/dark/frames.png" alt="" class="titleIcon">
          <h6>广告数据</h6></div>
            <table cellpadding="0" cellspacing="0" width="100%" class="sTable">
                <thead>
    <tr>
    <td>编号</td>    
    <td>广告名称</td>
    <td>广告URL</td>
    <td>图片</td>
    <td>添加时间</td>
    <td>操作</td>
    </tr>
    </thead>
    
    <tbody>
    
    <% 
    while(rs.next())
    {
     %>
     <tr>
     <td><%=rs.getString("id") %></td>     
     <td><%=rs.getString("title") %></td>
     <td><%=rs.getString("URL") %></td>
     <td>
     <a target="_blank" href="<%=basePath%><%=rs.getString("thumb") %>">
     查看图片	
     </a>	
     </td>
     <td><%=rs.getString("created") %></td>     
     <td>   
     
     <a href="<%=basePath%>admin/ads_edit.jsp?id=<%=rs.getString("id")%>">
     	[更新]     	
     </a>  
     <a href="<%=basePath%>admin/index?acl=ads_delete&id=<%=rs.getString("id")%>">
     	[删除]     	
     </a>
     </td>
     </tr>
     
     <% } %>
    
    
    </tbody>
            </table>
        </div>
   
  </body>
</html>
