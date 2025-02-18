<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/page/reservation.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/reservation.js"></script>
<div id="fade">
<div class="container">
	<div class="reserv-title">
		<div id="span-back"></div>
		<span>RESERVATION</span>
	</div>
	<div class="reserv-wrap">
		<div id="reserv-box">
			<div id="reserv-blank"><p id="reserv-typing"></p></div>
			<div id="reserv-button" onclick="moveReserv('')">예약하기</div>
		</div>
	</div>
</div>
</div>