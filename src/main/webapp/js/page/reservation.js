document.addEventListener('DOMContentLoaded', () => {
	reserv_wrap=document.getElementsByClassName("reserv-wrap")[0];
	
	reserv_title=document.getElementsByClassName("reserv-title")[0];
	
	type = document.getElementById("reserv-typing");
	
	
	speed = 100;
	t=0;
	
	text = "예술적인 경험을 할 준비가 되셨나요?";
	
	month= document.getElementById("month");
	calendar_box = document.getElementById("calendar");
	
	printMonth();
	printCalendar();
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

function findRoom(zIndex,opacity){
	closeCalendar();
	let modal = document.getElementById("reserv-room-modal");
	modal.style.zIndex=zIndex;
	modal.style.opacity=opacity;
}

function selectRoom(roomno){
	let room_no = document.getElementById("roomno");
	let capacity = document.getElementById("capacity");
	let bedtype = document.getElementById("bedtype");
	let viewtype = document.getElementById("viewtype");
	let checkin = document.getElementById("checkin");
	let checkout = document.getElementById("checkout");
	let price = document.getElementById("price");
	let imgs = new Array(3);
	for(var i=0;i<3;i++) imgs[i] = document.getElementById("reserv-img-"+(i+1));
	fetch("/page/reservation/selectRoom",{
		method:"POST",
		headers:{
			"Content-Type":"text/plain",
		},
		body:roomno
		})
		.then(response => response.json())
		.then(data => {
			room_no.value = data.roomno;
			capacity.value = data.capacity;
			bedtype.value=data.bedtype;
			viewtype.value=data.viewtype;
			checkin.value=data.checkin;
			checkout.value=data.checkout;
			price.value=data.price;
			for(var idx=0;idx<3;idx++) {
				imgs[idx].style.background="url('../../img/page/room/list/"+data.roomno+"/"+data.roomno+"-"+(idx+1)+".jpg') no-repeat";
				imgs[idx].style.backgroundSize="cover";
				imgs[idx].style.backgroundPosition="center";
			}
			imgs[list_page].style.opacity=1;
		}).catch(err=> {
		console.log(err);
	});
	findRoom(-1,0);
}

var list_page=0;

function goListPage(wh){
	let imgs = new Array(3);
	for(var i=0;i<3;i++) {
		imgs[i] = document.getElementById("reserv-img-"+(i+1));
		imgs[i].style.opacity=0;
	}
	if(list_page==0 && wh==-1) list_page=2;
	else if(list_page==2 && wh==1) list_page=0;
	else list_page+=wh;
	imgs[list_page].style.opacity=1;
}

//이번 달 구하기
let month;

function printMonth() {
    
    // 현재 날짜를 나타내는 Date 객체 생성
    var currentDate = new Date();

    // 현재 월을 가져옴
    var currentMonth = currentDate.getMonth();
    
    //영어로 바꾸기
    var monthNames = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
    ];
    
    var currentMonthName = monthNames[currentMonth];
    
    month.innerHTML = "<h2>" + currentMonthName + "</h2>";
}


//이번 달 달력 그리기
let calendar_box;

function printCalendar(y, m) {    
    
    //① 현재 날짜와 현재 달에 1일의 날짜 객체를 생성합니다.
    var date = new Date(); //날짜 객체 생성
    var nowY = date.getFullYear(); //현재 연도
    var nowM = date.getMonth(); //현재 월
    var nowD = date.getDate(); //현재 일
    
    y = (y != undefined) ? y : nowY;
    m = (m != undefined) ? m-1 : nowM;
        
    /* 현재 월의 1일에 요일을 구합니다. 
     그럼 그달 달력에 첫 번째 줄 빈칸의 개수를 구할 수 있습니다.*/
    var theDate = new Date(y, m, 1); 
    var theDay = theDate.getDay();

    //② 현재 월에 마지막 일을 구해야 합니다.

    //1월부터 12월까지 마지막 일을 배열로 저장함.
    var last = [31,28,31,30,31,30,31,31,30,31,30,31];
    /*현재 연도가 윤년(4년 주기이고 100년 주기는 제외합니다. 
    또는 400년 주기)일경우 2월에 마지막 날짜는 29가 되어야 합니다.*/
    if (y % 4 == 0 && y % 100 !=0 || y % 400 == 0) lastDate=last[1]=29;

    var lastDate = last[m]; //현재 월에 마지막이 몇일인지 구합니다.

    //③ 현재 월의 달력에 필요한 행의 개수를 구합니다.
    var row = Math.ceil((theDay+lastDate)/7); //필요한 행수
    
    //④ 달력 년도/월 표기 및  달력 테이블 생성
    calendar_box.innerHTML = "<h2>" + y + "." + (m+1) + "</h2>";
    
    //문자결합 연산자를 사용해 요일이 나오는 행을 생성    
    var calendar = "<table border='1'>";
    calendar += "<tr>";
    calendar += "<th>MON</th>";
    calendar += "<th>TUE</th>";
    calendar += "<th>WED</th>";
    calendar += "<th>THU</th>";
    calendar += "<th>FRI</th>";
    calendar += "<th>SAT</th>";
    calendar += "<th>SUN</th>";
    calendar += "</tr>";
    
    var dNum = 1;
    //이중 for문을 이용해 달력 테이블을 생성
    for (var i = 1; i <= row; i++) {//행 생성 (tr 태그 생성)
        calendar += "<tr>";

        for (var k = 1; k <= 7; k++) {//열 생성 (td 태그 생성)        
            /*행이 첫 줄이고 현재 월의 1일의 요일 이전은 모두 빈열로
            표기하고 날짜가 마지막 일보다 크면 빈열로 표기됩니다.*/
            if (i == 1 && k < theDay || dNum > lastDate) {
                calendar += "<td> &nbsp; </td>";
            }
            else {
                // 오늘 날짜에 대한 스타일 적용
                if (dNum === nowD) {
                    calendar += "<td id='today'>" + dNum + "</td>";
                } else {
                    calendar += "<td>" + dNum + "</td>";
                }
                dNum++;
            }
        }
    calendar += "<tr>";
    }    

    //⑤ 문자로 결합된 달력 테이블을 문서에 출력
    calendar_box.innerHTML = calendar;
}

function openCalendar() {
	findRoom(-1,0);
	let room_no = document.getElementById("roomno");
	if(room_no.value != "") {
		document.getElementsByClassName("calendarBox")[0].style.opacity=1;
		document.getElementsByClassName("calendarBox")[0].style.zIndex=5;
	}
}

function closeCalendar() {
	document.getElementsByClassName("calendarBox")[0].style.opacity=0;
	document.getElementsByClassName("calendarBox")[0].style.zIndex=-1;
}