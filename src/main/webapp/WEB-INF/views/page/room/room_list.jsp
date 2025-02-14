<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/page/room.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/room.js"></script>
<div id="fade">
<div class="container">
	<div style="margin-top:200px;">
		<c:if test="${loc=='contemp'}">
			<div class="room-list-title">Contemporary Art Room</div>
		</c:if>
		<c:if test="${loc=='artnou'}">
			<div class="room-list-title">Art Nouveau Room</div>
		</c:if>
		<c:if test="${loc=='artdec'}">
			<div class="room-list-title">Art Déco Room</div>
		</c:if>
		<c:if test="${loc=='asian'}">
			<div class="room-list-title">Asian Room</div>
		</c:if>
		<div class="room-list-grid-box">
			<c:forEach var="data" items="${list}">
				<div class="room-list-grid-item">
					<div class="room-list-grid-item-img" id="item-${data.roomno}"></div>
					<ul class="item-top">
						<li>
							호수
						</li>
						<li>
							${data.roomno}호
						</li>
						<li>
							평점
						</li>
						<li>
							${data.rating}
						</li>
					</ul>
					<ul class="item-bottom">
						<li>
							화풍
						</li>
						<li>
							<c:if test="${data.roomconcept=='contemp'}">
								현대풍
							</c:if>
							<c:if test="${data.roomconcept=='artnou'}">
								아르누보풍
							</c:if>
							<c:if test="${data.roomconcept=='artdec'}">
								아르데코풍
							</c:if>
							<c:if test="${data.roomconcept=='asian'}">
								동양풍
							</c:if>
						</li>
						<li>
							인원
						</li>
						<li>
							${data.capacity }인실
						</li>
						<li>
							가격
						</li>
						<li>
							₩ ${data.price }
						</li>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</div>