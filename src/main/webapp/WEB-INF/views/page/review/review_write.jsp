<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/page/review.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/review.js"></script>
<div id="fade">
<div class="container">
	<div class="review-title">
		<div id="span-back"></div>
		<span>REVIEW</span>
	</div>
	<div class="review-wrap">
		<div>리뷰 작성 페이지</div>
		<form>
			<ul>
				<li>제목</li>
				<li><input type="text" name="subject" id="subject"></li>
				<li>내용</li>
				<li><textarea name="content" id="content"></textarea></li>
			</ul>
			<input type="submit" value="작성완료">
		</form>
	</div>
</div><!-- container 끝 -->
</div>