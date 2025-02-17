<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<link href="${pageContext.request.contextPath}/css/page/dining.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/dining.js"></script>

<div id="fade">
	<div class="container">
		<div class="dining-menu">
			<c:if test="${foodType=='korean'}">
				loadKorean();
				<div id="korean-page">
					<div id="menu-korean">${pageContext.request.contextPath}/img/page/dining/menu-korean.jpg</div>
					<div id="info-korean"></div>
				</div>
			</c:if>
			<c:if test="${foodType=='western'}">
				<div id="western-page">
					loadWestern();
					<div id="menu-western">${pageContext.request.contextPath}/img/page/dining/menu-western.jpg</div>
					<div id="info-western"></div>
				</div>
			</c:if>
			<c:if test="${foodType=='japanese'}">
				<div id="japanese-page">
					loadJapanese();
					<div id="menu-japanese">${pageContext.request.contextPath}/img/page/dining/menu-japanese.jpg</div>
					<div id="info-japanese"></div>
				</div>
			</c:if>	
		</div>
	</div>
</div>





