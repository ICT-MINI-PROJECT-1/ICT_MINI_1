<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<link href="${pageContext.request.contextPath}/css/page/dining.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/dining.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" 
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" 
	crossorigin="anonymous"></script>

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
				
				<div id="forBlur">
					<div id="d-modal">
						<input type="image" src="/img/page/dining/X.jpg" onclick="closeModal()"/>
						
						<%-- <c:if test=""> --%>
						<div class="modal-content">
							<div><%-- ${thisInfo} --%></div>
							<img src="#"/>
						</div>
						<%-- </c:if> --%>
						
						<div id="move-btn">
							<input type="image" src="/img/page/dining/back.jpg" /><!-- onclick="moveBack()" -->
							<input type="image" src="/img/page/dining/next.jpg"/><!-- onclick="moveNext()" -->
						</div>
					</div>
				</div>
				
				<div id="d-content">
					<div id="d-content1">
						<div id="menu-info">
							<div id="info-dish"><p>전국에 진귀한 식재료를 이용하여<wbr> 직접 담근 장, 김치, 식초, 장아찌와 <wbr>이 시대에 맞는 한국요리를 맛보세요.</p></div>
						</div>
						
						<div id="subject-pic">
							<div>전통 한식의 근원을 존중하되,</div>
							<div>오늘날의 새로운 기술과 감성을 덧입혀</div>
							<div>새로운 한국의 맛을 전하겠습니다.</div>
						</div>
						
						<div id="menu-pic">
							<img src="/img/page/dining/content/kFood1.jpg" title="자세한 내용" onclick="openModal()"/>
							<img src="/img/page/dining/content/kFood2.jpg" title="자세한 내용" onclick="openModal()"/>
							<img src="/img/page/dining/content/kFood3.jpg" title="자세한 내용" onclick="openModal()"/>
						</div>
					</div>
					
					<div id="d-content2">
						<div id="menu-pic2">
							<img src="/img/page/dining/content/kFood2-1.jpg" title="자세한 내용" onclick="openModal()"/>
							<img src="/img/page/dining/content/kFood1-1.jpg" title="자세한 내용" onclick="openModal()"/>
							<img src="/img/page/dining/content/kFood3-1.jpg" title="자세한 내용" onclick="openModal()"/>
						</div>
					</div>
					
					<div id="subject-pic2">
						<div>전통 한식의 근원을 존중하되,</div>
						<div>오늘날의 새로운 기술과 감성을 덧입혀</div>
						<div>새로운 한국의 맛을 전하겠습니다.</div>
					</div>
				</div>
			</c:if>
			
			<c:if test="${foodType=='western'}">				
				<div id="western-page">
					<div id="menu-western">
						<div id="d-title">
							<div id="d-subject">
								Western
							</div>
						<a href="#">메뉴다운로드</a>
					</div>
				</div>
				
				<div id="info-western">한국의 식재료를 재해석하여 선보이는 과감하고 창의적인 음식으로 압도적인 새로운 장르의 가치있는 경험을 선사시켜드리겠습니다.</div>
					
					<div>
					
					</div>
				</div>
			</c:if>
			
			<c:if test="${foodType=='japanese'}">
			
				<div id="d-title">
					<div id="d-subject">
						Japanese
					</div>
					<a href="#">메뉴다운로드</a>
				</div>
				
				<div id="info-japanese">전통과 혁신을 겸비한 에도마에 스시가 있는 편안하고 고급스러운 공간</div>
			
				<div id="japanese-page">
					<div id="menu-japanese">
						
					</div>
				</div>
			</c:if>	
		</div>
	</div>
</div>





