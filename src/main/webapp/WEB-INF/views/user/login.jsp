<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath}/js/user/login.js"></script>

<script>
	async function loginChk(){
		var userid = document.getElementById("userid").value;
		var userpw = document.getElementById("userpw").value;
		var alert_id = document.getElementById("alert-id");
		var alert_pw = document.getElementById("alert-pw");
		alert_id.style.opacity = 0;
		alert_pw.style.opacity = 0;
		
		if(userid=="") {
			alert_id.innerHTML = "Please enter your ID";
			alert_id.style.opacity = 1;
		}
		else if(userpw==""){
			alert_pw.innerHTML = "Please enter your Password";
			alert_pw.style.opacity = 1;
		}
		else{
			var params = {
				userid:userid,
				userpw:userpw
			}
			await fetch("/user/loginChk",{
				method:"POST",
				headers:{
					"Content-Type":"application/json",
				},
				body:JSON.stringify(params)
				}).then(response => response.json())
				.then(data=>{
					if(data=="0"){
						alert_id.innerHTML = "Invalid ID";
						alert_id.style.opacity = 1;
					} else if(data=="1"){
						alert_pw.innerHTML = "Invalid PW";
						alert_pw.style.opacity = 1;
					} else{
						document.loginForm.submit();
					}		
				}).catch(err=> {
				console.log(err);
		});
		}
	}
</script>

<div id="fade">
<div class="container">
	<div class="login-background"></div>
	<div class="login-container">
		<div id="login-title">Login</div>
		<form name="loginForm" method="post" action="loginOk">
			<div id="login-box">
				<div id="login-left"><div id="idpw">ID</div><div id="hidden-height">I</div></div> <div id="login-right"><input type="text" id="userid" name="userid"/><div id="alert-id">Invalid ID</div></div>
				<div id="login-left-two"><div id="idpw">PW</div><div id="hidden-height">I</div></div> <div id="login-right-two"><input type="password" id="userpw" name="userpw"/><div id="alert-pw">Invalid PW</div></div>
			</div>
			<input id="login-submit" type="button" onclick="loginChk()" value="Login"/>
		</form>
	</div>
</div>
</div>