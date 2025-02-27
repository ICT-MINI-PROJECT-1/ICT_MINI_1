
var dining_wrap;
var dining_title;
var dining_category;

var dining_moving=0;
var dining_state=0;

document.addEventListener('DOMContentLoaded', () => {
	dining_wrap=document.getElementsByClassName("dining-wrap")[0];
	
	dining_title=document.getElementsByClassName("dining-title")[0];
	
	dining_category = document.getElementById("dining-category");
});

/*window.addEventListener("wheel", (e) => {
	if(dining_title!=null && dining_wrap!=null && window.scrollY==0) {
		if (e.wheelDelta > 0 || e.detail < 0){
			if(dining_state==1&&dining_moving++==0) {
				dining_title.style.top = '100px';
				dining_wrap.style.position = 'static';
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
});*/

/*let previousScrollPosition = 0;
window.addEventListener("wheel", (e) => {
	if(dining_title!=null && dining_wrap!=null && window.scrollY==0) {
		if (e.wheelDelta > 0 || e.detail < 0){
			if(dining_state==1&&dining_moving++==0) {
				dining_title.style.top = '100px';
				dining_wrap.style.position = 'static';
				dining_wrap.style.opacity = 0;
				dining_category.style.visibility = 'hidden';
				setTimeout(function() {
				  	dining_moving=0;
				}, 1000);
				dining_state=0;
			}
		} else if(window.scrollY>previousScrollPosition) { //scroll down
			if(dining_state==0&&dining_moving++==0) {
				dining_title.style.top = '-1000px';
				dining_wrap.style.position = 'static';
				dining_wrap.style.visibility = 'visible';
				dining_wrap.style.opacity= 1;
				setTimeout(function() {
				  	dining_moving=0;
				}, 1000);
				dining_state=1;
			}
		} else {  //scroll up
			if(dining_state==1&&dining_moving++==0) {
				dining_title.style.top = '100px';
				dining_wrap.style.position = 'static';
				dining_wrap.style.visibility = 'hidden';
				dining_wrap.style.opacity= 0;
				setTimeout(function() {
				  	dining_moving=0;
				}, 1000);
				dining_state=0;
			}
		}
		previousScrollPosition = window.scrollY;
	}
});*/

