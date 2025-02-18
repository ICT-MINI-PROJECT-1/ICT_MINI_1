<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/page/reservation.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/reservation.js"></script>
<div id="fade">
<div class="container">
	<div class="reserv-container">
		<div id="reserv-title">Reservation</div>
		<div id="reserv-img-list">
			<div id="img-left-button"></div>
			<div id="img-right-button"></div>
		</div>
		<form name="reservForm" method="post" action="reservChk">
			<div id="reserv-form-box">
				<div id="reserv-left"><div id="idpw">ID</div><div id="hidden-height">I</div></div> <div id="reserv-right"><input type="text" id="userid" name="userid"/><div id="alert-id">Invalid ID</div></div>
				<div id="reserv-left"><div id="idpw">PW</div><div id="hidden-height">I</div></div> <div id="reserv-right"><input type="password" id="userpw" name="userpw"/><div id="alert-pw">Invalid PW</div></div>
				<div id="reserv-left"><div id="idpw">PWCHECK</div><div id="hidden-height">I</div></div> <div id="reserv-right"><input type="password" id="userpw_chk" name="userpw_chk"/><div id="alert-pwchk">Invalid PW</div></div>
				<div id="reserv-left"><div id="idpw">NAME</div><div id="hidden-height">I</div></div> <div id="reserv-right"><input type="text" id="username" name="username"/><div id="alert-name">Invalid NAME</div></div>
				<div id="reserv-left"><div id="idpw">ZIPCODE</div><div id="hidden-height">I</div></div> <div id="reserv-right"><input style="width:30%;" type="text" id="zipcode" name="zipcode" readonly/><button class="buttons" style="width:20%;" type="button" onclick="daumPostCodeSearch()">Find</button><div id="alert-zipcode">Invalid ZIPCODE</div></div>
				<div id="reserv-left"><div id="idpw">ADDRESS</div><div id="hidden-height">I</div></div> <div id="reserv-right"><input type="text" id="addr" name="addr" readonly/><div id="alert-addr">Invalid ADDRESS</div></div>
				<div id="reserv-left"><div id="idpw">DETAIL</div></div> <div id="reserv-right"><input type="text" id="addrdetail" name="addrdetail"/><div id="alert-addrdetail">Invalid DETAIL</div></div>
			</div>
			<input class="reserv-submit" type="button" onclick="reservChk()" value="예약하기"/>
		</form>
	</div>
</div>
</div>