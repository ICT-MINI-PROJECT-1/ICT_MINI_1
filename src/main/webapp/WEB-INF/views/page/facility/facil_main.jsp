<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	#Sauna,#Pool,#PoolSize{
		display: flex;
		align-items: center; /* 이미지와 텍스트 수직 정렬 */
		justify-content: center; /* 수평 가운데 정렬 */
		font-size: 16px;
		text-align: center;
		line-height:70px;
		height:900px;
		font-family: 'Gowun Batang';
	}
	#Bar, #Laundry{
		display: flex;
		align-items: center;
		font-size: 30px;
		text-align: center;
		line-height:70px;
		height:700px;
		font-family: 'Gowun Batang';
	}
	
	#Gym, #Restaurant{
		align-items: center;
		justify-content: center;
		font-size: 16px;
		text-align: center;
		line-height:70px;
		height:1050px;
		font-family: 'Gowun Batang';
	}
	
	#Sauna > img:hover, #Pool > img:hover, #Gym > img:hover, #Restaurant > img:hover, #Bar > img:hover, #Laundry > img:hover{
		
		transition: filter 0.3s ease;
        filter:blur(2px);
	}

	#Bar > img, #Laundry > img {
		margin-right: 200px;
		width:50%;
		box-shadow:10px 10px 15px  rgba(0, 0, 0, 0.2); 
	}
	
	#Restaurant > img {
		width:100%;
		box-shadow:10px 10px 15px  rgba(0, 0, 0, 0.2); 
	}
	
	
	#food > img{
		width:100%;
		height:100%;
	}
	
	#PoolSize > img, #Gym > img {
		width:90%;
		box-shadow:10px 10px 15px  rgba(0, 0, 0, 0.2); 
	}

	#Sauna > img, #Pool > img{
		width: 600px;
		margin-right: 50px; /* 이미지와 텍스트 사이의 간격 */
		box-shadow:10px 10px 15px  rgba(0, 0, 0, 0.2); 
	}
	.text{
	font-weight:bold;
	font-size:32px;
	font-family: "Cormorant Garamond", serif;
	}
	
	.linkBox {
		position: fixed;
		right: 3%;
		top: 37%;
		width: 100px;
		height: 185px;
	}

	.linkBox > ul > li {
		top: 20%;
		font-size: 16px;
		line-height: 30px;
		text-align: center;
		color: Black;
		font-family: "Cormorant Garamond", serif;
	}

	.linkBox > ul > li:hover {
		width: 100%;
        transition: transform 0.3s ease;
        transform: scale(1.1);
	}
</style>

<link href="${pageContext.request.contextPath }/css/page/facility.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/facility.js"></script>

<div id="fade">
<div class="container">
	<div class="facility-title">
		<div id="span-back"></div>
		<span>FACILITY</span>
	</div>
	<div class="facility-wrap">
		<div class="linkBox">
			<ul>
				<li>Sauna</li>
				<li>Pool</li>
				<li>Gym</li>
				<li>Restaurant</li>
				<li>Bar</li>
				<li>Laundry</li>
			</ul>
		</div>
		<hr/>
		<hr/>
		<div id='Sauna'>
			<img src="../img/page/facility/main.jpg" id="linkSauna"/>
			<div>
				<strong Class="text">Spa & Sauna</strong><br/>
				<br/>
				마음과 몸을 재충전하는 특별한 경험을 제공하는 고급스러운 시설과 세심한 서비스로 고객님께 최상의 휴식을 선사합니다.<br/>
				넉넉한 공간과 최첨단 시설에서 편안하게 몸을 녹이며, 사우나의 온기 속에서 하루의 피로를 말끔히 씻어내세요.<br/>
				세련된 디자인과 조용한 분위기가 어우러져, 긴장을 풀고 자연과 하나 되는 듯한 평화로운 시간을 보낼 수 있습니다.
			</div>
		</div>
		<script>
		document.getElementById('linkSauna').onclick = function(){
			window.location.href = "facility/facil-sauna-picture";
		};
		</script>
		
		<hr/>
		<hr/>
		<div id=Pool>
			<div>
			<strong Class="text">Pool</strong><br/>
			실내와 실외 수영장 모두 준비되어 있어 날씨와 관계없이 언제든지 즐길 수 있습니다.<br/>
			실내 수영장에서는 탁월한 온도 조절 시스템 덕분에 사계절 내내 편안한 수영이 가능하며,<br/>
			실외 수영장은 청명한 하늘과 푸른 자연을 배경으로 시원한 물속에 몸을 담그며 편안한 시간을 만끽할 수 있습니다.
			</div>
			<img src="../img/page/facility/PoolMain.jpg"/>
		</div>
		<hr/>
		<br/>
		<div id="PoolSize">
			<img src="../img/page/facility/Pool.jpg"/>
		</div>
		<br/>
		<hr/>
		<br/>
		<div id='Gym'>
			<img src='../img/page/facility/Gym.jpg'/>
			<div>
			<strong Class="text">Gym</strong><br/>
			여행 중에도 건강한 라이프스타일을 유지하고 싶은 고객님을 위해 준비되었습니다.<br/>
			최첨단 운동 기구와 넉넉한 공간에서 다양한 운동을 즐길 수 있습니다. 근력 운동부터 유산소 운동까지 모든 피트니스 요구를 충족시켜 드리며,<br/>
			개인의 운동 스타일에 맞춘 다양한 트레이닝 옵션을 제공합니다. 또한, 전문 트레이너가 상주하여 운동에 대한 조언과 피드백을 제공하므로,<br/>
			처음 시작하는 분들도 부담 없이 운동을 즐길 수 있습니다.
			</div>
		</div>
		<br/>
		<hr/>
		<div id="food">
			<img src="../img/page/facility/food.jpg">
		</div>
		<hr/>
		<div id="Restaurant">
			<div>
				<strong Class="text">Restaurant</strong><br/>
				우리 호텔의 식당은 맛과 분위기, 서비스가 어우러진 특별한 공간으로,<br/>
			    고객님에게 진정한 미식의 경험을 제공합니다. 고급스러운 인테리어와 아늑한 분위기 속에서,<br/>
			    다양한 메뉴와 정성스러운 요리로 고객님의 미각을 만족시킬 준비가 되어 있습니다.     <br/>	
			</div>
			<img src="../img/page/facility/Restaurant.jpg"/>
			<hr/>
		<hr/>
		</div>
		<div id="Bar">
		    <img src="../img/page/facility/BarMain.jpg"/>
		    <div>
		        <strong Class="text">Lounge & Bar</strong>
		    </div>
		</div>
		<hr/>
		<hr/>
		<div id="Laundry">
			<img src="../img/page/facility/Laundry.jpg"/>
			<div>
				<strong Class="text">Laundry</strong>
			</div>
		</div>
	</div>
</div>
</div>
<script>
document.querySelectorAll('.linkBox ul li').forEach(function(item) {
    item.addEventListener('click', function() {
        
        const target = this.textContent.trim(); 
        const targetElement = document.getElementById(target); // 해당 텍스트에 맞는 ID를 가진 요소 찾기
        
        if (targetElement) {
            targetElement.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});
</script>
