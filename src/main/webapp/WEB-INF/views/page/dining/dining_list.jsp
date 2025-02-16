<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<link href="${pageContext.request.contextPath}/css/page/dining.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/dining.js"></script>

<div id="fade">
	<div class="container">
		<div class="dining-menu">
			<c:if test="${foodType=='korean'}">
				<div id="korean-page">
					
				</div>
			</c:if>
			<c:if test="${foodType=='western'}">
				<div id="western-page">
				
				</div>
			</c:if>
			<c:if test="${foodType=='japanese'}">
				<div id="japanese-page">
				
				</div>
			</c:if>	
		</div>
	</div>
</div>





