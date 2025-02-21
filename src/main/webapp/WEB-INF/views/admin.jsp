<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<script src="${pageContext.request.contextPath}/js/admin.js"></script>
	<link href="${pageContext.request.contextPath }/css/admin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<h1>Admin Page</h1>
	<a id="logout-title" href="${pageContext.request.contextPath}/user/logout">Logout</a>
	<div class="admin-container">
		<div class="admin-list">
			<ul>
				<li>
					<a onclick="adminUserList()" href="#">회원 조회</a>
				</li>
				<li>
					<a href="#">예약 조회</a>
				</li>
			</ul>
		</div>
		<div class="admin-contents"></div>
	</div>
</body>
</html>