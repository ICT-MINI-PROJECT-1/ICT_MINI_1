<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.request.contextPath }/css/page/review.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/review.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', () => {
		const search_form = document.getElementById("write-srch");
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
					<li style="font-weight:bold;"><a href="#" onclick="postPaging('${pVO.nowPage}','${pVO.searchWord }','${pVO.searchKey }','hit','${pVO.searchConcept }')">조회순</a></li>
					<li><a href="#" onclick="postPaging('${pVO.nowPage}','${pVO.searchWord }','${pVO.searchKey }','rating','${pVO.searchConcept }')">평점순</a></li>
				</c:if>
				<c:if test="${pVO.searchHR=='rating'}">
					<li><a href="#" onclick="postPaging('${pVO.nowPage}','${pVO.searchWord }','${pVO.searchKey }','hit','${pVO.searchConcept }')">조회순</a></li>
					<li style="font-weight:bold;"><a href="#" onclick="postPaging('${pVO.nowPage}','${pVO.searchWord }','${pVO.searchKey }','rating','${pVO.searchConcept }')">평점순</a></li>
				</c:if>
				<c:if test="${pVO.searchHR==null || pVO.searchHR==''}">
					<li><a href="#" onclick="postPaging('${pVO.nowPage}','${pVO.searchWord }','${pVO.searchKey }','hit','${pVO.searchConcept }')">조회순</a></li>
					<li><a href="#" onclick="postPaging('${pVO.nowPage}','${pVO.searchWord }','${pVO.searchKey }','rating','${pVO.searchConcept }')">평점순</a></li>
				</c:if>
			</ul>
			<!-- 검색창 -->
			<div class="review-search">
				<form id="write-srch">
					<select id="searchConcept" name="searchConcept">
						<option value="0">전체 컨셉</option>
						<option value="309">Contemporary Art</option>
						<option value="409">Art Nouveau</option>
						<option value="509">Art Déco</option>
						<option value="609">Asian</option>
					</select>
					<select id="searchKey" name="searchKey">
						<option value="total">전체 검색</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="roomno">호수</option>
					</select>
					<input type="text" id="searchWord" name="searchWord">
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
						<li>${list.get(i).rating }</li>
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
		<p id="modal-exit" onclick="closeModal()">X</p>
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
					<input type="button" value="삭제" onclick="reviewDelete()">
				</div>
			</div>
		</div>
		</c:if>
	</div><!-- 모달팝업 끝 -->
</div><!-- container 끝 -->
</div>