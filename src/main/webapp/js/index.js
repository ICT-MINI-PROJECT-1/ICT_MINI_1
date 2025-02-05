document.addEventListener('DOMContentLoaded', () => {
	//document.getElementsByClassName("footer")[0].style.display="none";
	main_title=document.getElementsByClassName("main-title")[0];
	main_image=document.getElementsByClassName("main-image")[0];
	main_content=document.getElementsByClassName("main-content")[0];
	main_content_one=document.getElementById("main-content-one");
	main_content_two=document.getElementById("main-content-two");
	main_content_three=document.getElementById("main-content-three");
});

var cur_state=0;

var main_title;
var main_image;
var main_content;
var main_content_one;
var main_content_two;
var main_content_three;



var moving=0;

window.addEventListener("wheel", (e) => {
	if(main_title!=null && main_image!=null && window.scrollY==0) {
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
				main_image.style.top = '100px';
				main_content.style.height='0px';
				main_content_one.style.left='-3000px';
				setTimeout(function() {
				  	moving=0;
				}, 1000);
				cur_state=1;
			}
		} else { //scroll down
			if(cur_state==0&&moving++==0) {
				main_title.style.top = '-400px';
				main_image.style.transition = 'all 0.7s';
				main_image.style.top = '100px';
				setTimeout(function() {
				  	moving=0;
				}, 1000);
				cur_state=1;
			}
			if(cur_state==1&&moving++==0) {
				main_image.style.top = '-2000px';
				main_image.style.transition = 'all 1.5s';
				main_content.style.height='2700px';
				main_content_one.style.left='50%';
				setTimeout(function() {
				  	moving=0;
				}, 1000);
				cur_state=2;
			}
		}
	}
});

let lastScrollY_main=0;

window.addEventListener("scroll", (e) => {
	let offset=650;
	let curScrollY = window.scrollY;
	let header = document.getElementsByClassName("header")[0];
	let nav = document.getElementsByClassName("nav")[0];
	if(cur_state == 2) {
		if(curScrollY<offset) {
			main_content_one.style.left='50%';
			main_content_three.style.left='-3000px';
			main_content_two.style.right='-3000px';
		}
		if(curScrollY < offset*2 && curScrollY >= offset) {
			main_content_one.style.left='-3000px';
			main_content_three.style.left='-3000px';
			main_content_two.style.right='50%';
			main_content_three.style.transition='all 1.5s';
		}
		if(curScrollY < offset*2 + 400 && curScrollY >= offset*2) {
			main_content_one.style.left='-3000px';
			main_content_three.style.left='50%';
			main_content_two.style.right='-3000px';
			main_content_three.style.position='fixed';
			main_content_three.style.top='50%';
		}
		if(curScrollY >= offset*2 + 400) {
			console.log(window.scrollY);
			main_content_three.style.position='absolute';
			main_content_three.style.transition='0.0s';
			main_content_three.style.top='2150px';
		}
	}
	lastScrollY_main = curScrollY;
});