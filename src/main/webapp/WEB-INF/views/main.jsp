<%@ page import="com.TheS.Common.TheSCommon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%= TheSCommon.appName %> - 메인화면</title>

</head>
<body>

<div id="wrap">
	<div id="header">
	</div>
	
	<div class="log">
		x축 : <br> 
		y축 : 
	</div>
	
	<div id="container">
		<!-- test ForEach (s) -->
		<c:forEach items="${test }" var="test">
			${test.test }
		</c:forEach>
		<!-- test ForEach (e) -->
	</div>

	
	<div id="footer">
	</div>
</div>

<!-- contextPath variable declare -->
<script type="text/javascript">
	var ctx = "<%= request.getContextPath() %>";
</script>

<%-- common js include file --%>
<%@include file="/WEB-INF/views/js/common.jsp" %>

<!-- page script declare -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/library/3d/three.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/library/3d/CanvasRenderer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/library/3d/Projector.js"></script>

<!-- add library for human model -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/library/3d/Detector.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/library/3d/ColladaLoader.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/library/3d/stats.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/library/3d/OrbitControls.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/library/3d/Fog.js"></script>

<!-- script (s) -->
<script type="text/javascript">

//test log object variable
var $log = $(".log");

//three js setttings
var renderer = new THREE.WebGLRenderer({ alpha: true }),
	scene = new THREE.Scene();

renderer.setSize( 800, 600 ); //canvas width and height setting
renderer.setClearColor( 0x939393, 1 ); //canvas color setting
renderer.shadowMapEnabled = true;

 
document.getElementById("container").appendChild( renderer.domElement ); //canvas arrange to container

/* set camera property */
var angle = 35,
	aspect = 800 / 600,
	near = 0.1,
	far = 10000;
var camera = new THREE.PerspectiveCamera( angle, aspect, near, far );

camera.position.set( 0, 0, 50 );
camera.lookAt( scene.position );

/* cube model declare */
var material = new THREE.MeshLambertMaterial({
	color : 0x99CCFF
}),
mesh = new THREE.CubeGeometry( 5, 5, 5 );
var cube = new THREE.Mesh( mesh, material );
cube.position.y = 2;
cube.castShadow = true;
cube.receiveShadow  = true;
cube.shadowDarkness	= -1;

var geometry	= new THREE.CubeGeometry( 1000, 0.2, 1000);
var material	= new THREE.MeshPhongMaterial({
	color		: 0x939393
});
var torusKnot	= new THREE.Mesh( geometry, material );
torusKnot.scale.multiplyScalar(3);
torusKnot.position.y =  0;
scene.add( torusKnot );

torusKnot.castShadow	= false;
torusKnot.receiveShadow	= true;
torusKnot.shadowDarkness	= 0;
torusKnot.shadowCameraNear	= 0;

/* light declare */
var light = new THREE.DirectionalLight( 0x99CCFF );
var ambient = new THREE.DirectionalLight( 0x444444, 2 );
light.position.set( 10, 5, 10 ).normalize();
light.castShadow		= true;
light.receiveShadow	= false;
// light.shadowCameraVisible = true;
// light.shadowCameraNear	= 0.01;		
// light.shadowDarkness	= 1;


/* camera, cube, light arrange to scene */
scene.fog = new THREE.Fog( 0x939393, 0.0015, 1000 );
scene.add( camera );
scene.add( cube );
scene.add( light );
scene.add( ambient );

var controls = new THREE.OrbitControls( camera, renderer.domElement );


var render = function () {
	renderer.render( scene, camera );
	requestAnimationFrame( render );
};
render();

var panelControll = function () {
	console.log( "pass" );
}
panelControll();

</script>
<!-- script (e) -->

</body>
</html>