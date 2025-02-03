<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head></head>
<body>
<div id="test">안녕하세요? 여기다 작업할거에요zz</div>
<button onclick="test()">테스트</button>
<br>
<a href="${pageContext.request.contextPath}/user/login">로그인</a>
<br>
<a href="${pageContext.request.contextPath}/user/signup">회원가입</a>
</body>
</html>