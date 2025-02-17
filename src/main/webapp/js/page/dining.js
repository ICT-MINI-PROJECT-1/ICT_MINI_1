document.addEventListener('DOMContentLoaded', () => {
	dining_wrap=document.getElementsByClassName("dining-wrap")[0];
	
	dining_title=document.getElementsByClassName("dining-title")[0];
});

var dining_wrap;
var dining_title;

var dining_moving=0;
var dining_state=0;

window.addEventListener("wheel", (e) => {
	if(dining_title!=null && dining_wrap!=null && window.scrollY==0) {
		if (e.wheelDelta > 0 || e.detail < 0){
			if(dining_state==1&&dining_moving++==0) {
				dining_title.style.top = '100px';
				dining_wrap.style.position = 'fixed';
				dining_wrap.style.opacity= 0;
				setTimeout(function() {
				  	dining_moving=0;
				}, 1000);
				dining_state=0;
			}
		} else { //scroll down
			if(dining_state==0&&dining_moving++==0) {
				dining_title.style.top = '-1000px';
				dining_wrap.style.position = 'static';
				dining_wrap.style.opacity= 1;
				setTimeout(function() {
				  	dining_moving=0;
				}, 1000);
				dining_state=1;
			}
		}
	}
});

where="dining";

function moveToRest(foodType) {
	
	location.href="${pageContext.request.contextPath}/page/dining/dining_list";

	if(foodType=='korean') {
		document.getElementById("info-korean").value = "<div>직접 담근 장, 김치, 식초, 장아찌로 전국에 진귀한 식재료를 이용하여 이 시대에 맞는 한국요리를 선보이는 한식<div>"
		
		//var tag = "<div>직접 담근 장, 김치, 식초, 장아찌로 전국에 진귀한 식재료를 이용하여 이 시대에 맞는 한국요리를 선보이는 한식<div>"
		//document.getElementById("info-korean").value = tag;	
	} else if(foodType=='western') {
		document.getElementById("info-western").value = "<div>한국의 식재료를 재해석하여 선보이는 과감하고 창의적인 음식으로 압도적인 새로운 장르의 가치있는 경험을 선사시켜드리겠습니다.</div>"
		
		//var tag = "<div>한국의 식재료를 재해석하여 선보이는 과감하고 창의적인 음식으로 압도적인 새로운 장르의 가치있는 경험을 선사시켜드리겠습니다.</div>"
		//document.getElementById("info-western").value = tag;
	} else {
		document.getElementById("info-japanese").value = "<div>전통과 혁신을 겸비한 에도마에 스시가 있는 편안하고 고급스러운 공간</div>"
		
		//var tag = "<div>전통과 혁신을 겸비한 에도마에 스시가 있는 편안하고 고급스러운 공간</div>"
		//document.getElementById("info-japanese").value = tag;
	}
}






