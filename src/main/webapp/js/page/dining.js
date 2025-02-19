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

/*function 

	var infoKorean = document.getElementById("korean-page");
	var infoWestern = document.getElementById("info-western");
	var infoJapanese = document.getElementById("info-japanese");

	if(foodType=="korean") {
		infoKorean.style.display = "block";
		infoWestern.style.display = "none";
		infoJapanese.style.display = "none";
	} else if(foodType=="western") {
		infoKorean.style.display = "none";
		infoWestern.style.display = "block";
		infoJapanese.style.display = "none";
	} else if(foodType=="japanese") {
		infoKorean.style.display = "none";
		infoWestern.style.display = "none";
		infoJapanese.style.display = "block";
	}
}*/

/* 사진 확대(모달) */
/*const modal = document.querySelector(".modal");
const modalOpen = document.querySelector(".pic-modal");
const modalClose = document.querySelector(".close-modal");

modalOpen.addEventListener('click', function(){
	modal.style.display('block');
});

modalClose.addEventListener('click', function(){
	modal.style.display('none');
});*/






