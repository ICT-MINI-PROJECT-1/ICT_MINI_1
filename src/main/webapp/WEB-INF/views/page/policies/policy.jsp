<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
#policyContent{
		display: flex;
		align-items: center; /* 이미지와 텍스트 수직 정렬 */
		justify-content: center; /* 수평 가운데 정렬 */
		font-size: 16px;
		text-align: left;
		line-height:40px;
		padding:20px
		height:900px;
		font-family: "Open Sans", sans-serif;
	}
</style>

<link href="${pageContext.request.contextPath }/css/page/policy.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/policy.js"></script>

<div id="fade">
	<div class="container">
		<div class="policy-title">
			<div id="span-back"></div>
			<span>${policyTitle}</span>
		</div>	

		<div class="policy-wrap">
			<div></div>
			<div id='policyContent'>
				<div>${policyContent}</div>
			</div>		
		</div>
	</div>
</div>
