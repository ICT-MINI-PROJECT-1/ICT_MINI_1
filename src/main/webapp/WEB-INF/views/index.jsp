<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<link href="${pageContext.request.contextPath }/css/index.css" rel="stylesheet" type="text/css"/>
	<script src="${pageContext.request.contextPath}/js/index.js"></script>
</head>
<body>
	<div id="fade">
		<div class="container">
			<div class="main-wrap">
				<div class="main-title">
					<ul>
						<li id="main-list-title">Art + Hotel</li>
						<li>
							<ul class="main-list-content-box">
								<li id="main-list-content">For Your Rest..</li>
								<li id="main-list-content">For Your Comfort..</li>
								<li id="main-list-content">For Your Visual Amusement..</li>
							</ul>
						</li>
						<li id="main-list-footer">
							Welcome To ArtPart
						</li>
					</ul>				
				</div>
				<div class="main-image"></div>
				<div class="main-content">
					<div class="main-hello">
						<img src="${pageContext.request.contextPath }/img/artpart_logo.png" width=150 height=150 style="margin-left:190px;"/>
						<div id="main-hello-text">
							<br>
							예술과 고급스러움이 어우러진, 당신만을 위한 특별한 공간.<br>
							우리는 단순한 호텔을 넘어,<br> 
							예술적 영감을 불러일으키는 공간을 제공합니다.<br>
							<br>
							최고의 디자인과 세심한 디테일로 꾸며진 객실,<br> 
							고유의 분위기를 자랑하는 갤러리와 같은 로비,<br>
							그리고 세련된 분위기 속에서 제공되는 미식 경험까지<br>
							모든 순간이 예술입니다.<br>
							<br>
							세상의 모든 예술을 담은 듯한 이곳에서<br> 
							고급스러움과 독창성을 동시에 만끽하십시오.<br>
						</div>
					</div>
					<div class="main-content-box" id="main-content-one">
						<div id="main-content-title">Rest & Comfort</div>
						<div id="main-content-box-right">
							<div id="main-content-one-left"></div>
							<div id="main-content-one-right"><br><br>&nbsp;&nbsp;지친 일상 숙소에서 휴식</div>
						</div>
					</div>
					<div class="main-content-box" id="main-content-one-two">
						<div id="main-content-title">Rest & Comfort</div>
						<div id="main-content-box-right">
							<div id="main-content-one-left-two"></div>
							<div id="main-content-one-right"><br><br>&nbsp;&nbsp;다양한 시설</div>
						</div>
					</div>
					<div class="main-content-box" id="main-content-one-three">
						<div id="main-content-title">Rest & Comfort</div>
						<div id="main-content-box-right">
							<div id="main-content-one-left-three"></div>
							<div id="main-content-one-right"><br><br>&nbsp;&nbsp;양질의 식사</div>
						</div>
					</div>
					<div class="main-content-box" id="main-content-two">
						<div id="main-content-title">Visual Amusement</div>
						<div id="main-content-box-right">
							<div id="main-content-two-left"></div>
							<div id="main-content-one-right"><br><br>&nbsp;&nbsp;호텔 내 미술관</div>
						</div>
					</div>
					<div class="main-content-box" id="main-content-two-two">
						<div id="main-content-title">Visual Amusement</div>
						<div id="main-content-box-right">
							<div id="main-content-two-left-two"></div>
							<div id="main-content-one-right"><br><br>&nbsp;&nbsp;미술 관련 객실</div>
						</div>
					</div>
					<div class="main-content-box" id="main-content-three">
						<div id="main-content-title">Destination</div>
						<div id="main-content-road">
							지도
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>