<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/page/room.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/room.js"></script>
<div id="fade">
<div class="container">
	<div class="room-title">
		<div id="span-back"></div>
		<span>ROOM</span>
	</div>
	<div class="room-wrap">
		<div class="room-grid-box">
			<div onclick="moveToRoom('contemp')" class="grid-item" id="room-contemp"><span>Contemporary Art</span></div>
			<div onclick="moveToRoom('artnou')" class="grid-item" id="room-artnou"><span>Art Nouveau</span></div>
			<div onclick="moveToRoom('artdec')" class="grid-item" id="room-artdec"><span style="background-color:#121212; color:#eeeeee;">Art Déco</span></div>
			<div onclick="moveToRoom('asian')" class="grid-item" id="room-asian"><span>Asian</span></div>
		</div>
	</div>
</div>
</div>