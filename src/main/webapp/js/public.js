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

function moveNav(page, a) {
	let top = document.getElementsByClassName("header")[0].style.top;
	let curY = window.scrollY;
	console.log(document.getElementsByClassName("header")[0].style.top);
	if(a==0) window.scrollTo({top:0,left:0,behavior:'smooth'});
	if(top=='0px' || top=='') {
		if(a==0) {
			window.location.href="/page/"+page;
		}
		setTimeout(function() {
		  	window.location.href="/page/"+page;
		}, 600);
	}
	setTimeout(function() {
	  	moveNav(page,a+1);
	}, 10);
}