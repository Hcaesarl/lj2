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
    <script src="<%=basePath %>static/assets/js/echarts.min.js"></script>

    <script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
    <script src="<%=basePath %>static/My97DatePicker/WdatePicker.js"></script>
</head>

<body data-type="index">


<div class="row" style="padding-left:30px;padding-right:30px;">

    <div class="tpl-portlet-components">
        <div class="portlet-title">
            <div class="caption font-green bold">
                <span class="am-icon-pencil"></span> 更新物品信息
            </div>
            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon right">
                        <p class="am-text-danger">
                            ${message }</p>
                    </div>
                </div>
            </div>


        </div>
        <div class="tpl-block ">

            <div class="am-g tpl-amazeui-form">


                <div class="am-u-sm-12 am-u-md-9">
                    <form class="am-form am-form-horizontal" action="<%=basePath %>goods/goods/update" method="POST">
                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-3 am-form-label">物品名称</label>
                            <div class="am-u-sm-9">
                                <input type="text" name="product_name" value="${model.product_name }" required
                                       placeholder="">
                                <input type="hidden" name="id" value="${model.id }"/>
                                <small></small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-3 am-form-label">物品图片</label>
                            <div class="am-u-sm-9">
                                <a target="_blank" href="<%=basePath %>${model.thumb }">
                                    查看
                                </a>
                                <br>
                                <input type="text" readonly value="${model.thumb }" id="thumb" name="thumb" required
                                       placeholder="">
                                <a href="javascript:;" class="uploadImg">点击上传</a>
                                <small></small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-u-sm-3 am-form-label">3D展示资源</label>
                            <div class="am-u-sm-9">
                                <a target="_blank" onclick="open3D('${model.id}')">
                                    查看
                                </a>
                                <input type="text" readonly id="vpath" name="vpath" value="${model.vpath }" required placeholder="">
                                <a href="javascript:;" class="upload3D">点击上传</a>
                                <small></small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-3 am-form-label">物品介绍</label>
                            <div class="am-u-sm-9">
                                <textarea name="description" required>${model.description }</textarea>
                                <small></small>
                            </div>
                        </div>


                        <div class="am-form-group">
                            <label for="user-name" class="am-u-sm-3 am-form-label">物品图文</label>
                            <div class="am-u-sm-9">
                                <textarea name="content" required>${model.content }</textarea>
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


<script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
<script src="<%=basePath %>static/assets/js/amazeui.min.js"></script>
<script src="<%=basePath %>static/assets/js/iscroll.js"></script>
<script src="<%=basePath %>static/assets/js/app.js"></script>
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
        $(".upload3D").click(function () {
            openWindow("<%=basePath%>upload3D.jsp");
        });
    };

    function open3D(vpath) {
        openWindow("/goods/three/" + vpath);
    }
</script>
<script src="<%=basePath %>static/kindeditor-4.1.10/kindeditor-min.js"></script>
<script>
    KindEditor.ready(function (K) {
        editor = K.create('textarea[name="bodytext"]', {
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
    })


</script>
</body>

</html>
