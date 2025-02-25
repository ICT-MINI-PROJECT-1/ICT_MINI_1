<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="${pageContext.request.contextPath }/css/user/signup.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/user/signup.js"></script>
<script src="${pageContext.request.contextPath}/js/user/mypage.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
    	function daumPostCodeSearch(){
    		new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        //document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        //document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("zipcode").value = data.zonecode;
                    document.getElementById("addr").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("addrdetail").focus();
                }
            }).open();
  		} 	
</script>

<div id="fade">
<div class="container">
	<div class="mypage-wrap">
		<div class="mypage-container-reserv">
			<div id="signup-title">WishList</div>
			<ul class="wish_list" id="mr-title">
				<li>
					방 번호
				</li>
				<li>
					컨셉
				</li>
				<li>
					체크인
				</li>
				<li>
					체크아웃
				</li>
				<li>
					가격
				</li>
				<li>
					평점
				</li>
			</ul>
			<c:forEach var="data" items="${rvo}">
			<ul class="wish_list">
				<li>
					<c:if test="${data.roomconcept=='contemp'}">
						<a href="#" onclick="moveToRoom('contemp')">${data.roomno}</a>
					</li>
					<li>
						모던현대
					</c:if>
					<c:if test="${data.roomconcept=='artnou'}">
						<a href="#" onclick="moveToRoom('artnou')">${data.roomno}</a>
					</li>
					<li>
						아르누보
					</c:if>
					<c:if test="${data.roomconcept=='artdec'}">
						<a href="#" onclick="moveToRoom('artdec')">${data.roomno}</a>
					</li>
					<li>
						아르데코
					</c:if>
					<c:if test="${data.roomconcept=='asian'}">
						<a href="#" onclick="moveToRoom('asain')">${data.roomno}</a>
					</li>
					<li>
						동양
					</c:if>
				</li>
				<li>
					${data.checkin }
				</li>
				<li>
					${data.checkout }
				</li>
				<li>
					${data.price }
				</li>
				<li>
				<fmt:formatNumber value="${data.rating }" pattern="0.0"/>
				</li>
			</ul>
			</c:forEach>
			
			
			<div id="signup-title">Reservation</div>
			<ul class="reserv-ul" id="mr-title">
				<li>
					예약 번호
				</li>
				<li>
					방 번호
				</li>
				<li>
					인원수
				</li>
				<li>
					예약일자
				</li>
				<li>
					요청사항
				</li>
			</ul>
			<div class="reserv-lm"><b>현재 예약</b></div>
			<c:if test="${reserv !=null}">
			<ul class="reserv-ul">
				<li>
					<a href="#" onclick="moveReserv('')">${reserv.reservno }</a>
				</li>
				<li>
					${reserv.roomno }
				</li>
				<li>
					${reserv.usercnt }
				</li>
				<li>
					${reserv.reservdate.substring(0,10) } ~ ${reserv.reservenddate.substring(0,10) }
				</li>
				<li>
					${reserv.request }
				</li>
			</ul>
			</c:if>
			<c:if test="${reserv==null }">
				<div class="no-reserv">예약 내역이 없습니다.</div>
			</c:if>
			<br>
			<div class="reserv-lm"><b>지난 예약 목록</b></div>
			<c:if test="${reserv_list !=null}">
			<c:forEach var="data" items="${reserv_list}">
			<ul class="reserv-ul">
				<li>
					${data.reservno }
				</li>
				<li>
					${data.roomno }
				</li>
				<li>
					${data.usercnt }
				</li>
				<li>
					${data.reservdate.substring(0,10) } ~ ${data.reservenddate.substring(0,10) }
				</li>
				<li>
					${data.request }
				</li>
			</ul>
			</c:forEach>
			</c:if>
			<c:if test="${reserv_list==null }">
				<div class="no-reserv">예약 내역이 없습니다.</div>
			</c:if>
			
			<div class="mypage-container-review">
			<div id="signup-title">Review</div>
			<ul class="review-ul" id="mr-title">
				<li>리뷰 번호</li>
				<li>방 번호</li>				
				<li>제목</li>
				<li>작성일</li>
                <li>평점</li>
			</ul>
			<div class="review-lm"><b>나의 리뷰</b></div>
			<c:if test="${review !=null}">
				<c:forEach var="review" items="${reviewList}">
				<ul class="review-ul">
					<li><a href="#" onclick="moveReview('')">${review.reviewno}</a></li>
					<li>${review.roomno}</li>
					<li>${review.subject}</li>
					<li>${review.writedate}</li>
					<li>${review.rating}/></li>
				</ul>
				</c:forEach>
			</c:if>
			<c:if test="${review==null}">
				<div class="no-review">리뷰 내역이 없습니다.</div>
			</c:if>
		
		<div class="mypage-container-info">
			<div id="signup-title">My Info</div>
			<form name="signupEditForm" method="post" action="signUpEditChk">
				<div id="signup-box">
					<div id="signup-left"><div id="idpw">ID</div><div id="hidden-height">I</div></div> <div id="signup-right"><input type="text" id="userid" name="userid" value="${vo.userid}" readonly/><div id="alert-id">Invalid ID</div></div>
					<div id="signup-left"><div id="idpw">PW</div><div id="hidden-height">I</div></div> <div id="signup-right"><input type="password" id="userpw" name="userpw"/><div id="alert-pw">Invalid PW</div></div>
					<div id="signup-left"><div id="idpw">NAME</div><div id="hidden-height">I</div></div> <div id="signup-right"><input type="text" id="username" name="username" value="${vo.username}" readonly/><div id="alert-name">Invalid NAME</div></div>
					<div id="signup-left"><div id="idpw">EMAIL</div><div id="hidden-height">I</div></div> <div id="signup-right"><input style="width:26%;" type="text" id="email1" name="email1" value="${vo.email1}" readonly/> @ <input style="width:26%;" type="text" id="email2" name="email2" value="${vo.email2}" readonly/><div id="alert-email">Invalid EMAIL</div></div>
					<div id="signup-left"><div id="idpw">TEL</div><div id="hidden-height">I</div></div> <div id="signup-right"><input style="width:13%;" type="text" id="tel1" name="tel1" maxlength=3 value="${vo.tel1}" readonly/> - <input style="width:13%;" type="text" id="tel2" name="tel2" maxlength=4 value="${vo.tel2}" readonly/>
					- <input style="width:13%;" type="text" id="tel3" name="tel3" maxlength=4 value="${vo.tel3}" readonly/><div id="alert-tel">Invalid TEL</div></div>
					<div id="signup-left"><div id="idpw">ZIPCODE</div><div id="hidden-height">I</div></div> <div id="signup-right"><input style="width:30%;" type="text" id="zipcode" name="zipcode" value="${vo.zipcode}" readonly/><button class="buttons" style="width:20%;" type="button" onclick="daumPostCodeSearch()">Find</button><div id="alert-zipcode">Invalid ZIPCODE</div></div>
					<div id="signup-left"><div id="idpw">ADDRESS</div><div id="hidden-height">I</div></div> <div id="signup-right"><input type="text" id="addr" name="addr" value="${vo.addr}" readonly/><div id="alert-addr">Invalid ADDRESS</div></div>
					<div id="signup-left"><div id="idpw">DETAIL</div><div id="hidden-height">I</div></div> <div id="signup-right"><input type="text" id="addrdetail" name="addrdetail"  value="${vo.addrdetail}"/><div id="alert-addrdetail">Invalid DETAIL</div></div>
					<div id="signup-left"><div id="idpw">CREDIT</div><div id="hidden-height">I</div></div> <div id="signup-right"><input style="width:12%; padding-left:5px;" type="text" id="credit1" name="credit1" value="${vo.credit1}" maxlength=4/> - <input style="width:12%; padding-left:5px;" type="text" id="credit2" name="credit2" value="${vo.credit2}" maxlength=4/>
					- <input style="width:12%; padding-left:5px;" type="text" id="credit3" name="credit3" value="${vo.credit3}" maxlength=4/> - <input style="width:12%; padding-left:5px;" type="text" id="credit4" name="credit4" value="${vo.credit4}" maxlength=4/><div id="alert-credit">Invalid CREDIT</div></div>
				</div>
				<input class="signup-submit" type="button" onclick="signUpEditChk()" value="Edit"/>
			</form>
		</div>
	</div>
</div>
</div>