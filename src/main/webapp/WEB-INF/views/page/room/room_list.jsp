<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
					<li><b>No.</b></li>
					<li id="contents-roomno">
					</li>
					<li><b>컨셉</b></li>
					<li id="contents-roomconcept">
					</li>
					<li><b>뷰</b></li>
					<li id="contents-viewtype">
					</li>
				</ul>
				<ul>
					<li><b>인원</b></li>
					<li id="contents-capacity">
					</li>
					<li><b>면적</b></li>
					<li id="contents-area">
					</li>
					<li><b>룸타입</b></li>
					<li id="contents-bedtype">
					</li>
				</ul>
				<ul>
					<li><b>가격</b></li>
					<li id="contents-price">
					</li>
					<li><b>평점</b></li>
					<li id="contents-rating">
					</li>
				</ul>
				<ul>
					<li onclick="moveReserv()">예약하러가기</li>
				</ul>
			</div>
		</div>
	</div>
	<div style="margin-top:200px;">
		<c:if test="${loc=='contemp'}">
			<div class="room-list-title">Contemporary Art Room</div>
			<div id="titlecomment">
				<p>대담한 색채, 독창적인 아트워크, 그리고 세련된 디자인이 어우러진 현대적 공간에서<br> 
				일상의 경계를 넘은 창의적인 영감을 채우는 특별한 순간을 즐겨보세요.</p>
			</div>
			<script>
				document.addEventListener('DOMContentLoaded', () => {
					renderList(301,'contemp');
					renderWish(3);
				});
			</script>
		</c:if>
		<c:if test="${loc=='artnou'}">
			<div class="room-list-title">Art Nouveau Room</div>
			<div id="titlecomment">
				<p>우아한 곡선, 자연의 조화에서 영감받은 섬세한 디테일,<br>
				 그리고 시대를 초월한 우아함이 가득한 공간에서 특별한 휴식을 즐겨보세요.</p>
			</div>
			<script>
			document.addEventListener('DOMContentLoaded', () => {
				renderList(401,'artnou');
				renderWish(4);
			});
			</script>
		</c:if>
		<c:if test="${loc=='artdec'}">
			<div class="room-list-title">Art Déco Room</div>
			<div id="titlecomment">
				<p>화려한 색채와 럭셔리한 무드가 돋보이는 세련된 인테리어와<br>
				고급스러운 소재가 어우러진 공간에서 과거와 현재가 조화를 이루는 우아한 순간을 맞이해 보세요.</p>
			</div>
			<script>
			document.addEventListener('DOMContentLoaded', () => {
				renderList(501,'artdec');
				renderWish(5);
			});
			</script>
		</c:if>
		<c:if test="${loc=='asian'}">
			<div class="room-list-title">Asian Room</div>
			<div id="titlecomment">
				<p>동양의 미학이 담긴 절제된 아름다움, 자연 친화적인 소재가 만들어낸<br>
				전통과 현대가 어우러진 공간에서 차분한 휴식을 경험하세요.</p>
			</div>
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
							<div class="star-fill" style="width:${data.rating*20}%; position:absolute;
										height:100%;
										background:url('../../img/public/star_fill.png') no-repeat;
										background-size:cover;
										z-index:2;
										will-change: transform;">
										</div>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber value="${data.rating }" pattern="0.0"/>
						</li>
					</ul>
				<!-- <ul class="item-bottom">
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
					</ul> -->
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</div>