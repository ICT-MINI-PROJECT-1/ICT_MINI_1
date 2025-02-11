<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/user/signup.css" rel="stylesheet" type="text/css"/>

<div id="fade">
<div class="container">
	<div class="signup-container">
		<div id="signup-title">Sign Up</div>
		<form name="signupForm" method="post" action="signUpChk">
			<div id="signup-box">
				<div id="signup-left"><div id="idpw">ID</div><div id="hidden-height">I</div></div> <div id="signup-right"><input type="text" id="userid" name="userid"/><div id="alert-id">Invalid ID</div></div>
				<div id="signup-left"><div id="idpw">PW</div><div id="hidden-height">I</div></div> <div id="signup-right"><input type="password" id="userpw" name="userpw"/><div id="alert-pw">Invalid PW</div></div>
				<div id="signup-left"><div id="idpw">NAME</div><div id="hidden-height">I</div></div> <div id="signup-right"><input type="text" id="username" name="username"/><div id="alert-name">Invalid NAME</div></div>
			</div>
			<input id="signup-submit" type="submit" value="SignUp"/>
		</form>
	</div>
</div>
</div>