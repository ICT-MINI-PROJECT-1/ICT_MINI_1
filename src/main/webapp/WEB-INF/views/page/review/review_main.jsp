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
			<div class="review-search" action="${pageContext.request.contextPath }/page/review">
				<form>
					<select name="searchKey">
						<option value="total">전체</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="roomno">호수</option>
						<option value="contemp">Contemporary Art</option>
						<option value="artnou">Art Nouveau</option>
						<option value="artdec">Art Déco</option>
						<option value="asian">Asian</option>
					</select>
					<input type="text" name="searchWord">
					<input type="submit" value="검색">
				</form>
			</div>
		</div>
		<div class="review-list-grid-box">
			<c:forEach var="vo" items="${list}">
				<div class="review-list-grid-item">
					<div class="review-list-img" onclick="openModal('${vo.reviewno}','${vo.userid }','${loginId }')">이미지</div>
					<ul class="review-list-title">
						<li onclick="openModal('${vo.reviewno}','${vo.userid }','${loginId }')">${vo.subject }</li>
						<li>${vo.rating }</li>
					</ul>
				</div>
			</c:forEach>	 
		</div>
		<!-- 페이징 -->
		<ul id="paging">
			<!-- 이전페이지 -->
			<c:if test="${pVO.nowPage==1 }">
				<li><a href="#">◀</a></li>
			</c:if>
			<c:if test="${pVO.nowPage>1 }">
	    		<!-- Post방식으로 바꾸는 중
	    		<li><a href="javascript:reviewPrevPage(${pVO.nowPage-1})">Prev</a></li>
	    		 -->
	    		 
	    		<li>
	    			<a href="${pageContext.request.contextPath}/page/review?nowPage=${pVO.nowPage-1}<c:if test='${pVO.searchWord!=null }'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">◀</a>
    			</li>
 
	    	</c:if>
	    	<!-- 페이지번호 -->
	    	<c:forEach var="p" begin="${pVO.startPageNum }" end="${pVO.startPageNum+pVO.onePageCount-1 }">
	    		<c:if test="${p<=pVO.totalPage }">
		    		<c:if test="${p==pVO.nowPage }">
		    			<li>
		    		</c:if>
		    		<c:if test="${p!=pVO.nowPage }">
		    			<li>
		    		</c:if>
		    		<!-- href="javascript:void(0)-> 임시로 이렇게 적었다가 변경함 -->
		    		<a href="${pageContext.request.contextPath}/page/review?nowPage=${p}<c:if test='${pVO.searchWord!=null }'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">${p}</a></li>
	    		</c:if>
			</c:forEach>
	    	<!-- 다음페이지 -->
	    	<c:if test="${pVO.nowPage==pVO.totalPage }">
				<li><a href="#">▶</a></li>
			</c:if>
			<c:if test="${pVO.nowPage<pVO.totalPage }">
	    		<li><a href="${pageContext.request.contextPath}/page/review?nowPage=${pVO.nowPage+1}<c:if test='${pVO.searchWord!=null }'>&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">▶</a></li>
	    	</c:if>
		</ul>
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
						<li class="modal-img-mini">2</li>
						<li class="modal-img-mini">3</li>
						<li class="modal-img-mini">4</li>
						<li class="modal-img-mini">5</li>
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
				<div id="btn" style="display:none;">
					<input type="button" value="수정" onclick="reviewEdit()">
					<input type="button" value="삭제" onclick="reviewDelete()">
				</div>
			</div>
		</div>
	</div><!-- 모달팝업 끝 -->
</div><!-- container 끝 -->
</div>