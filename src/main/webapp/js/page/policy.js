document.addEventListener('DOMContentLoaded', () => {
	policy_wrap=document.getElementsByClassName("policy-wrap")[0];
	
	policy_title=document.getElementsByClassName("policy-title")[0];
});

var policy_wrap;
var policy_title;

var policy_moving=0;
var policy_state=0;

window.addEventListener("wheel", (e) => {
	if(policy_title!=null && policy_wrap!=null && window.scrollY==0) {
		if (e.wheelDelta > 0 || e.detail < 0){
			if(policy_state==1&&policy_moving++==0) {
				policy_title.style.top = '100px';
				policy_wrap.style.position = 'fixed';
				policy_wrap.style.opacity= 0;
				setTimeout(function() {
				  	policy_moving=0;
				}, 1000);
				policy_state=0;
			}
		} else { //scroll down
			if(policy_state==0&&policy_moving++==0) {
				policy_title.style.top = '-1000px';
				policy_wrap.style.position = 'static';
				policy_wrap.style.opacity= 1;
				setTimeout(function() {
				  	policy_moving=0;
				}, 1000);
				policy_state=1;
			}
		}
	}
});

where="policy";