window.addEventListener("wheel", (e) => {
	if(dining_title!=null && dining_wrap!=null && window.scrollY==0) {
		if (e.wheelDelta > 0 || e.detail < 0){
			if(dining_state==1&&dining_moving++==0) {
				dining_title.style.top = '100px';
				dining_wrap.style.position = 'static';
				dining_wrap.style.opacity= 0;
				document.getElementById("event").style.width="100%";	
				document.getElementById("event").style.height="100%";
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
				document.getElementById("event").style.width="0%";	
				document.getElementById("event").style.height="0%";
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

function moveToRestNav(foodType) {	
	
	let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '/page/dining/list');
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
let currentIndex;

let thisInfo = [
	"자연에서 직접 재배한 신선한 재료를 맘껏 즐길 수 있습니다.",
	"수제로 만든 양념, 장들의 조화를 느껴보세요.",
	"넓고 쾌적한 환경에서 편안한 시간을 보내세요.",
	"퀴노아로 속을 채운 샬롯, 완두콩, 간장소스를 곁들인 양갈비",
	"상큼한 소스에 마리네이드하여 숯불에 구운 미니양파, 구운 수제 떡갈비",
	"흑임자가루를 뿌린 다쿠아즈와 요거트 아이스크림",
	
	"공해없는 뒷마당에서 직접기른 수확물의 맛을 보세요.",
	"클래식과 컨템포러리의 조합을 눈과 입으로 즐길 수 있습니다.",
	"특별한 날을 위한 프라이빗한 공간을 제공해드립니다.",
	"비스크폼을 곁들인 랍스터테일",
	"무화과 컴포트와 덕주를 곁들인 오리가슴살",
	"딸기크럼블과 레몬소르베",
	
	"고객에게 나가기 전 바로 준비한 신선함을 자부합니다.",
	"다양하고 푸짐한 음식을 준비합니다.",
	"전통을 이어온 문화적 특색을 함께하세요.",
	"숙성 훈연하여 향을 입힌 미소시루",
	"특제 양념 간장을 발라주며 구워낸 갈치",
	"특급 기키자케시가 엄선하여 페어링해주는 사케"
];

let thisImg = [
	"/img/page/dining/content/kFood1.jpg",
	"/img/page/dining/content/kFood2.jpg",
	"/img/page/dining/content/kFood3.jpg",
	"/img/page/dining/content/kFood2-1.jpg",
	"/img/page/dining/content/kFood1-1.jpg",
	"/img/page/dining/content/kFood3-1.jpg",
	
	"/img/page/dining/content/wFood1.jpg",
	"/img/page/dining/content/wFood2.jpg",
	"/img/page/dining/content/wFood3.jpg",
	"/img/page/dining/content/wFood1-1.jpg",
	"/img/page/dining/content/wFood2-1.jpg",
	"/img/page/dining/content/wFood3-1.jpg",
	
	"/img/page/dining/content/jFood1.jpg",
	"/img/page/dining/content/jFood2.jpg",
	"/img/page/dining/content/jFood3.jpg",
	"/img/page/dining/content/jFood1-1.jpg",
	"/img/page/dining/content/jFood2-1.jpg",
	"/img/page/dining/content/jFood3-1.jpg"
];



//모달열기
function openModal(index) {
	let orgPosition = '10%';
	let modal = document.getElementById("d-modal");
	let position = window.innerWidth;
	currentIndex = index;
	
	/* DB에 있을때 필요하고 없으면 js로만 가능
	fetch('/page/dining/modalFetch', {
		method: 'GET',
		headers: {'Content-Type': 'application/json'}
  	})
	.then(response => {
		console.log('Response status:', response.status);
		if(!response.ok) {
			throw new Error('response was not ok');
		}
		return response.json();
	})
	.then(data => {
		
		document.getElementById('tInfo').innerText = thisInfo[index];
        document.getElementById('tImg').src = thisImg[index];
	})
	.catch(error => {
		console.log(error);
	});

	이미지 클릭시 이벤트 추가
	document.querySelectorAll('#menu-pic img, #menu-pic2 img').forEach((img, index) => {
    	img.addEventListener('click', function() {
        openModal(index);
	});*/
	
	function move() {
		if(position <= parseInt(orgPosition, 10)) {
			modal.style.left = orgPosition;
			
		} else {
			position -= 40;
			modal.style.left = position + 'px';
			requestAnimationFrame(move);
		}
	}
	
	modal.style.transition = 'left 0.35s';
	modal.style.display = 'block';
	modal.style.left = window.innerWidth + 'px';
	requestAnimationFrame(move);
	
	//모달 채우기
	document.getElementById("tInfo").textContent = thisInfo[index];
	document.getElementById("tImg").src = thisImg[index];
}

//모달 이동 버튼
/*function moveBack() {
	if(currentIndex > 0) {
		currentIndex--;
	}
	document.getElementById("tInfo").textContent = thisInfo[currentIndex];
	document.getElementById("tImg").src = thisImg[currentIndex];
}

function moveNext() {
	if(currentIndex < thisInfo.length - 1) {
		currentIndex++;
	}
	document.getElementById("tInfo").textContent = thisInfo[currentIndex];
	document.getElementById("tImg").src = thisImg[currentIndex];
	thisImg.classList.add("transition") = 'all 0.3s';
}*/

//모달이동버튼 조건추가
function moveBack() {
	if(currentIndex > 0 && (currentIndex % 6 !==0)) {
		currentIndex--;
	} else if(currentIndex == 0) {
		currentIndex = 5;
	} else if(currentIndex == 6) {
		currentIndex = 11;
	} else if(currentIndex == 12) {
		currentIndex = 17;
	} 
	document.getElementById("tInfo").textContent = thisInfo[currentIndex];
	document.getElementById("tImg").src = thisImg[currentIndex];
}

function moveNext() {
	if(currentIndex < thisInfo.length - 1 && (currentIndex+1) % 6 !== 0) {
		currentIndex++;
	} else if(currentIndex == 5) {
		currentIndex = 0;
	} else if(currentIndex == 11) {
		currentIndex = 6;
	} else if(currentIndex == 17) {
		currentIndex = 12;
	} 
	document.getElementById("tInfo").textContent = thisInfo[currentIndex];
	document.getElementById("tImg").src = thisImg[currentIndex];
}
	
//모달닫기
function closeModal() {
	
	let modal = document.getElementById("d-modal");
	let position = 0;
	
	function move() {
		if(position >= window.innerWidth) {
			modal.style.display = 'none';
			
		} else {
			position += 40;
			modal.style.left = position + 'px';
			requestAnimationFrame(move);
		}
	}
	modal.style.transition= 'all 0.1s';
	requestAnimationFrame(move);
}



