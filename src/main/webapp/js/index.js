document.addEventListener('DOMContentLoaded', () => {
	main_hello=document.getElementsByClassName("main-hello")[0];
	
	main_title=document.getElementsByClassName("main-title")[0];
	main_image=document.getElementsByClassName("main-image")[0];
	main_content=document.getElementsByClassName("main-content")[0];
	main_content_one=document.getElementById("main-content-one");
	main_content_one_two=document.getElementById("main-content-one-two");
	main_content_one_three=document.getElementById("main-content-one-three");
	
	main_content_two=document.getElementById("main-content-two");
	main_content_two_two=document.getElementById("main-content-two-two");
	
	main_content_three=document.getElementById("main-content-three");
	
	main_hidden = document.getElementById("main-hidden");
	
	addImgListener(main_hidden);
});

var arr;
var arr_top = [[63,67,30,22],[23,57,53],[24,59,47],[62,28]];
var arr_left = [[7,30,23,11],[10,30,3],[8,-5,13],[1,12]];

function moveItem(len,who){
	arr = new Array();
	for(var i=0;i<len;i++) {
		const element = document.getElementById(who+"-box-"+ (i+1));
		const box = document.getElementById("main-content-one-left-two");
		const style = getComputedStyle(element);
		const box_style = getComputedStyle(box);
		arr.push(style);
		element.style.top=(getNumberFromPixel(arr[i].top)/(getNumberFromPixel(box_style.height)*20/17))*100-3+(Math.random()*6)%6+"%";
		element.style.left=(getNumberFromPixel(arr[i].left)/(getNumberFromPixel(box_style.width)*100/60))*100-3+(Math.random()*6)%6+"%";
	}
}

function moveItemBack(who,len,idx) {
	for(var i=0;i<len;i++) {
		const element = document.getElementById(who+"-box-"+ (i+1));
		element.style.top=arr_top[idx][i]+"%";
		element.style.left=arr_left[idx][i]+"%";
	}
}

function addImgListener(imgs){
	imgs.addEventListener('mouseover', function(){
		if(cur_state == 2){
			moveItem(4,"two");
			moveItem(3,"three");
			moveItem(3,"two-one");
			moveItem(2,"two-two");
		}
	});
	imgs.addEventListener('mouseout', function(){
		if(cur_state == 2) {
			moveItemBack("two",4,0);
			moveItemBack("three",3,1);
			moveItemBack("two-one",3,2);
			moveItemBack("two-two",2,3);
		}
	});
}

var cur_state=0;
var where=0;

var main_hello;

var main_title;
var main_image;
var main_content;
var main_content_one;
var main_content_one_two;
var main_content_one_three;

var main_content_two;
var main_content_two_two;

var main_content_three;

var main_hidden;

window.addEventListener('resize', function(){
    if(main_content_three != null) main_content_three.style.transition='all 1.5s';
});

var moving=0;

window.addEventListener("wheel", (e) => {
	if(main_title!=null && main_image!=null && window.scrollY==0 && infoOn==0) {
		if (e.wheelDelta > 0 || e.detail < 0){
			if(cur_state==1&&moving++==0) {
				main_title.style.top = '100px';
				main_image.style.transition = 'all 1.1s';
				main_image.style.top = '300px';
				setTimeout(function() {
				  	moving=0;
				}, 1000);
				cur_state=0;
			}
			if(cur_state==2&&moving++==0) {
				main_image.style.transition = 'all 2.0s';
				main_image.style.top = '100px';
				main_hello.style.opacity=0;
				main_content.style.height='0px';
				setTimeout(function() {
				  	moving=0;
				}, 1000);
				cur_state=1;
			}
		} else { //scroll down
			if(cur_state==0&&moving++==0) {
				main_title.style.top = '-400px';
				main_image.style.transition = 'all 0.8s';
				main_image.style.top = '100px';
				setTimeout(function() {
				  	moving=0;
				}, 1000);
				cur_state=1;
			}
			if(cur_state==1&&moving++==0) {
				main_image.style.transition = 'all 3.0s';
				main_image.style.top = '-1600px';
				main_content.style.height='5000px';
				main_hello.style.opacity=1;
				setTimeout(function() {
				  	moving=0;
				}, 1000);
				cur_state=2;
			}
		}
	}
});

let lastScrollY_main=0;

function resetStatus(){
	main_content_one.style.opacity=0;
	main_content_one_two.style.opacity=0;
	main_content_one_three.style.opacity=0;
	main_content_two.style.opacity=0;
	main_content_two_two.style.opacity=0;
	main_content_three.style.opacity=0;
	main_hello.style.opacity=0;
}


window.addEventListener("scroll", (e) => {
	let offset=600;
	let curScrollY = window.scrollY;
	let header = document.getElementsByClassName("header")[0];
	let nav = document.getElementsByClassName("nav")[0];
	if(cur_state == 2) {
		if(curScrollY<offset) {
			resetStatus();
			main_hello.style.opacity=1;
			main_content_one.style.left='0px';
			main_content_one.style.transition='all 0.8s ease-in-out';
		}
		if(curScrollY < offset*2 && curScrollY >= offset) {	//최초 화면
			resetStatus();
			main_content_one.style.opacity=1;
			main_content_one.style.left='50%';
			main_content_one.style.transition='all 1.5s';
			where=1;
		}
		if(curScrollY < offset*3 && curScrollY >= offset*2) {
			resetStatus();
			main_content_one_two.style.opacity=1;
			where=2;
		}
		if(curScrollY < offset*4 && curScrollY >= offset*3) {
			resetStatus();
			main_content_one_three.style.opacity=1;
			main_content_two.style.right='0px';
			main_content_two.style.transition='all 0.8s ease-in-out';
			where=3;
		}
		if(curScrollY < offset*5 &&curScrollY >= offset*4) {
			resetStatus();
			main_content_two.style.opacity=1;
			main_content_two.style.right='50%';
			main_content_two.style.transition='all 1.5s';
			where=4;
		}
		if(curScrollY>=offset*5 && curScrollY<offset*6) {
			resetStatus();
			main_content_two_two.style.opacity=1;
			main_content_three.style.left='0px';
			main_content_three.style.transition='all 0.8s ease-in-out';
			where=5;
		}
		if(curScrollY>=offset*6) {
			resetStatus();
			main_content_three.style.opacity=1;
			main_content_three.style.left='50%';
			main_content_three.style.transition='all 1.5s';
			main_content_three.style.zIndex=10;
			where=6;
		}
	}
	lastScrollY_main = curScrollY;
});

where = "index";