<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath}/js/user/login.js"></script>
<link href="${pageContext.request.contextPath }/css/user/login.css" rel="stylesheet" type="text/css"/>

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