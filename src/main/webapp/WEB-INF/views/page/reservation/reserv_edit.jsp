<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/page/reservation.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/reservation.js"></script>
<div id="fade">
<div class="container">
	<div id="reserv-room-modal">
		<div id="reserv-room-exit" onclick="findRoom(-1,0)">X</div>
		<ul>
			<li>
				<ul>
				<c:forEach var="i" begin="301" end="308">
					<li onclick="selectRoom('${i}')">${i}</li>
				</c:forEach>
				</ul>
			</li>
			<li>
				<ul>
				<c:forEach var="i" begin="401" end="408">
					<li onclick="selectRoom('${i}')">${i}</li>
				</c:forEach>
				</ul>
			</li>
			<li>
				<ul>
				<c:forEach var="i" begin="501" end="508">
					<li onclick="selectRoom('${i}')">${i}</li>
				</c:forEach>
				</ul>
			</li>
			<li>
				<ul>
				<c:forEach var="i" begin="601" end="608">
					<li onclick="selectRoom('${i}')">${i}</li>
				</c:forEach>
				</ul>
			</li>
		</ul>
	</div>
	<div class="calendarBox">
		<div id="calendar-exit" onclick="closeCalendar()">X</div>
		<div id="calendar-next" onclick="moveCalendar(1)">▶</div>
		<div id="calendar-prev" onclick="moveCalendar(-1)">◀</div>
		<div id="month"></div>
		<div id="calendar"></div>
	</div>
	<c:if test="${roomVO!=null}">
		<script>
			document.addEventListener('DOMContentLoaded', () => {
				selectRoom('${roomVO.roomno}');
			});
		</script>
	</c:if>
	
	<div class="reserv-edit-container">
		<div id="reserv-title">Reservation Information</div>
		<div id="reserv-img-list">
			<div id="reserv-img-1"></div>
			<div id="reserv-img-2"></div>
			<div id="reserv-img-3"></div>
			<div onclick="goListPage(-1)" id="img-left-button"></div>
			<div onclick="goListPage(1)" id="img-right-button"></div>
		</div>
		<form name="reservForm" method="post" action="doReservation">
			<div id="reserv-form-box">
				<div id="reserv-left"><div id="idpw">ROOM</div></div><div id="reserv-right">
					<input type="text" style="padding:0;width:40%;text-align:center;" id="roomno" name="roomno" value="" readonly/>
				</div>
				<div id="reserv-left"><div id="idpw">CAPACITY</div></div> <div id="reserv-right"><input type="text" style="padding:0;width:40%;text-align:center;" id="capacity" value="" readonly/></div>
				<div id="reserv-left"><div id="idpw">BED-TYPE</div></div> <div id="reserv-right"><input type="text" style="padding:0;width:40%;text-align:center;" id="bedtype" value="" readonly/></div>
				<div id="reserv-left"><div id="idpw">VIEW-TYPE</div></div> <div id="reserv-right"><input type="text" style="padding:0;width:40%;text-align:center;" id="viewtype" value="" readonly/></div>
				<div id="reserv-left"><div id="idpw">CHECK-IN</div></div> <div id="reserv-right"><input type="text" style="padding:0;width:40%;text-align:center;" id="checkin" value="" readonly/></div>
				<div id="reserv-left"><div id="idpw">CHECK-OUT</div></div> <div id="reserv-right"><input type="text" style="padding:0;width:40%;text-align:center;" id="checkout" value="" readonly/></div>
				<div id="reserv-left"><div id="idpw">PRICE</div></div> <div id="reserv-right"><input type="text" style="padding:0;width:40%;text-align:center;" id="price" name="price" value="" readonly/></div>
				<div id="reserv-left"><div id="idpw">PEOPLE</div></div> <div id="reserv-right"><input readonly type="text" style="padding:0;width:40%;text-align:center;" id="usercnt" name="usercnt" value="${reservVO.usercnt}"/></div>
				<div id="reserv-left"><div id="idpw">REQUEST</div></div> <div id="reserv-right"><textarea readonly id="request" name="request">${reservVO.request}</textarea></div>
				<div id="reserv-left"><div id="idpw">DATE</div></div><div id="reserv-right">
					<input type="text" style="padding:0;width:40%;text-align:center;" id="reservdate" name="reservdate" value="${reservVO.reservdate.substring(0,10)}" readonly/>
				</div>
			</div>
			<input class="reserv-submit" type="button" onclick="reservChk()" value="예약취소"/>
		</form>
	</div>
</div>
</div>