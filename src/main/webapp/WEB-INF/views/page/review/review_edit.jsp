<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/page/review.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/review.js"></script>
<div id="fade">
<div class="container">
	<div class="review-write-wrap">
		<div id="write-box">
			<form method="post" action="${pageContext.request.contextPath }/page/review/editOk" id="review-write-form">
				<input type="hidden" name="reviewno" value="${vo.reviewno }"/>
				<div id="write-title">Review Edit</div>
				<div id="write-username">
					<div>${vo.userid }</div>
				</div>
				<div id="write-writedate-hit">
					<div id="form-writedate">${vo.writedate }</div>
				</div>
				<div id="write-roomno-rating">
					<div id="form-roomno">호수<input type="text" name="roomno" id="roomno" value="${vo.roomno }" readonly></div>
					<div id="form-rating">평점<input type="text" name="rating" id="rating" value="${vo.rating }"></div>
				</div>
				<div id="form-subject">
					<div id="form-subject-div">제목</div>
					<input type="text" name="subject" id="subject" value="${vo.subject }">
				</div>
				<textarea name="content" id="content">${vo.content }</textarea>
				<input type="submit" value="수정하기">
			</form>
		</div>
	</div>
</div><!-- container 끝 -->
</div>