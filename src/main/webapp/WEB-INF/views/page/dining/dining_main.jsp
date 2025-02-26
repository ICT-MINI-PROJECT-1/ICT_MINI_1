<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/page/dining.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/dining.js"></script>
<script>
	where="dining_main";
</script>
<div id="fade">
	<div class="container">
		<div class="dining-title">
			<div id="span-back"></div>
			<span>DINING</span>
		</div>
		<div class="dining-wrap">
			<div id="dining-category"> <!-- style="padding-bottom: 780px;" -->
				<div onclick="moveToRest('korean')" id="kor-pic" class="dining-pic"><span class="dining-intro">Korean</span></div>
				<div onclick="moveToRest('western')" id="wes-pic" class="dining-pic"><span class="dining-intro">Western</span></div>
				<div onclick="moveToRest('japanese')" id="jap-pic" class="dining-pic"><span class="dining-intro">Japanese</span></div>
				<div id="event">
			</div>
		</div>
	</div>
</div>





