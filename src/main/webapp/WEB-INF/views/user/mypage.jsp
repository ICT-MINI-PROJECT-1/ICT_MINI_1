<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/user/signup.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/user/signup.js"></script>

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
	<div class="signup-container">
		<div id="signup-title">My Page</div>
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