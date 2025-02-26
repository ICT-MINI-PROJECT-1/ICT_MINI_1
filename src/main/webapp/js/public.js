document.addEventListener('DOMContentLoaded', () => {
    window.setTimeout(() => {
        //document.body.classList.remove('fade');
        document.getElementById("fade").style.opacity=1;
        footer = document.getElementsByClassName("footer")[0];
        if(where=="review") footer.style.opacity=1;
        else if(where=="dining") footer.style.display='none';
        else footer.style.opacity=0;
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
			nav.style.top='-2px';
			nav.style.opacity=0.6;
			if(footer != null)
				footer.style.opacity=1;
		}
	}
	else {
		if(curScrollY <= 80) {
			header.style.top='0px';
			nav.style.top='80px';
			nav.style.opacity=1;
			if(where!="login" && where!="signup" && where!="review")
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


function mainMove(ofs){
	if(cur_state!=2) {
		main_title.style.top = '-400px';
		main_image.style.transition = 'all 0.8s';
		main_image.style.top = '100px';
		setTimeout(function() {
		  	moving=0;
		}, 1000);
		cur_state=1;
		main_image.style.transition = 'all 3.0s';
		main_image.style.top = '-1600px';
		main_content.style.height='5000px';
		main_hello.style.opacity=1;
		setTimeout(function() {
		  	moving=0;
		}, 1000);
		cur_state=2;
	}
	window.scrollTo({top:ofs*600,left:0,behavior:'smooth'});
}

var infoOn=0;

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

	if(where == "index") {
    	contents.innerHTML=`
    		<div id="contents-title">Main Page List</div>
    		<h3 id="contents-list-title">Info</h3>
    		<ul id="contents-list">
    			<li><a onclick="mainMove(0)">ABOUT</a></li>
    		</ul>
    		<h3 id="contents-list-title">Rest & Comfort</h3>
    		<ul id="contents-list">
    			<li><a onclick="mainMove(1)">REST</a></li>
    			<li><a onclick="mainMove(2)">FACILITY</a></li>
    			<li><a onclick="mainMove(3)">DINING</a></li>
    		</ul>
    		<h3 id="contents-list-title">Visual Amusement</h3>
    		<ul id="contents-list">
    			<li><a onclick="mainMove(4)">GALLERY</a></li>
    			<li><a onclick="mainMove(5)">ROOM</a></li>
    		</ul>
    		<h3 id="contents-list-title">Destination</h3>
    		<ul id="contents-list">
    			<li><a onclick="mainMove(6)">DESTINATION</a></li>
    		</ul>
    	`;
    }
	if(where=="login") {
		contents.innerHTML=`
			<div id="contents-title">Login</div>
		`;
	}
	if(where=="signup") {
		contents.innerHTML=`
			<div id="contents-title">SignUp</div>
			<ul id="contents-list" style="font-family: 'Gowun Batang', serif;">
    			<li>ID: 7~15자 입력</li>
    			<li>PW: 8~15자 문자, 특수문자, 숫자 조합입력</li>
    			<li>NAME: 3자 이상 입력</li>
    		</ul>
		`;
	}
	if(where=="dining") {
		contents.innerHTML=`
			<div id="contents-title">Dining</div>
			<ul id="contents-list" style="font-family: 'Gowun Batang', serif;">
				<li><b style="line-height:30px;">최상의 재료와 위생으로 대접합니다.</b></li>
    			<li>Korean: 한국의 맛과 향을 지닌 한정식</li>
    			<li>Western: 모던프렌치 파인다이닝</li>
    			<li>Japanese: 전통을 살린 스시야</li>
    		</ul>
		`;
	}
	if(where=="facility") {
		contents.innerHTML=`
			<div id="contents-title">Facility</div>
		`;
	}
	if(where=="reservation") {
		contents.innerHTML=`
			<div id="contents-title">Reservation</div>
			<ul id="contents-list" style="font-family: 'Gowun Batang', serif;">
				<li><b style="line-height:30px;">원하는 객실을 예약 가능합니다.</b></li>
    			<li>한 사람당 하나의 예약이 가능합니다.</li>
    			<li>예약이 된 객실에는 예약이 불가능합니다.</li>
    			<li>로그인 후 예약이 가능합니다.</li>
    		</ul>
		`;
	}
	if(where=="review" || where=="review_edit") {
		contents.innerHTML=`
			<div id="contents-title">Review</div>
			<ul id="contents-list" style="font-family: 'Gowun Batang', serif;">
				<li><b style="line-height:30px;">다녀 왔던 객실에 대한 후기를 작성할 수 있습니다.</b></li>
    			<li>한 예약에는 하나의 글이 작성이 가능합니다.</li>
    			<li>사진은 1개이상 5개 이하로 첨부 가능합니다.</li>
    			<li>로그인 후 글 작성이 가능합니다.</li>
    		</ul>
		`;
	}
	if(where=="room") {
		contents.innerHTML=`
			<div id="contents-title">Room</div>
			<ul id="contents-list" style="font-family: 'Gowun Batang', serif;">
				<li><b style="line-height:30px;">각 아트 컨셉에 맞는 객실을 선택하실 수 있습니다.</b></li>
    			<li>Contemporary Art: 현대 미술 풍 객실</li>
    			<li>Art Nouveau: 아르누보 풍 객실</li>
    			<li>Art Déco: 아르데코 풍 객실</li>
    			<li>Asia: 동양 풍 객실</li>
    		</ul>
		`;
	}
	if(where=="mypage") {
		contents.innerHTML=`
			<div id="contents-title">My Page</div>
			<ul id="contents-list" style="font-family: 'Gowun Batang', serif;">
				<li><b style="line-height:30px;">사용자의 정보를 확인할 수 있습니다.</b></li>
    			<li>WishList: 찜한 객실들을 확인할 수 있습니다.</li>
    			<li>Reservation: 예약 내역들을 확인할 수 있습니다.</li>
    			<li>Review: 작성한 후기 글들을 확인할 수 있습니다.</li>
    		</ul>
		`;
	}
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

	if(contents != null){
		contents.addEventListener('mouseover',() =>{
			if(contents.style.display == 'block') infoOn=1;
		});
		contents.addEventListener('mouseout',() =>{
			infoOn=0;
		});
	}
    myInfoButton.addEventListener('click', () => {
        if(!clicked) {
            contents.style.left=getNumberFromPixel(myInfoButton.style.left)-470+'px';
            contents.style.top=getNumberFromPixel(myInfoButton.style.top)-220+'px';
            contents.style.display='block';
        }
        else {
            contents.style.display='none';
        }
        clicked = !clicked;
    });
}






