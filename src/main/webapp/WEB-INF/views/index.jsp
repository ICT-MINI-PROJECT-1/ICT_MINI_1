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
					<div id="main-hidden">
					</div>
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
							<div class="box-big-img" id="main-content-one-left">
							</div>
							<div id="main-content-one-right">
								<div>예술이 숨 쉬는 공간에서<br>
								누리는 최상의 휴식.<br><br>
								품격 있는 디자인과<br>
								세심한 서비스가 조화를 이루는<br>
								 이곳에서 편안함과 우아함을<br>
								 동시에 경험하세요.</div>
							</div>
						</div>
					</div>
					<div class="main-content-box" id="main-content-one-two">
						<div id="main-content-title">Rest & Comfort</div>
						<div id="main-content-box-right">
							<div id="main-content-one-left-two">
								<div class="box-img" id="two-box-1">
								</div>
								<div class="box-img" id="two-box-2">
								</div>
								<div class="box-img" id="two-box-3">
								</div>
								<div class="box-img" id="two-box-4">
								</div>
							</div>
							<div id="main-content-one-right">
								<div>
									최상의 편안함과 탁 트인 전망이<br>
									함께하는 웰니스, SPA & POOL<br><br> 
									감각적인 디자인이 돋보이는<br> 
									라운지까지 일상의 경계를 넘어선<br> 
									특별한 순간이 당신을 기다립니다.
								</div>
							</div>
						</div>
					</div>
					<div class="main-content-box" id="main-content-one-three">
						<div id="main-content-title">Rest & Comfort</div>
						<div id="main-content-box-right">
							<div id="main-content-one-left-three">
								<div class="box-img" id="three-box-1">
								</div>
								<div class="box-img" id="three-box-2">
								</div>
								<div class="box-img" id="three-box-3">
								</div>
							</div>
							<div id="main-content-one-right">
								<div>
								감각적인 분위기의 레스토랑에서<br> 
								세계적 셰프들이 선사하는<br>  
								미식의 향연을 만나보세요.
								</div>
							</div>
						</div>
					</div>
					<div class="main-content-box" id="main-content-two">
						<div id="main-content-title">Visual Amusement</div>
						<div id="main-content-box-right">
							<div id="main-content-two-left">
								<div class="box-img" id="two-one-box-1">
								</div>
								<div class="box-img" id="two-one-box-2">
								</div>
								<div class="box-img" id="two-one-box-3">
								</div>
							</div>
							<div id="main-content-one-right">
								<div>
								예술의 깊이를 더하는 공간,<br>
								영감이 흐르는 갤러리.<br><br>
								 세계적인 작가들의 파인아트를<br>
								  선보이며, 감각적인 전시와<br>
								  큐레이션을 통해<br>
								  특별한 감동을 선사합니다. 
								</div>
							</div>
						</div>
					</div>
					<div class="main-content-box" id="main-content-two-two">
						<div id="main-content-title">Visual Amusement</div>
						<div id="main-content-box-right">
							<div id="main-content-two-left-two">
								<div class="box-img" id="two-two-box-1">
								</div>
								<div class="box-img" id="two-two-box-2">
								</div>
							</div>
							<div id="main-content-one-right"><div>
							예술과 고급스러움의 만남으로<br>
							감각적인 휴식을 완성해 드립니다.<br><br>	
							품격 있는 공간 속 예술적 영감이<br>
							깃든 특별한 휴식을 경험하세요.
							</div></div>
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