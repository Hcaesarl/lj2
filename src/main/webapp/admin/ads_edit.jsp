<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="com.app.utils.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Object message = request.getAttribute("message"); 


DB db = new DB();
db.open();
ResultSet rs = db.executeQuery("SELECT * FROM ads where id="+request.getParameter("id"));

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
<form enctype="multipart/form-data" action="<%=basePath %>servlet?acl=ads_update" 
class="am-form am-form-horizontal" method="post" style="width:50%;">
   <% if(rs.next()){ %>
            <fieldset>
                <div class="widget">
                    <div class="title"><img src="<%=basePath %>static/admin/images/icons/dark/list.png" alt="" class="titleIcon">
                    <h6>广告更新</h6></div>
                    <div class="formRow">
                        <label>广告名称:</label>
                        <div class="formRight">
                        	<input name="title" type="text" required value="<%=rs.getString("title")%>">
                        	<input name="id" type="hidden" value="<%=rs.getString("id")%>"/>
                        </div>
                        <div class="clear"></div>
                    </div>
                    
                    <div class="formRow">
                        <label>URL:</label>
                        <div class="formRight">
                        	<input name="url" type="text" required value="<%=rs.getString("url")%>">
                        	
                        </div>
                        <div class="clear"></div>
                    </div>
                    
                    <div class="formRow">
                        <label>大图:</label>
                        <div class="formRight">
                         <a target="_blank" href="<%=basePath%><%=rs.getString("thumb") %>">
     <img src="<%=basePath%><%=rs.getString("thumb") %>" style="width:100px;height:80px;"/>	
     </a>	<br/>
                        	<input name="thumb" type="file" value="">
                        	<input name="oldThumb" type="hidden" value="<%=rs.getString("thumb")%>">
                        </div>
                        <div class="clear"></div>
                    </div>
                    
                    
                    <div class="formRow">
                    <% if(message!=null){ %>
                    <div class="nNote nInformation hideit">
            			<p>
            				<strong>SUCCESS: </strong><%=message %>.            				
            			</p>
        			</div>
                    <% } %>
                    <br/>
                    <input type="submit" value="提交数据" class="dredB ">
                    </div>
                </div>
            </fieldset>
            <% } %>
         
        </form>
  </body>
</html>
