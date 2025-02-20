<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/page/review.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/review.js"></script>
<div id="fade">
<div class="container">
	<div class="review-write-wrap">
		<div id="write-box">
			<form method="post" id="review-write-form">
				<div id="write-title">Review Write</div>
				<div id="write-username">
					<div>username</div>
				</div>
				<div id="write-writedate-hit">
					<div id="form-writedate">2025-02-20</div>
				</div>
				<div id="write-roomno-rating">
					<div id="form-roomno">호수<input type="text" name="roomno" id="roomno" readonly></div>
					<div id="form-rating">평점<input type="text" name="rating" id="rating"></div>
				</div>
				<div id="form-subject">
					<div id="form-subject-div">제목</div>
					<input type="text" name="subject" id="subject">
				</div>
				<textarea name="content" id="content">내용을 입력하세요</textarea>
				<input type="submit" value="작성완료">
			</form>
		</div>
	</div>
</div><!-- container 끝 -->
</div>