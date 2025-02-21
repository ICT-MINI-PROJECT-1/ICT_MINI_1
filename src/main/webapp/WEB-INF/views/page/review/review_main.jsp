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
		<div id="review-write-search">
			<c:if test="${loginStatus=='Y' }">
				<a href="${pageContext.request.contextPath}/page/review/write" id="review-write">리뷰작성</a>
			</c:if>
			<!-- 검색창 -->
			<div class="review-search">
				<form>
					<select>
						<option value="contemp">Contemporary Art</option>
						<option value="artnou">Art Nouveau</option>
						<option value="artdec">Art Déco</option>
						<option value="asian">Asian</option>
					</select>
					<input type="text" name="search-review-text">
					<input type="submit" value="검색">
				</form>
			</div>
		</div>
		<div class="review-list-grid-box">
			<c:forEach var="vo" items="${list}">
				<div class="review-list-grid-item">
					<div class="review-list-img" onclick="openModal(${vo.reviewno})">이미지</div>
					<ul class="review-list-title">
						<li onclick="openModal(${vo.reviewno})">${vo.subject }</li>
						<li>${vo.rating }</li>
					</ul>
				</div>
			</c:forEach>	 
		</div>
	</div>
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
				<p id="modal-subject"></p>
				<ul>
					<li>호수</li>
					<li id="modal-roomno"></li>
					<li>평점</li>
					<li id="modal-rating"></li>
				</ul>
				<ul>
					<li>날짜</li>
					<li id="modal-writedate"></li>
					<li>글쓴이</li>
					<li id="modal-userid"></li>
				</ul>
				<div id="modal-content"></div>
				<div id="btn">
					<input type="button" value="수정" onclick="reviewEdit()">
					<input type="button" value="삭제">
				</div>
			</div>
		</div>
	</div><!-- 모달팝업 끝 -->
</div><!-- container 끝 -->
</div>