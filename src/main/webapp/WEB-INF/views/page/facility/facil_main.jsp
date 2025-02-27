<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
#Sauna, #Pool, #PoolSize {
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 16px; 
    text-align: center;
    line-height: 5vh; 
    height: 100vh; 
    font-family: 'Gowun Batang';
    width: 80vw; 
    flex-shrink: 0;
    flex-grow: 0; 
    flex-basis: auto;
    min-width: 300px; 
    min-height: 400px; 
    border-bottom:1px solid gray;
}

#Bar, #Laundry {
    display: flex;
    align-items: center;
    font-size: 30px; 
    text-align: center;
    line-height: 5vh; 
    height: 100vh; 
    font-family: 'Gowun Batang';
    flex-shrink: 0;
    flex-grow: 0; 
    flex-basis: auto;
    min-width: 300px; 
    min-height: 400px; 
    border-bottom:1px solid gray;
}
#Laundry{
	border-bottom:none;
}

#Gym, #Restaurant {
	line-height: 10vh; 
    height: 130vh;
    align-items: center;
    justify-content: center;
    font-size: 16px;
    text-align: center;
    width: 80vw; 
    font-family: 'Gowun Batang';
    flex-shrink: 0;
    flex-grow: 0; 
    flex-basis: auto;
    min-width: 300px; 
    min-height: 400px; 
    border-bottom:1px solid gray;
}

#food{
	border-bottom:1px solid gray;
}
#line{
	height:5px;
}
#line2{
	height:100px;
}
#line3{
	height:100px;
}

#Sauna > img:hover, #Pool > img:hover, #Gym > img:hover, #Restaurant > img:hover, #Bar > img:hover, #Laundry > img:hover {
    transition: filter 0.3s ease;
    filter: blur(2px);
    cursor: pointer;
}

#Bar > img, #Laundry > img {
    margin-right: 200px;
    width: 50%;
    box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.2);
}



#Restaurant > img {
    width: 100%;
    box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.2);
}

#food > img {
    width: 100%;
    height: 100%;
}

#PoolSize > img, #Gym > img {
    width: 90%;
    box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.2);
}

#Sauna > img, #Pool > img {
    width: 22vw;
    margin-right: 50px; /* 이미지와 텍스트 사이의 간격 */
    box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.2);
}

.text {
    font-weight: bold;
    font-size: 32px;
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

#LaundryText, #BarText {
	font-family: 'Gowun Batang';
	font-size: 16px;
}

@media (max-width:1100px){
	#Gym > #gymText, #Restaurant > #RestaurantText {
		line-height:33px;
		font-size:16px;
	}
	#Gym, #Restaurant {
			height:600px;
		}
	#Laundry, #Bar, #PoolSize{
		height:400px;
	}
}
@media (max-width:900px){
	#PoolSize > img, #Gym > img, #food > img, #Restaurant > img {
		width:600px;
	}
}

@media (max-width:900px){
	#Sauna > #linkSauna, #Pool > img{
		width:200px;
	}
	#Sauna > #SaunaText {
		width:400px;
		line-height:22px;
		font-size:14px;
		flex-shrink: 0;
  		flex-grow: 0; 
	}
	#Pool > #PoolText {
		width:550px;
		line-height:22px;
		font-size:14px;
		flex-shrink: 0;
   		flex-grow: 0; 
	}
	#Gym > #gymText, #Restaurant > #RestaurantText {
		line-height:27px;
		font-size:14px;
	}
	@media (max-width:900px){
		#Gym, #Restaurant {
			height:500px;
		}
	}
}
@media (max-width:660px){
	#PoolSize > img, #Gym > img, #food > img, #Restaurant > img {
		width:450px;
		
	}
@media (max-width:580px){
	#PoolSize > img, #Gym > img, #food > img, #Restaurant > img {
		width:400px;
		
	}
}


