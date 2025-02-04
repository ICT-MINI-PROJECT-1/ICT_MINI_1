document.addEventListener('DOMContentLoaded', () => {
    window.setTimeout(() => {
        //document.body.classList.remove('fade');
        document.getElementById("fade").style.opacity=1;
    });
});

let lastScrollY=0;

window.addEventListener("scroll", (e) => {
	let curScrollY = window.scrollY;
	let header = document.getElementsByClassName("header")[0];
	let nav = document.getElementsByClassName("nav")[0];
	if(lastScrollY < curScrollY) {
		if(curScrollY >= 15) {
			header.style.top='-80px';
			//window.scrollTo({top:80,left:0,behavior:'smooth'});
			nav.style.top='-2px';
			nav.style.opacity=0.6;
		}
	}
	else {
		if(curScrollY <= 80) {
			header.style.top='0px';
			nav.style.top='80px';
			nav.style.opacity=1;
		}
	}
	
	lastScrollY = curScrollY;
});