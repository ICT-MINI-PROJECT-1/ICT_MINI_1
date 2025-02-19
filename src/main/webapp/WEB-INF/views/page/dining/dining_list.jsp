<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<link href="${pageContext.request.contextPath}/css/page/dining.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/dining.js"></script>

<div id="fade">
	<div class="container">
		<div class="dining-menu">
			<c:if test="${foodType=='korean'}">
				<div id="d-title">
					<div id="d-subject">
						Korean
					</div>
					<a href="#">메뉴다운로드</a>
				</div>
				
				<div class="modal">
					<img src="/img/page/dining/content/kFood1-1.jpg"/>
					<button class="close-modal">닫기</button>
				</div>
				
				<div id="d-content">
					<div id="d-content1">
						<div id="menu-info">
							<div id="info-dish"><p>직접 담근 장, 김치, 식초, 장아찌로 <wbr/>전국에 진귀한 식재료를 이용한 <wbr/>이 시대에 맞는 한국요리를 맛보세요.</p></div>
						</div>
						
						<div id="subject-pic">
							<div></div>
							<div></div>
							<div></div>
						</div>
						
						<div id="menu-pic">
							<img src="/img/page/dining/content/kFood1.jpg"/>
							<img src="/img/page/dining/content/kFood2.jpg"/>
							<img src="/img/page/dining/content/kFood3.jpg"/>
						</div>
					</div>
					
					<div id="d-content2">
					
					</div>
					
					<div id="d-content3">
					
					</div>
				</div>
			</c:if>
			
			<c:if test="${foodType=='western'}">
				<div id="info-western">한국의 식재료를 재해석하여 선보이는 과감하고 창의적인 음식으로 압도적인 새로운 장르의 가치있는 경험을 선사시켜드리겠습니다.</div>
				
				<div id="western-page">
					<div id="menu-western">
						<img src="/img/page/dining/menu-western.jpg" title="확대하기"/>
						<a href="#">메뉴 다운로드</a>
					</div>
				</div>
			</c:if>
			
			<c:if test="${foodType=='japanese'}">
				<div id="info-japanese">전통과 혁신을 겸비한 에도마에 스시가 있는 편안하고 고급스러운 공간</div>
			
				<div id="japanese-page">
					<div id="menu-japanese">
						<img src="/img/page/dining/menu-japanese.jpg" title="확대하기"/>
						<a href="#">메뉴 다운로드</a>
					</div>
				</div>
			</c:if>	
		</div>
	</div>
</div>





