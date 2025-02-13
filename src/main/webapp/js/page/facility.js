document.addEventListener('DOMContentLoaded', () => {
	facility_wrap=document.getElementsByClassName("facility-wrap")[0];
	
	facility_title=document.getElementsByClassName("facility-title")[0];
});

var facility_wrap;
var facility_title;

var facility_moving=0;
var facility_state=0;

window.addEventListener("wheel", (e) => {
	if(facility_title!=null && facility_wrap!=null && window.scrollY==0) {
		if (e.wheelDelta > 0 || e.detail < 0){
			if(facility_state==1&&facility_moving++==0) {
				facility_title.style.top = '100px';
				facility_wrap.style.position = 'fixed';
				facility_wrap.style.opacity= 0;
				setTimeout(function() {
				  	facility_moving=0;
				}, 1000);
				facility_state=0;
			}
		} else { //scroll down
			if(facility_state==0&&facility_moving++==0) {
				facility_title.style.top = '-1000px';
				facility_wrap.style.position = 'static';
				facility_wrap.style.opacity= 1;
				setTimeout(function() {
				  	facility_moving=0;
				}, 1000);
				facility_state=1;
			}
		}
	}
});

where="facility";