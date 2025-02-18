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
		<!-- 검색창 -->
		<div class="search-review">
			<select>
				<option>Contemporary Art</option>
				<option>Art Nouveau</option>
				<option>Art Déco</option>
				<option>Asian</option>
			</select>
			<input type="text" name="search-review-text"><input type="submit" value="검색">
		</div>
		<!-- 리뷰 나오는 곳 -->
		<div class="review-list-grid-box">
			<div class="review-list-grid-item">
				<div class="review-list-img" onclick="openModal()">이미지</div>
				<ul class="review-list-text">
					<li onclick="openModal()">제목제목제목제목</li>
					<li>추천수</li>
				</ul>
			</div>
			<div class="review-list-grid-item">
				<div class="review-list-img" onclick="openModal()">이미지</div>
				<ul class="review-list-text">
					<li onclick="openModal()">제목제목제목제목</li>
					<li>추천수</li>
				</ul>
			</div>
			<div class="review-list-grid-item">
				<div class="review-list-img" onclick="openModal()">이미지</div>
				<ul class="review-list-text">
					<li onclick="openModal()">제목제목제목제목</li>
					<li>추천수</li>
				</ul>
			</div>
			<div class="review-list-grid-item">
				<div class="review-list-img" onclick="openModal()">이미지</div>
				<ul class="review-list-text">
					<li onclick="openModal()">제목제목제목제목</li>
					<li>추천수</li>
				</ul>
			</div>
			<div class="review-list-grid-item">
				<div class="review-list-img" onclick="openModal()">이미지</div>
				<ul class="review-list-text">
					<li onclick="openModal()">제목제목제목제목</li>
					<li>추천수</li>
				</ul>
			</div>
			<div class="review-list-grid-item">
				<div class="review-list-img" onclick="openModal()">이미지</div>
				<ul class="review-list-text">
					<li onclick="openModal()">제목제목제목제목</li>
					<li>추천수</li>
				</ul>
			</div>
			<div class="review-list-grid-item">
				<div class="review-list-img" onclick="openModal()">이미지</div>
				<ul class="review-list-text">
					<li onclick="openModal()">제목제목제목제목</li>
					<li>추천수</li>
				</ul>
			</div>
			<div class="review-list-grid-item">
				<div class="review-list-img" onclick="openModal()">이미지</div>
				<ul class="review-list-text">
					<li onclick="openModal()">제목제목제목제목</li>
					<li>추천수</li>
				</ul>
			</div>
		</div>
	</div>
</div><!-- container 끝 -->
<!-- 모달팝업 -->
<div id="review-list-modal">
	<p id="modal-exit" onclick="closeModal()">X</p>
	<div id="modal-grid">
		<div id="modal-img">
			<div id="modal-img-main">사진</div>
			<div id="modal-img-list">
				<ul>
					<li class="modal-img-mini">1</li>
					<li class="modal-img-mini">1</li>
					<li class="modal-img-mini">1</li>
					<li class="modal-img-mini">1</li>
					<li class="modal-img-mini">1</li>
				</ul>
			</div>
		</div>	
		<div id="modal-contents">
			<p id="modal-subject">리뷰 제목</p>
			<ul>
				<li id="modal-roomno">호수</li>
				<li></li>
				<li id="modal-rating">평점</li>
				<li></li>
			</ul>
			<ul>
				<li id="modal-writedate">날짜</li>
				<li></li>
				<li id="modal-userid">글쓴이</li>
				<li></li>
			</ul>
				<div id="modal-content">리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 
				리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 
				리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용 리뷰내용
				리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용리뷰내용</div>
		</div>
	</div>
</div><!-- 모달팝업 끝 -->
</div>