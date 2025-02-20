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
	
	let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', 'dining/list');
	document.body.appendChild(f);
	
	let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'foodType');
    obj.setAttribute('value', foodType);
	f.appendChild(obj);
    f.submit();
}

//모달값 세팅
const foods = [
	"직접 재배한 신선한 야채와 장들을 맘껏 즐길 수 있습니다.",
	"",
	"넓고 쾌적한 환경에서 편안한 시간을 보내세요.",
	"퀴노아로 속을 채운 샬롯, 완두콩, 간장소스를 곁들인 양갈비",
	"상큼한 소스에 마리네이드하여 숯불에 구운 미니양파, 구운 수제 떡갈비",
	"흑임자가루를 뿌린 다쿠아즈와 요거트 아이스크림"
];

//Ajax
$(function(){
	$('a[data-target="#"]').click(function(){
		$.ajax({
			
		});
	})
}); 
	
	


//모달열기
let orgPosition = '10%';

function openModal() {
	let modal = document.getElementById("d-modal");
	let position = window.innerWidth;
	
	function move() {
		if(position <= parseInt(orgPosition, 10)) {
			modal.style.left = orgPosition;
			
		} else {
			position -= 20;
			modal.style.left = position + 'px';
			requestAnimationFrame(move);
		}
	}
	modal.style.transition = 'left 0.01s';
	modal.style.display = 'block';
	modal.style.left = window.innerwidth + 'px';
	requestAnimationFrame(move);
}

//모달닫기
function closeModal() {
	let modal = document.getElementById("d-modal");
	let position = 0;
	
	function move() {
		if(position >= window.innerWidth) {
			modal.style.display = 'none';
			
		} else {
		
			position += 20;
			modal.style.left = position + 'px';
			requestAnimationFrame(move);
		}
	}
	modal.style.transition= 'all 0.01s';
	requestAnimationFrame(move);
}



