<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/page/room.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/room.js"></script>

<div id="fade">
<div class="container">
	<div id="room-list-modal">
		<div id="modal-exit" onclick="closeModal()"></div>
		<div id="modal-grid">
			<div id="modal-img"></div>
			<div id="modal-contents">
				<ul>
					<li id="contents-roominfo">
					</li>
				</ul>
				<ul>
					<li>호수</li>
					<li id="contents-roomno">
					</li>
					<li>화풍</li>
					<li id="contents-roomconcept">
					</li>
					<li>뷰</li>
					<li id="contents-viewtype">
					</li>
				</ul>
				<ul>
					<li>인원</li>
					<li id="contents-capacity">
					</li>
					<li>면적</li>
					<li id="contents-area">
					</li>
					<li>침대</li>
					<li id="contents-bedtype">
					</li>
				</ul>
				<ul>
					<li>가격</li>
					<li id="contents-price">
					</li>
					<li>평점</li>
					<li id="contents-rating">
					</li>
				</ul>
				<ul>
					<li>예약하러가기</li>
				</ul>
			</div>
		</div>
	</div>
	<div style="margin-top:200px;">
		<c:if test="${loc=='contemp'}">
			<div class="room-list-title">Contemporary Art Room</div>
			<script>
				document.addEventListener('DOMContentLoaded', () => {
					renderList(301,'contemp');
					renderWish(3);
				});
			</script>
		</c:if>
		<c:if test="${loc=='artnou'}">
			<div class="room-list-title">Art Nouveau Room</div>
			<script>
			document.addEventListener('DOMContentLoaded', () => {
				renderList(401,'artnou');
				renderWish(4);
			});
			</script>
		</c:if>
		<c:if test="${loc=='artdec'}">
			<div class="room-list-title">Art Déco Room</div>
			<script>
			document.addEventListener('DOMContentLoaded', () => {
				renderList(501,'artdec');
				renderWish(5);
			});
			</script>
		</c:if>
		<c:if test="${loc=='asian'}">
			<div class="room-list-title">Asian Room</div>
			<script>
			document.addEventListener('DOMContentLoaded', () => {
				renderList(601,'asian');
				renderWish(6);
			});
			</script>
		</c:if>
		<div class="room-list-grid-box">
			<c:forEach var="data" items="${list}">
				<div class="room-list-grid-item">
					<c:if test="${loginStatus=='Y'}">
					<div class="wish-button" id="wish-${data.roomno}" onclick="doWish('${data.roomno}')"></div>
					</c:if>
					<div class="room-list-grid-item-img" onclick="openModal(${data.roomno})" id="item-${data.roomno}">
					</div>
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
							<div class="star-box">
								<div class="star-fill" style="width:90%;position:absolute;
	height:100%;
	background:url('../../img/public/star_fill.png') no-repeat;
	background-size:cover;
	z-index:2;
	will-change: transform;"></div>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${data.rating}
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