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
	
}






