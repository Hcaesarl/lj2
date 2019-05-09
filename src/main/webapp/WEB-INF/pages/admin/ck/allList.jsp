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
    <link rel="stylesheet" href="<%=basePath %>/static/admin/css/bootstrap-table.min.css">
    <script src="<%=basePath %>static/assets/js/echarts.min.js"></script>
</head>

<body data-type="index">


<div class="row" style="padding-left:30px;padding-right:30px;">

    <div class="tpl-portlet-components">
        <div class="portlet-title">
            <div class="caption font-green bold">
                <span class="am-icon-list"></span> 库存管理
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
            <table id="dataTable" class="table table-hover"></table>
        </div>
        <div id="toolbar">
            <a onclick="showModel()">
                <div class="btn-group">
                    <button class="btn btn-default">
                        <i class="glyphicon glyphicon-download"></i>添加仓库
                    </button>
                </div>
            </a>
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
                    新增仓库
                </h4>
            </div>
            <form id="form">
                <div class="modal-body">
                    <div class="form-group">
                        <label>仓库名称:
                            <span ><input class="form-control data" type="text" name="title"required placeholder=""></span></label>
                    </div>
                    <div class="form-group">
                        <label>仓库描述:
                            <span >
                                <textarea class="form-control data" type="text" name="description"required style="resize:none;"></textarea></span></label>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="add()" class="btn btn-primary btntest1">
                        提交
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width: 800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabe">
                    更新仓库
                </h4>
            </div>
            <form id="updateform">
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">
                    <div class="form-group">
                        <label>仓库名称:
                            <span ><input class="form-control data" type="text" id="title" name="title"required placeholder=""></span></label>
                    </div>
                    <div class="form-group">
                        <label>仓库描述:
                            <span >
                                <textarea class="form-control data" type="text" id="description" name="description" name="description"required style="resize:none;"></textarea></span></label>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="update()" class="btn btn-primary btntest1">
                        提交
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
<script src="<%=basePath %>static/assets/js/amazeui.min.js"></script>
<script src="<%=basePath %>static/assets/js/iscroll.js"></script>
<script src="<%=basePath %>static/assets/js/app.js"></script>
<script src="<%=basePath %>/static/admin/js/bootstrap.js"></script>
<script src="<%=basePath %>/static/admin/js/bootstrap-table.min.js"></script>
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
    $('#dataTable').bootstrapTable({
        url: '/ck/search/list',
        toolbar: "#toolbar",
        columns: [

            {
                field: 'title',
                title: '仓库名称',
                formatter: function (val, r) {
                    return r.title;
                }
            },
            {
                field: 'description',
                title: '描述',
                formatter: function (val, r) {
                    if (val == null) {
                        return '';
                    }
                }

            },
            {
                field: 'id',
                title: '操作',
                align: 'center', // 左右居中
                valign: 'middle', // 上下居中
                formatter: function (val, r) {
                   var _html = '<a class="am-icon-edit"  style="margin: 0 3px;color:#32c5d2" onclick="showUp(' + r.id + ',\'' + r.title + '\',\'' + r.description + '\')" title="删除"></a>';
                    _html += '<a class="am-icon-trash"  style="margin: 0 3px;color:#32c5d2" onclick="delect(' + r.id + ')" title="删除"></a>';

                    return _html;
                }
            }
        ]
    });

    function delect(id) {
        $.ajax({
            url: '/ck/ck/delete/' + id,
            success: function (rsp) {
                window.location.reload();
            }
        });
    }
    function showModel() {
        $('.data').val('');
        $('#myModal').modal('show');
    }

    function showUp(id, title,description) {
        $('.data').val('');
        $('#id').val(id);
        $('#title').val(title);
        if (description != 'null') {
            $('#description').val(description);

        }
        $('#myModal2').modal('show');
    }

    function add() {
        $.ajax({
            url: '/ck/ck/addCk',
            data: $('#form').serializeArray(),
            success: function (rsp) {
                window.location.reload();
            }
        });
    }

    function update() {
        $.ajax({
            url: '/ck/ck/updateCk',
            data: $('#updateform').serializeArray(),
            success: function (rsp) {
                window.location.reload();
            }
        });
    }

</script>

</body>

</html>
