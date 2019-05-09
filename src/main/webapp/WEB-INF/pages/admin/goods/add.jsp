<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

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
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="<%=basePath %>static/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath %>static/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/admin.css">
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/app.css">
    <link rel="stylesheet" href="<%=basePath %>/static/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath %>/static/admin/css/RegionalChoice.css">
    <script src="<%=basePath %>static/assets/js/echarts.min.js"></script>
    <script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
    <script src="<%=basePath %>static/My97DatePicker/WdatePicker.js"></script>
</head>

<body data-type="index">
<%--<form action="<%=basePath%>/goods/goods/save" method="post">--%>

<div class="row  am-u-md-7" style="padding-left:30px;padding-right:30px;width: 100%">

    <div class="tpl-portlet-components">
        <div class="portlet-title">
            <div class="caption font-green bold">
                <h4>
                    <span class="am-icon-plus"></span> 发布物品
                </h4>
            </div>
            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon right">
                        <p class="am-text-danger">
                            ${message}</p>
                    </div>
                </div>
            </div>


        </div>
        <div class="tpl-block ">

            <div class="am-g tpl-amazeui-form">


                <div class="am-u-sm-12 am-u-md-12">
                    <form class="am-form am-form-horizontal" action="<%=basePath %>/goods/goods/save" method="POST">
                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">物品名称</label>
                            <div class="am-u-sm-9">
                                <input type="text" name="product_name" required placeholder="">
                                <small></small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">所属类别</label>
                            <div class="am-u-sm-9">
                                <select name="category">
                                    <c:forEach items="${requestScope.list }" var="u" varStatus="st">
                                        <option value="${u.id }">
                                                ${u.title }
                                        </option>
                                    </c:forEach>
                                </select>
                                <small></small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">是否属于电器</label>
                            <div class="am-u-sm-9">
                                <select name="isElectric">
                                    <option value="Y">是</option>
                                    <option value="N">否</option>
                                </select>
                                <small></small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">所处地区</label>
                            <div class="am-u-sm-9">
                                <input type="text" readonly name="areas" id="areas" required placeholder="">
                                <a href="javascript:;" class="btn btn-default" data-toggle="modal"
                                   data-target="#myModal">添加地区</a>
                                <small></small>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">物品图片</label>
                            <div class="am-u-sm-9">
                                <input type="text" readonly id="thumb" name="thumb" required placeholder="">
                                <a href="javascript:;" class="uploadImg">点击上传</a>
                                <small></small>
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">3D展示资源</label>
                            <div class="am-u-sm-9">
                                <input type="text" readonly id="vpath" name="vpath" required placeholder="">
                                <a href="javascript:;" class="upload3D">点击上传</a>
                                <small></small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">物品介绍</label>
                            <div class="am-u-sm-9">
                                <textarea name="description" required></textarea>
                                <small></small>
                            </div>
                        </div>


                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">物品图文</label>
                            <div class="am-u-sm-9">
                                <textarea name="content" required></textarea>
                                <small></small>
                            </div>
                        </div>


                        <div class="am-form-group">
                            <div class="am-u-sm-9 am-u-sm-push-3">
                                <button type="submit" class="am-btn am-btn-primary">保存数据</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </div>
</div>
</div>
<%--</form>--%>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="width: 800px" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width: 800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    选择区域
                </h4>
            </div>
            <div class="modal-body">
                <div class="test-div">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary btntest1">
                    确定
                </button>
            </div>
        </div>
    </div>
</div>
<script src="<%=basePath %>static/assets/js/amazeui.min.js"></script>
<script src="<%=basePath %>static/assets/js/iscroll.js"></script>
<script src="<%=basePath %>static/assets/js/app.js"></script>

<script src="<%=basePath %>/static/admin/js/bootstrap.min.js"></script>
<script src="<%=basePath %>/static/admin/js/RegionalChoice.js"></script>
<script src="<%=basePath %>static/layer/layer.js"></script>
<script src="<%=basePath%>source/scripts/window.js"></script>
<c:if test="${!empty message}">
    <script>
        var btn = $("#showMsgBtn", window.parent.document);
        var msg = $("#msg", window.parent.document);
        $(msg).val("${message}");
        $(btn).click();
        //layer.alert("${message}",{icon: 1});
    </script>
</c:if>
<script>
    window.onload = function () {
        $(".uploadImg").click(function () {
            openWindow("<%=basePath%>upload.jsp");
        });
        $("#thumb").on("input", function () {
            $(".oldImg").attr("src", "<%=basePath%>" + $("#thumb").val());
        });

        //------生成地区
        GetRegionPlug();
        //------选择后确定按钮
        $(".btntest1").click(function () {
            var areas = GetChecked().join(",");//已选择的城市名
            $("#areas").val(areas);//显示在页面
            $('#myModal').modal('hide');//完后隐藏模态框
        })
        $(".upload3D").click(function () {
            openWindow("<%=basePath%>upload3D.jsp");
        });
    };

</script>
<script src="<%=basePath %>static/kindeditor-4.1.10/kindeditor-min.js"></script>
<script>
    KindEditor.ready(function (K) {
        editor = K.create('textarea[name="content"]', {
            uploadJson: '<%=basePath %>static/kindeditor-4.1.10/php/upload_json.php',
            fileManagerJson: '<%=basePath %>static/kindeditor-4.1.10/php/file_manager_json.php',
            allowFileManager: true,
            items: ['source',
                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons', 'image', 'link', 'fullscreen'],
            afterBlur: function () {
                this.sync();
            }
        });
    });


</script>
</body>

</html>
