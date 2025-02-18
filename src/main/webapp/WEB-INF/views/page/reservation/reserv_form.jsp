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
		<div id="month"></div>
		<div id="calendar"></div>
	</div>
	<c:if test="${vo!=null}">
		<script>
			document.addEventListener('DOMContentLoaded', () => {
				selectRoom('${vo.roomno}');
			});
		</script>
	</c:if>
	
	<div class="reserv-container">
		<div id="reserv-title">Reservation</div>
		<div id="reserv-img-list">
			<div id="reserv-img-1"></div>
			<div id="reserv-img-2"></div>
			<div id="reserv-img-3"></div>
			<div onclick="goListPage(-1)" id="img-left-button"></div>
			<div onclick="goListPage(1)" id="img-right-button"></div>
		</div>
		<form name="reservForm" method="post" action="reservChk">
			<div id="reserv-form-box">
				<div id="reserv-left"><div id="idpw">ROOM</div></div><div id="reserv-right">
					<input type="text" style="padding:0;width:40%;text-align:center;" id="roomno" name="roomno" value="" readonly/>
					<button class="buttons" style="width:20%;" type="button" onclick="findRoom(5,1)">Find</button>
				</div>
				<div id="reserv-left"><div id="idpw">CAPACITY</div></div> <div id="reserv-right"><input type="text" style="padding:0;width:40%;text-align:center;" id="capacity" name="capacity" value="" readonly/></div>
				<div id="reserv-left"><div id="idpw">BED-TYPE</div></div> <div id="reserv-right"><input type="text" style="padding:0;width:40%;text-align:center;" id="bedtype" name="bedtype" value="" readonly/></div>
				<div id="reserv-left"><div id="idpw">VIEW-TYPE</div></div> <div id="reserv-right"><input type="text" style="padding:0;width:40%;text-align:center;" id="viewtype" name="viewtype" value="" readonly/></div>
				<div id="reserv-left"><div id="idpw">CHECK-IN</div></div> <div id="reserv-right"><input type="text" style="padding:0;width:40%;text-align:center;" id="checkin" name="checkin" value="" readonly/></div>
				<div id="reserv-left"><div id="idpw">CHECK-OUT</div></div> <div id="reserv-right"><input type="text" style="padding:0;width:40%;text-align:center;" id="checkout" name="checkout" value="" readonly/></div>
				<div id="reserv-left"><div id="idpw">PRICE</div></div> <div id="reserv-right"><input type="text" style="padding:0;width:40%;text-align:center;" id="price" name="price" value="" readonly/></div>
				<div id="reserv-left"><div id="idpw">DATE</div></div><div id="reserv-right">
					<input type="text" style="padding:0;width:40%;text-align:center;" id="reservdate" name="reservdate" value="" readonly/>
					<button class="buttons" style="width:20%;" type="button" onclick="openCalendar()">Find</button>
				</div>
			</div>
			<input class="reserv-submit" type="button" onclick="reservChk()" value="예약하기"/>
		</form>
	</div>
</div>
</div>