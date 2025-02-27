<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.request.contextPath }/css/page/review.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/review.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', () => {
		const search_form = document.getElementById("write-srch");
		if(search_form)
			search_form.addEventListener("submit", (event) => {
				  event.preventDefault();
				  postSearching();
			});
	});
</script>
<div id="fade">
<div class="container">
	<c:if test="${pVO == null}">
	<div class="review-title">
		<div id="span-back"></div>
		<span>REVIEW</span>
	</div>
	</c:if>
	<div id="review-edit-modal">
		<div id="review-edit-exit" onclick="reviewDelete(2)">X</div>
		<p>정말 글을 삭제하실건가요?</p>
		<button class="review-submit" id="review-edit-button" onclick="reviewDelete(1)">삭제하기</button>
	</div>
	<div class="review-wrap">
		<c:if test="${pVO != null}">
		<script>
			document.addEventListener('DOMContentLoaded', () => {
				review_wrap=document.getElementsByClassName("review-wrap")[0];
				review_wrap.style.position = 'static';
				review_wrap.style.opacity= 1;
			});
		</script>
		<div id="review-sort-search">
			<ul id="review-select-sort">
				<li id="sort">정렬</li>
				<c:if test="${pVO.searchHR=='hit'}">
					<li id="sort-hit" style="font-weight:bold;"><a href="#" onclick="postPaging('${pVO.nowPage}','${pVO.searchWord }','${pVO.searchKey }','hit','${pVO.searchConcept }')">조회순</a></li>
					<li id="sort-rating"><a href="#" onclick="postPaging('${pVO.nowPage}','${pVO.searchWord }','${pVO.searchKey }','rating','${pVO.searchConcept }')">평점순</a></li>
				</c:if>
				<c:if test="${pVO.searchHR=='rating'}">
					<li id="sort-hit"><a href="#" onclick="postPaging('${pVO.nowPage}','${pVO.searchWord }','${pVO.searchKey }','hit','${pVO.searchConcept }')">조회순</a></li>
					<li id="sort-rating" style="font-weight:bold;"><a href="#" onclick="postPaging('${pVO.nowPage}','${pVO.searchWord }','${pVO.searchKey }','rating','${pVO.searchConcept }')">평점순</a></li>
				</c:if>
				<c:if test="${pVO.searchHR==null || pVO.searchHR==''}">
					<li id="sort-hit"><a href="#" onclick="postPaging('${pVO.nowPage}','${pVO.searchWord }','${pVO.searchKey }','hit','${pVO.searchConcept }')">조회순</a></li>
					<li id="sort-rating"><a href="#" onclick="postPaging('${pVO.nowPage}','${pVO.searchWord }','${pVO.searchKey }','rating','${pVO.searchConcept }')">평점순</a></li>
				</c:if>
			</ul>
			<!-- 검색창 -->
			<div class="review-search">
				<form id="write-srch">
					<select id="searchConcept" name="searchConcept">
						<c:if test="${pVO.searchConcept == 0}">
							<option value="0" selected>전체 컨셉</option>
						</c:if>
						<c:if test="${pVO.searchConcept != 0}">
							<option value="0">전체 컨셉</option>
						</c:if>
						<c:if test="${pVO.searchConcept != 309}">
							<option value="309">Contemporary Art</option>
						</c:if>
						<c:if test="${pVO.searchConcept == 309}">
							<option value="309" selected>Contemporary Art</option>
						</c:if>
						<c:if test="${pVO.searchConcept == 409}">
							<option value="409" selected>Art Nouveau</option>
						</c:if>
						<c:if test="${pVO.searchConcept != 409}">
							<option value="409">Art Nouveau</option>
						</c:if>
						<c:if test="${pVO.searchConcept != 509}">
							<option value="509">Art Déco</option>
						</c:if>
						<c:if test="${pVO.searchConcept == 509}">
							<option value="509" selected>Art Déco</option>
						</c:if>
						<c:if test="${pVO.searchConcept == 609}">
							<option value="609" selected>Asian</option>
						</c:if>
						<c:if test="${pVO.searchConcept != 609}">
							<option value="609">Asian</option>
						</c:if>
					</select>
					<select id="searchKey" name="searchKey">
						<c:if test="${pVO.searchKey == 'total'}">
							<option value="total" selected>전체 검색</option>
						</c:if>
						<c:if test="${pVO.searchKey != 'total'}">
							<option value="total">전체 검색</option>
						</c:if>
						<c:if test="${pVO.searchKey != 'subject'}">
							<option value="subject">제목</option>
						</c:if>
						<c:if test="${pVO.searchKey == 'subject'}">
							<option value="subject" selected>제목</option>
						</c:if>
						<c:if test="${pVO.searchKey != 'content'}">
							<option value="content">내용</option>
						</c:if>
						<c:if test="${pVO.searchKey == 'content'}">
							<option value="content" selected>내용</option>
						</c:if>
						<c:if test="${pVO.searchKey != 'roomno'}">
							<option value="roomno">호수</option>
						</c:if>
						<c:if test="${pVO.searchKey == 'roomno'}">
							<option value="roomno" selected>호수</option>
						</c:if>
						<c:if test="${pVO.searchKey != 'userid'}">
							<option value="userid">작성자</option>
						</c:if>
						<c:if test="${pVO.searchKey == 'userid'}">
							<option value="userid" selected>작성자</option>
						</c:if>
					</select>
					<c:if test="${pVO.searchWord!=null}">
						<input type="text" id="searchWord" name="searchWord" value="${pVO.searchWord }">
					</c:if>
					<c:if test="${pVO.searchWord==null}">
						<input type="text" id="searchWord" name="searchWord" value="">
					</c:if>
					<input type="button" onclick="postSearching()" value="검색" id="review-search-btn">
				</form>
			</div>
		</div>
		<div class="review-list-grid-box">
			<c:if test="${fn:length(list) > 0 }">
			<c:forEach var="i" begin="0" end="${fn:length(list)-1}">
				<div class="review-list-grid-item">
					<c:if test="${fn:length(imgList.get(i)) > 0}">
						<div style="background:url('${pageContext.request.contextPath}/uploadfile/${list.get(i).reviewno }/${imgList.get(i).get(0).filename}'); background-size:cover;background-position:center;" class="review-list-img" onclick="openModal('${list.get(i).reviewno}','${list.get(i).userid }','${loginId }', '${list.get(i).roomno }')"></div>
					</c:if>
					<ul class="review-list-title">
						<li onclick="openModal('${list.get(i).reviewno}','${list.get(i).userid }','${loginId }', '${list.get(i).roomno }')">${list.get(i).subject }</li>
						<li><div class="review-star-box">
					<div class="review-star-fill" style="width:${list.get(i).rating*20}%"></div>
				</div></li>
					</ul>
				</div>
			</c:forEach>
			</c:if>
		</div>
		<c:if test="${fn:length(list)==0 }">
			<span id="review-search-result">검색 결과가 없습니다.</span>
		</c:if>
		<div id="review-write-search">
			<c:if test="${loginStatus=='Y' }">
				<a href="${pageContext.request.contextPath}/page/review/write" id="review-write">리뷰작성</a>
			</c:if>
		</div>
		<!-- 페이징 -->
		<ul id="paging">
			<!-- 이전페이지 -->
			<c:if test="${fn:length(list)!=0}">
				 <c:if test="${pVO.nowPage==1}">
					<li><a href="#"></a></li>
				</c:if>
			</c:if>
			<c:if test="${pVO.nowPage>1 }">
	    		<li>
	    			<a href="#" onclick="postPaging('${pVO.nowPage-1}','${pVO.searchWord }','${pVO.searchKey }','${pVO.searchHR }','${pVO.searchConcept }')">◀</a>
    			</li>
	    	</c:if>
	    	<!-- 페이지번호 -->
	    	<c:forEach var="p" begin="${pVO.startPageNum }" end="${pVO.startPageNum+pVO.onePageCount-1 }">
	    		<c:if test="${p<=pVO.totalPage }">
		    		<c:if test="${p==pVO.nowPage }">
		    			<li style="font-weight:bold;">
		    		</c:if>
		    		<c:if test="${p!=pVO.nowPage }">
		    			<li>
		    		</c:if>
		    		<a href="#" onclick="postPaging('${p}','${pVO.searchWord }','${pVO.searchKey }','${pVO.searchHR }','${pVO.searchConcept }')">${p}</a></li>
	    		</c:if>
			</c:forEach>
	    	<!-- 다음페이지 -->
	    	<c:if test="${pVO.nowPage==pVO.totalPage }">
				<li><a href="#"></a></li>
			</c:if>
			<c:if test="${pVO.nowPage<pVO.totalPage }">
	    		<li><a href="#" onclick="postPaging('${pVO.nowPage+1}','${pVO.searchWord }','${pVO.searchKey }','${pVO.searchHR }','${pVO.searchConcept }')">▶</a></li>
	    	</c:if>
		</ul>
	</div>
	<!-- 모달팝업 -->
	<div id="review-list-modal">
		<span id="modal-exit" onclick="closeModal()">X</span>
		<div id="modal-grid">
			<div id="modal-img">
				<div id="modal-img-main"></div>
				<div id="modal-img-list">
					<ul id="modals">
					</ul>
				</div>
			</div>	
			<div id="modal-contents">
				<p id="modal-subject"></p>
				<ul>
					<li>컨셉</li>
					<li id="modal-concept"></li>
					<li>조회수</li>
					<li id="modal-hit"></li>
				</ul>
				<ul>
					<li id="modal-rating-style">호수</li>
					<li id="modal-roomno"></li>
					<li id="modal-rating-style">평점</li>
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
					<input type="button" id="editBtn" value="수정" onclick="reviewEdit()">
					<input type="button" id="delBtn" value="삭제" onclick="reviewDelete(0)">
				</div>
			</div>
		</div>
		</c:if>
	</div><!-- 모달팝업 끝 -->
</div><!-- container 끝 -->
</div>