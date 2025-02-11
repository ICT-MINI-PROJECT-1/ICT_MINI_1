document.addEventListener('DOMContentLoaded', () => {
    window.setTimeout(() => {
        //document.body.classList.remove('fade');
        document.getElementById("fade").style.opacity=1;
        footer = document.getElementsByClassName("footer")[0];
        footer.style.opacity=0;
        settingMenu();
    });
});

var footer;

var where="";

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
			footer.style.opacity=1;
		}
	}
	else {
		if(curScrollY <= 80) {
			header.style.top='0px';
			nav.style.top='80px';
			nav.style.opacity=1;
			if(where!="login" && where!="signup")
				footer.style.opacity=0;
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


function getNumberFromPixel(_px) {
    if (_px == null || _px == "") {
        return 0;
    }
   
    _px = _px + "";
   
    if (_px.indexOf("px") > -1) {
        _px = _px.replace("px", "");
    }
   
    if (_px.indexOf("PX") > -1) {
        _px = _px.replace("PX", "");
    }
   
    var result = parseInt(_px, 10);
    if ((result + "") == "NaN") {
        return 0;
    }
   
    return result;
}

function settingMenu() {
    menu = new Menu("#myMenu");
    var item1 = new Item("list", "fas fa-bars", "");
    var item2 = new Item("home", "fas fa-sign-out-alt", "", "");
    var item3 = new Item("up", "fas fa-id-card", "", "");
    var item4 = new Item("my-info", "fas fa-exchange-alt", "", "");
    var item5 = new Item("info-contents", "fas fa-exchange-alt", "","");

    menu.add(item1);
    menu.add(item2);
    menu.add(item3);
    menu.add(item4);
    menu.add(item5);

    let menuList=document.getElementById("list");

    let homeButton=document.getElementById("home");
    var upButton=document.getElementById("up");
    var myInfoButton=document.getElementById("my-info");
    var contents=document.getElementById("info-contents");

    contents.innerHTML=
    `
    	<div>연락처/주소 등 적을 곳</div>
    `
    ;

    homeButton.addEventListener('click', () => {
        window.location.href = '/';
    });

    upButton.addEventListener('click', () => {
        window.scrollTo({top:0,left:0,behavior:'smooth'});
    });
    var clicked=false;

    menuList.addEventListener('mousedown', () => {
        if(clicked) {
            contents.style.opacity=0;
            clicked = !clicked;
        }
    });

    myInfoButton.addEventListener('click', () => {
        if(!clicked) {
            contents.style.left=getNumberFromPixel(myInfoButton.style.left)-470+'px';
            contents.style.top=getNumberFromPixel(myInfoButton.style.top)-220+'px';
            contents.style.opacity=1;
        }
        else {
            contents.style.opacity=0;
        }
        clicked = !clicked;
    });
}