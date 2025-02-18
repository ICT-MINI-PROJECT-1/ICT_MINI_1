document.addEventListener('DOMContentLoaded', () => {
	reserv_wrap=document.getElementsByClassName("reserv-wrap")[0];
	
	reserv_title=document.getElementsByClassName("reserv-title")[0];
	
	type = document.getElementById("reserv-typing");
	
	
	speed = 100;
	t=0;
	
	text = "예술적인 경험을 할 준비가 되셨나요?";
});

function wait(ms) {
	return new Promise(res=>setTimeout(res,ms));
}

const typing = async () => {
	const letter = text.split("");
	
	while(letter.length) {
		await wait(speed);
		type.innerHTML += letter.shift();
	}
	
	await wait(800);
}

var t;

var text;

var type;

let speed=100;

var reserv_wrap;
var reserv_title;

var reserv_moving=0;
var reserv_state=0;

window.addEventListener("wheel", (e) => {
	if(reserv_title!=null && reserv_wrap!=null && window.scrollY==0) {
		if (e.wheelDelta > 0 || e.detail < 0){
			if(reserv_state==1&&reserv_moving++==0) {
				type.innerHTML="";
				reserv_wrap.style.transition = 'none';
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
				reserv_wrap.style.transition = 'all 1.0s';
				reserv_title.style.top = '-1000px';
				reserv_wrap.style.position = 'static';
				reserv_wrap.style.opacity= 1;
				typing();
				setTimeout(function() {
				  	reserv_moving=0;
				}, 1000);
				reserv_state=1;
			}
		}
	}
});

where="reservation";

function moveReserv(loc) {
	if(loc=="") {
		location.href="/page/reservation/form";
	}

}