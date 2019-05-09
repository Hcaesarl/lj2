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
    <script type="text/javascript" src="<%=basePath%>/static/admin/js/jquery-2.0.3.min.js" ></script>
    <script type="text/javascript" src="<%=basePath%>/static/admin/js/three.js" ></script>
    <script type="text/javascript" src="<%=basePath%>/static/admin/js/TrackballControls.js" ></script>
    <script type="text/javascript" src="<%=basePath%>/static/admin/js/DDSLoader.js" ></script>
    <script type="text/javascript" src="<%=basePath%>/static/admin/js/OBJLoader.js" ></script>
    <script type="text/javascript" src="<%=basePath%>/static/admin/js/OBJMTLLoader.js" ></script>
    <title></title>
</head>
<style>
    body{
        margin: 0;
        overflow: hidden;
    }
    #percent {
        position: absolute;
        width: 200px;
        height: 20px;
        color: red;
        text-align: center;
        border: 1p;
    }
</style>
<body>
<div id="percent"></div>
<div id="WebGL-output">

</div>
<script>
    $(function(){
        //直接开启帧数检测
        //编辑代码处
        var scene = new THREE.Scene();//场景构建
        var camera = new THREE.PerspectiveCamera(45,window.innerWidth/window.innerHeight,0.1,1000);//相机构建
        var renderer = new THREE.WebGLRenderer();//渲染器构建
        renderer.setClearColor(0xEEEEEE);
        renderer.setSize(window.innerWidth,window.innerHeight);
        renderer.shadowMapEnabled = true;//激活阴影
        //构建一个坐标轴
        var axes = new THREE.AxisHelper(20);
        scene.add(axes);
        //创建控件并绑定在相机上
        trackballControls = new THREE.TrackballControls(camera);
        trackballControls.rotateSpeed = 1.0;
        trackballControls.zoomSpeed = 1.0;
        trackballControls.panSpeed = 1.0;
        trackballControls.noZoom=false;
        trackballControls.noPan=false;
        trackballControls.staticMoving = true;
        trackballControls.dynamicDampingFactor = 0.3;
        var planeGeometry = new THREE.PlaneGeometry(40,20);
        //var planeMaterial = new THREE.MeshBasicMaterial({color:0xcccccc});
        var planeMaterial = new THREE.MeshLambertMaterial({color:0xffffff});//转换对光源有渲染的材质
        var plane = new THREE.Mesh(planeGeometry,planeMaterial);
        plane.rotation.x = -0.5*Math.PI;
        plane.position.x = 15;
        plane.position.y = 0;
        plane.position.x = 0;
        scene.add(plane);
        plane.receiveShadow  = true;
        //添加材质灯光阴影
        var spotLight = new THREE.SpotLight(0xffffff);
        spotLight.position.set(-10,20,10);
        spotLight.castShadow = true;
        scene.add(spotLight);

        // model
        var onProgress = function(xhr) {
            if (xhr.lengthComputable) {
                var percentComplete = xhr.loaded / xhr.total * 100;
                var percent = document.getElementById("percent");
                percent.innerText = Math.round(percentComplete, 2) + '% 已经加载';
            }
        };
        var onError = function(xhr) {};
        var mtlLoader = new THREE.MTLLoader();
        mtlLoader.setPath('<%=basePath%>file/');
        mtlLoader.load('${vpath}', function(materials) {

            materials.preload();

            var objLoader = new THREE.OBJLoader();
            objLoader.setMaterials(materials);
            objLoader.setPath('<%=basePath%>file/');
            objLoader.load('IronMan.obj', function(object) {

                object.position.y = 0;
                object.rotation.y = 0.5;
                object.scale.set(0.05, 0.05, 0.05);
                scene.add(object);

            }, onProgress, onError);
        });
        //渲染视图视角
        camera.position.x = -30;
        camera.position.y = 20;
        camera.position.z = 30;
        camera.lookAt(scene.position)
        $("#WebGL-output").append(renderer.domElement)
        renderScene();
        function renderScene(){
            var clock = new THREE.Clock();
            var delta = clock.getDelta();
            trackballControls.update(delta);
            requestAnimationFrame(renderScene);
            renderer.render(scene,camera);
        }

    })
</script>

</body>
</html>
