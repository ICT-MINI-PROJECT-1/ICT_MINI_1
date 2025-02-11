document.addEventListener('DOMContentLoaded', () => {
	reserv_wrap=document.getElementsByClassName("reserv-wrap")[0];
	
	reserv_title=document.getElementsByClassName("reserv-title")[0];
});

var reserv_wrap;
var reserv_title;

var reserv_moving=0;
var reserv_state=0;

window.addEventListener("wheel", (e) => {
	if(reserv_title!=null && reserv_wrap!=null && window.scrollY==0) {
		if (e.wheelDelta > 0 || e.detail < 0){
			if(reserv_state==1&&reserv_moving++==0) {
				reserv_title.style.top = '100px';
				reserv_wrap.style.position = 'fixed';
				reserv_wrap.style.opacity= 0;
				setTimeout(function() {
				  	reserv_moving=0;
				}, 1000);
				reserv_state=0;
			}
		} else { //scroll down
			if(reserv_state==0&&reserv_moving++==0) {
				reserv_title.style.top = '-1000px';
				reserv_wrap.style.position = 'static';
				reserv_wrap.style.opacity= 1;
				setTimeout(function() {
				  	reserv_moving=0;
				}, 1000);
				reserv_state=1;
			}
		}
	}
});