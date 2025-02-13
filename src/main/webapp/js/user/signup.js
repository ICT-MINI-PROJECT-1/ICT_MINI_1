document.addEventListener('DOMContentLoaded', () => {
    window.setTimeout(() => {
    	userid = document.getElementById("userid");
    	userpw = document.getElementById("userpw");
    	userpw_chk = document.getElementById("userpw_chk");
    	username = document.getElementById("username");
    	email1 = document.getElementById("email1");
    	email2 = document.getElementById("email2");
    	
    	var alert_id = document.getElementById("alert-id");
    	var alert_pw = document.getElementById("alert-pw");
    	var alert_pwchk = document.getElementById("alert-pwchk");
    	var alert_name = document.getElementById("alert-name");
    	var alert_email = document.getElementById("alert-email");
    	
    	userid.addEventListener("input",()=>{
    		if(userid.value.length < 7) {
    			alert_id.innerHTML = "7자 이상 입력해주세요.";
    			alert_id.style.opacity = 1;
    			idOk=0;
    		}
    		if(userid.value.length>15) {
  				alert_id.innerHTML = "15자 이하 입력해주세요.";
    			alert_id.style.opacity = 1;
    			idOk=0;
  			}
  			else if(userid.value.length>6) {
  				alert_id.style.opacity = 0;
  				idOk=1;
  			}
    	});
    	
    	userid.onblur = function(e) {
    		if(idOk==1) {
	    		var params = {
					userid:userid.value,
				}
    			fetch("/user/idChk",{
					method:"POST",
					headers:{
						"Content-Type":"application/json",
					},
					body:JSON.stringify(params)
					}).then(response => response.json())
					.then(data=>{
						if(data==1) {
							idOk=0;
							alert_id.innerHTML = "이미 존재하는 아이디 입니다.";
    						alert_id.style.opacity = 1;
						}
					}).catch(err=> {
					console.log(err);
				});
    		}
    	}
    	var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{8,15}$/;
    	userpw.addEventListener("input",()=>{
    		if(!regex.test(userpw.value)) {
    			alert_pw.innerHTML = "8~15자의 영문,숫자,특수문자의 조합 입력";
    			alert_pw.style.opacity = 1;
    			pwOk=0;
    		} else {
    			alert_pw.style.opacity = 0;
    			pwOk=1;
    		}
    	});
    	userpw_chk.addEventListener("input",()=>{
    		if(userpw_chk.value != userpw.value) {
    			alert_pwchk.innerHTML = "비밀번호가 일치하지 않습니다.";
    			alert_pwchk.style.opacity = 1;
    			pw_chkOk=0;
    		} else {
    			alert_pwchk.style.opacity = 0;
    			pw_chkOk=1;
    		}
    	});
    	username.addEventListener("input",()=>{
    		if(username.value.length < 3) {
    			alert_name.innerHTML = "3자 이상 입력해주세요.";
    			alert_name.style.opacity = 1;
    			nameOk=0;
    		} else if(username.value.length>15){
    			alert_name.innerHTML = "15자 이하 입력해주세요.";
    			alert_name.style.opacity = 1;
    			nameOk=0;
    		} else {
    			alert_name.style.opacity = 0;
    			nameOk=1;
    		}
    	});
    	
    	var regex2 = /^[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
    	email2.addEventListener("input",()=>{
    		if(!regex2.test(email2.value)) {
    			alert_email.innerHTML = "올바르지 않은 도메인 주소입니다.";
    			alert_email.style.opacity = 1;
    			emailOk=0;
    		} else {
    			alert_email.style.opacity = 0;
    			emailOk=1;
    		}
    	});
    	email1.addEventListener("input",()=>{
    		if(email1.value.length<3) {
    			alert_email.innerHTML = "올바르지 않은 이메일입니다.";
    			alert_email.style.opacity = 1;
    			emailOk2=0;
    		} else {
    			alert_email.style.opacity = 0;
    			emailOk2=1;
    		}
    	});
    });
});

var idOk=0;
var pwOk=0;
var pw_chkOk=0;
var nameOk=0;
var emailOk=0;
var emailOk2=0;

var zipcodeOk=0;
var telOk=0;
var creditOk=0;

var userid;
var userpw;
var userpw_chk;
var username;
var email1;
var email2;

function signUpChk(){
	var zipcode = document.getElementById("zipcode");
	var alert_zipcode = document.getElementById("alert-zipcode");
	
	var tel1 = document.getElementById("tel1");
	var tel2 = document.getElementById("tel2");
	var tel3 = document.getElementById("tel3");
	var alert_tel = document.getElementById("alert-tel");
	
	var credit1 = document.getElementById("credit1");
	var credit2 = document.getElementById("credit2");
	var credit3 = document.getElementById("credit3");
	var credit4 = document.getElementById("credit4");
	var alert_credit = document.getElementById("alert-credit");
	
	
	if(zipcode.value == "") {
		alert_zipcode.innerHTML = "우편번호 찾기를 해주세요.";
		alert_zipcode.style.opacity = 1;
		zipcodeOk=0;
	} else {
		alert_zipcode.style.opacity = 0;
		zipcodeOk=1;
	}
	var regex_tel = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	if(!regex_tel.test(tel1.value+'-'+tel2.value+'-'+tel3.value)) {
		alert_tel.innerHTML = "올바른 전화번호를 입력해주세요.";
		alert_tel.style.opacity = 1;
		telOk=0;
	} else {
		alert_tel.style.opacity = 0;
		telOk=1;
	}
	var regex_credit = /^[0-9]{4}-?[0-9]{4}-?[0-9]{4}-?[0-9]{4}$/;
	if(!regex_credit.test(credit1.value+'-'+credit2.value+'-'+credit3.value+'-'+credit4.value)) {
		alert_credit.innerHTML = "올바른 카드번호를 입력해주세요.";
		alert_credit.style.opacity = 1;
		creditOk=0;
	} else {
		alert_credit.style.opacity = 0;
		creditOk=1;
	}
	var result = pwOk+pw_chkOk+nameOk+emailOk+zipcodeOk+idOk+telOk+creditOk+emailOk2;
	
	if(result==9) document.signupForm.submit();
}

where="signup";