<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<link href="${pageContext.request.contextPath}/css/page/dining.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/dining.js"></script>
<script>
	where="dining-list";
</script>
<div id="fade">
	<div class="container">
		<div class="dining-menu">
			<div id="dining-page-nav">
				<ul>
					<li onclick="moveToRestNav('korean')">Korean</li>
					<li onclick="moveToRestNav('western')">Western</li>
					<li onclick="moveToRestNav('japanese')">Japanese</li>
				</ul>
			</div>
		
			<c:if test="${foodType=='korean'}">
				<div id="d-title">
					<div id="d-subject">
						Korean
					</div>
					<a href="../../img/page/dining/download/menu-korean.jpg" download>메뉴다운로드</a>
				</div>
			
				<div id="d-modal">
					<input type="image" src="/img/page/dining/X.jpg" onclick="closeModal()"/>
					
					<div class="modal-content">
						<div id="tInfo"></div>
						<img id="tImg" src=""/>
					</div>
					
					<div id="move-btn">
						<input type="image" src="/img/page/dining/back.jpg" onclick="moveBack()"/>
						<input type="image" src="/img/page/dining/next.jpg" onclick="moveNext()"/>
					</div>
				</div>
				
				<div id="d-content">
					<div id="d-content1">
						<div id="menu-info">
							<div id="info-dish">
								<p>전국에 진귀한 식재료를 이용하여 직접 담근 <ruby>전통음식<rt style="color: brown; margin-bottom:5px;">
								   장, 김치, 식초, 장아찌</rt></ruby>과 이 시대에 맞는 한국요리를 맛보세요.</p>
					 	  	</div>
						</div>
						
						<div id="subject-pic">
							<div>전통 한식의 근원을 존중하되,</div>
							<div>오늘날의 새로운 기술과 감성을 덧입혀</div>
							<div>새로운 한국의 맛을 전하겠습니다.</div>
						</div>
						
						<div id="menu-pic">
							<img src="/img/page/dining/content/kFood1.jpg" title="자세한 내용" onclick="openModal(0)"/>
							<img src="/img/page/dining/content/kFood2.jpg" title="자세한 내용" onclick="openModal(1)"/>
							<img src="/img/page/dining/content/kFood3.jpg" title="자세한 내용" onclick="openModal(2)"/>
						</div>
					</div>
					
					<div id="d-content2">
						<div id="menu-pic2">
							<img src="/img/page/dining/content/kFood2-1.jpg" title="자세한 내용" onclick="openModal(3)"/>
							<img src="/img/page/dining/content/kFood1-1.jpg" title="자세한 내용" onclick="openModal(4)"/>
							<img src="/img/page/dining/content/kFood3-1.jpg" title="자세한 내용" onclick="openModal(5)"/>
						</div>
					
						<div id="subject-pic2">
							<div>단품(양갈비)</div>
							<div>단품(떡갈비)</div>
							<div>단품(디저트)</div>
						</div>
					</div>
				</div>
			</c:if>
			
			<c:if test="${foodType=='western'}">				
				<div id="d-title">
					<div id="d-subject">
						Western
					</div>
					<a href="../../img/page/dining/download/menu-western.jpg" download>메뉴다운로드</a>
				</div>
			
				<div id="d-modal">
					<input type="image" src="/img/page/dining/X.jpg" onclick="closeModal()"/>
					
					<div class="modal-content">
						<div id="tInfo"></div>
						<img id="tImg" src=""/>
					</div>
					
					<div id="move-btn">
						<input type="image" src="/img/page/dining/back.jpg" onclick="moveBack()"/>
						<input type="image" src="/img/page/dining/next.jpg" onclick="moveNext()"/>
					</div>
				</div>
				
				<div id="d-content">
					<div id="d-content1">
						<div id="menu-info">
							<div id="info-dish">
								<p style="margin-left: -350px;">
									한국의 식재료를 재해석하여 과감하고 <ruby>창의적인 음식으로,
									<rt style="color: brown; margin-bottom:5px; letter-spacing: 0.1em;">분기별 팝업레스토랑 진행중</rt></ruby>
								</p>
								<p style="margin-top: -30px;">압도적인 새로운 장르의 가치있는 경험을 선사시켜드리겠습니다.</p>
					 	  	</div>
						</div>
						
						<div id="subject-pic">
							<div>장르의 경계를 허문 코스로,</div>
							<div>예상할 수 없는 조합이 탄생하는</div>
							<div>가장 특별한 식사 경험</div>
						</div>
						
						<div id="menu-pic">
							<img src="/img/page/dining/content/wFood1.jpg" title="자세한 내용" onclick="openModal(6)"/>
							<img src="/img/page/dining/content/wFood2.jpg" title="자세한 내용" onclick="openModal(7)"/>
							<img src="/img/page/dining/content/wFood3.jpg" title="자세한 내용" onclick="openModal(8)"/>
						</div>
					</div>
					
					<div id="d-content2">
						<div id="menu-pic2">
							<img src="/img/page/dining/content/wFood1-1.jpg" title="자세한 내용" onclick="openModal(9)"/>
							<img src="/img/page/dining/content/wFood2-1.jpg" title="자세한 내용" onclick="openModal(10)"/>
							<img src="/img/page/dining/content/wFood3-1.jpg" title="자세한 내용" onclick="openModal(11)"/>
						</div>
					
						<div id="subject-pic2">
							<div>단품(랍스터테일)</div>
							<div>단품(오리가슴살)</div>
							<div>단품(소르베)</div>
						</div>
					</div>
				</div>
			</c:if>
			
			<c:if test="${foodType=='japanese'}">
				<div id="d-title">
						<div id="d-subject">
							Japanese
						</div>
						<a href="../../img/page/dining/download/menu-japanese.jpg" download>메뉴다운로드</a>
					</div>
				
					<div id="d-modal">
						<input type="image" src="/img/page/dining/X.jpg" onclick="closeModal()"/>
						
						<div class="modal-content">
							<div id="tInfo"></div>
							<img id="tImg" src=""/>
						</div>
						
						<div id="move-btn">
							<input type="image" src="/img/page/dining/back.jpg" onclick="moveBack()"/>
							<input type="image" src="/img/page/dining/next.jpg" onclick="moveNext()"/>
						</div>
					</div>
			
				<div id="d-content">
					<div id="d-content1">
						<div id="menu-info">
							<div id="info-dish" style="position: relative; left: -70px;">
								<p>전통과 혁신을 겸비한 <ruby>에도마에 스시<rt style="color: brown; margin-bottom:5px;">300년전통의</rt></ruby>가 있는 편안하고 고급스러운 공간</p>
					 	  	</div>
						</div>
						
						<div id="subject-pic">
							<div>보다 퀄리티 높은 재료와 음식으로,</div>
							<div>보다 편안한 주파수의 분위기를</div>
							<div>고객에게 서비스합니다.</div>
						</div>
						
						<div id="menu-pic">
							<img src="/img/page/dining/content/jFood1.jpg" title="자세한 내용" onclick="openModal(12)"/>
							<img src="/img/page/dining/content/jFood2.jpg" title="자세한 내용" onclick="openModal(13)"/>
							<img src="/img/page/dining/content/jFood3.jpg" title="자세한 내용" onclick="openModal(14)"/>
						</div>
					</div>
					
					<div id="d-content2">
						<div id="menu-pic2">
							<img src="/img/page/dining/content/jFood1-1.jpg" title="자세한 내용" onclick="openModal(15)"/>
							<img src="/img/page/dining/content/jFood2-1.jpg" title="자세한 내용" onclick="openModal(16)"/>
							<img src="/img/page/dining/content/jFood3-1.jpg" title="자세한 내용" onclick="openModal(17)"/>
						</div>
					
						<div id="subject-pic2">
							<div>단품(미소시루)</div>
							<div>단품(갈치구이)</div>
							<div>사케</div>
						</div>
					</div>
				</div>
			</c:if>	
		</div>
	</div>
</div>