@media (max-width:955px){
	#Bar, #Laundry {
		height:200px;
	}
	#Bar > img, #Laundry > img{
		width:250px;
	}
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

		<div id='Sauna'>
			<img src="../img/page/facility/main.jpg" id="linkSauna"/>
			<div id="SaunaText">
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
		

		<div id=Pool>
			<div id="PoolText">
			<strong Class="text">Pool</strong><br/>
			실내와 실외 수영장 모두 준비되어 있어 날씨와 관계없이 언제든지 즐길 수 있습니다.<br/>
			실내 수영장에서는 탁월한 온도 조절 시스템 덕분에 사계절 내내 편안한 수영이 가능하며,<br/>
			실외 수영장은 청명한 하늘과 푸른 자연을 배경으로 시원한 물속에 몸을 담그며 편안한 시간을 만끽할 수 있습니다.
			</div>
			<img src="../img/page/facility/PoolMain.jpg" id="linkPool"/>
		</div>
		
		<script>
		document.getElementById('linkPool').onclick = function(){
			window.location.href = "facility/facil-pool-picture";
		};
		</script>
		<div id="PoolSize">
			<img src="../img/page/facility/Pool.jpg"/>
		</div>
		
		<div id="line2"/>
		</div>

		<br/>
		<div id='Gym'>
			<img src='../img/page/facility/gym11.png' id="linkGym"/>
			<div id='gymText'>
			<strong Class="text">Gym</strong><br/>
			여행 중에도 건강한 라이프스타일을 유지하고 싶은 고객님을 위해 준비되었습니다.<br/>
			최첨단 운동 기구와 넉넉한 공간에서 다양한 운동을 즐길 수 있습니다. 근력 운동부터 유산소 운동까지 모든 피트니스 요구를 충족시켜 드리며,<br/>
			개인의 운동 스타일에 맞춘 다양한 트레이닝 옵션을 제공합니다. 또한, 전문 트레이너가 상주하여 운동에 대한 조언과 피드백을 제공하므로,<br/>
			처음 시작하는 분들도 부담 없이 운동을 즐길 수 있습니다.
			</div>
		</div>
		<script>
		document.getElementById('linkGym').onclick = function(){
			window.location.href = "facility/facil-gym-picture";
		};
		</script>
		<div id="line">
		</div>
		<div id="food">
			<img src="../img/page/facility/food.jpg">
		</div>
		
		<div id="Restaurant">
			<div id="line3">
			</div>
			<div id='RestaurantText'>
				<strong Class="text">Restaurant</strong><br/>
				우리 호텔의 식당은 맛과 분위기, 서비스가 어우러진 특별한 공간으로,<br/>
			    고객님에게 진정한 미식의 경험을 제공합니다. 고급스러운 인테리어와 아늑한 분위기 속에서,<br/>
			    다양한 메뉴와 정성스러운 요리로 고객님의 미각을 만족시킬 준비가 되어 있습니다.     <br/>	
			    <br/>
			</div>
			<img src="../img/page/facility/Restaurant.jpg"/ id="linkRestaurant">
		</div>
		<script>
		document.getElementById('linkRestaurant').onclick = function(){
			window.location.href = "facility/facil-restaurant-picture";
		};
		</script>
		<div id="Bar">
		    <img src="../img/page/facility/BarMain.jpg"/ id="linkBar">
		    <div id="BarText">
		        <strong Class="text">Lounge & Bar</strong><br/><br/>
		        도시의 번잡함 속에서도 한껏 여유를 즐길 수 있는 곳,<br/>
				이곳은 우아함과 편안함이 공존하는 럭셔리한 라운지바로<br/>
				일상 속의 피로를 씻어낼 수 있는 완벽한 장소입니다.<br/>
		    </div>
		</div>
		
		<script>
		document.getElementById('linkBar').onclick = function(){
			window.location.href = "facility/facil-bar-picture";
		};
		</script>

		<div id="Laundry">
			<img src="../img/page/facility/Laundry.jpg"/ id="linkLaundry">
			<div id="LaundryText">
				<strong Class="text">Laundry</strong><br/><br/>
				고객 여러분의 편안하고 위생적인 숙박 경험을 위해,<br/>
				저희는 최상의 세탁 서비스를 제공하고 있습니다.<br/>
				고품질 세제를 사용하여, 모든 의류를 정성스럽게 관리합니다.<br/>
			</div>
		</div>
		<script>
		document.getElementById('linkLaundry').onclick = function(){
			window.location.href = "facility/facil-laundry-picture";
		};
		</script>
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
