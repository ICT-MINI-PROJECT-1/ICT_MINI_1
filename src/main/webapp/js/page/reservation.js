document.addEventListener('DOMContentLoaded', () => {
	reserv_wrap=document.getElementsByClassName("reserv-wrap")[0];
	
	reserv_title=document.getElementsByClassName("reserv-title")[0];
	
	type = document.getElementById("reserv-typing");
	
	if(reserv_wrap!=null && reserv_title!=null){
		reserv_wrap.style.transition = 'none';
		reserv_title.style.top = '100px';
		reserv_wrap.style.position = 'fixed';
		reserv_wrap.style.opacity= 0;
	}
	
	speed = 100;
	t=0;
	
	text = "예술적인 경험을 할 준비가 되셨나요?";
	
	month= document.getElementById("month");
	calendar_box = document.getElementById("calendar");
	
	mov_cal=0;
	
});

function wait(ms) {
	return new Promise(res=>setTimeout(res,ms));
}

const typing = async () => {
	type.innerHTML = "";
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
	if(modal!=null){
		modal.style.zIndex=zIndex;
		modal.style.opacity=opacity;
	}
}

var dateArr = new Array();
var year_arr = new Array();
var month_arr = new Array();
var day_arr = new Array();

var dateEndArr = new Array();
var yearEnd_arr = new Array();
var monthEnd_arr = new Array();
var dayEnd_arr = new Array();


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
	fetch("/page/reservation/setCalendar",{
		method:"POST",
		headers:{
			"Content-Type":"text/plain",
		},
		body:roomno
		})
		.then(response => response.json())
		.then(data => {
			for(var i=0;i<data.length;i++) {
				dateArr.push(new Date(data[i].reservdate));
				year_arr.push(new Date(data[i].reservdate).getFullYear());
				month_arr.push(new Date(data[i].reservdate).getMonth());
				day_arr.push(new Date(data[i].reservdate).getDate());
				dateEndArr.push(new Date(data[i].reservenddate));
				yearEnd_arr.push(new Date(data[i].reservenddate).getFullYear());
				monthEnd_arr.push(new Date(data[i].reservenddate).getMonth());
				dayEnd_arr.push(new Date(data[i].reservenddate).getDate());
			}
		}).catch(err=> {
		console.log(err);
	});
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

let mov_cal;

var currentDate;
var printDate;

function printMonth() {
	if(what_cal==0) {
	    currentDate = new Date();
		printDate = new Date();
	}
	else {
		currentDate = reservdate;
		printDate = new Date(currentDate);
		printDate.setDate(1);
	}
	printDate.setMonth(currentDate.getMonth()+mov_cal);
    var printYear = printDate.getFullYear();
    var printMonth = printDate.getMonth();

    var monthNames = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
    ];
    
    var currentMonthName = monthNames[printMonth];
    
    month.innerHTML = "<h2>" + printYear +"&nbsp&nbsp&nbsp"+ currentMonthName + "</h2>";
}

var reservdate;

function printEndCalendar(y, m){
    var date = new Date();
    var nowY = printDate.getFullYear();
    var nowM = printDate.getMonth();
    var nowD = printDate.getDate();
    
    var curY = currentDate.getFullYear();
    var curM = currentDate.getMonth();
    var curD = currentDate.getDate();
    
    y = (y != undefined) ? y : nowY;
    m = (m != undefined) ? m-1 : nowM;

    var theDate = new Date(y, m, 1); 
    var theDay = theDate.getDay();


    var last = [31,28,31,30,31,30,31,31,30,31,30,31];

    if (y % 4 == 0 && y % 100 !=0 || y % 400 == 0) lastDate=last[1]=29;

    var lastDate = last[m];

    var row = Math.ceil((theDay+lastDate)/7);

    calendar_box.innerHTML = "<h2>" + y + "." + (m+1) + "</h2>";

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
    
    let x_t=new Date(curY+"-"+("00"+(curM+1)).slice(-2)+"-"+("00"+curD).slice(-2));
    let x_l=new Date(curY+"-"+("00"+(curM+1)).slice(-2)+"-"+("00"+curD).slice(-2));
    x_l.setDate(x_l.getDate() + 2);
    for (var i = 1; i <= row; i++) {
        calendar += "<tr>";
        for (var k = 1; k <= 7; k++) {    
            if (i == 1 && k < theDay || dNum > lastDate) {
                calendar += "<td> &nbsp; </td>";
            }
            else {
            	let x=new Date(printDate.getFullYear()+"-"+("00"+(printDate.getMonth()+1)).slice(-2)+"-"+("00"+dNum).slice(-2));      	
                if (reservdate.getFullYear()==nowY && reservdate.getMonth()==nowM && dNum == reservdate.getDate()) {
                	calendar += "<td id='today' style='color:blue; cursor:pointer;' onclick='setReservEndDate("+dNum+")'>" + dNum + "</td>";
                } else {
                	let calOk=0;
                	let calNk=0;
                	for(var t=0;t<red_date.length;t++) {
                		if(reservdate.getFullYear()==red_date[t].getFullYear() &&reservdate.getMonth()==red_date[t].getMonth()&& reservdate.getDate()+1==red_date[t].getDate()){
                			calNk=1;
                		}
                		if(nowY == red_date[t].getFullYear() && nowM==red_date[t].getMonth() && dNum == red_date[t].getDate()) {
                			calOk=1;
							break;
                		}
                	}
					if(calOk==1) {
						calendar += "<td style='color:red;'>" + dNum + "</td>";
					}
					else {
						if(x >= x_t && x<=x_l && calNk==0) {
							calendar += "<td style='color:blue;' id='can-reserv' onclick='setReservEndDate("+dNum+")'>" + dNum + "</td>";
						}
						else calendar += "<td>" + dNum + "</td>";
                	}
                }
                dNum++;
            }
        }
    calendar += "<tr>";
    }    
    calendar_box.innerHTML = calendar;
}

let calendar_box;

var red_date = new Array();

function printCalendar(y, m) {
    var date = new Date();
    var nowY = printDate.getFullYear();
    var nowM = printDate.getMonth();
    var nowD = printDate.getDate();
    
    var curY = currentDate.getFullYear();
    var curM = currentDate.getMonth();
    var curD = currentDate.getDate();
    
    y = (y != undefined) ? y : nowY;
    m = (m != undefined) ? m-1 : nowM;

    var theDate = new Date(y, m, 1); 
    var theDay = theDate.getDay();


    var last = [31,28,31,30,31,30,31,31,30,31,30,31];

    if (y % 4 == 0 && y % 100 !=0 || y % 400 == 0) lastDate=last[1]=29;

    var lastDate = last[m];

    var row = Math.ceil((theDay+lastDate)/7);

    calendar_box.innerHTML = "<h2>" + y + "." + (m+1) + "</h2>";

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
    for (var i = 1; i <= row; i++) {
        calendar += "<tr>";
        for (var k = 1; k <= 7; k++) {    
            if (i == 1 && k < theDay || dNum > lastDate) {
                calendar += "<td> &nbsp; </td>";
            }
            else {
                if (nowY==curY && nowM==curM && dNum == nowD) {
                    calendar += "<td id='today'>" + dNum + "</td>";
                } else {
                	let calOk=0;
					for(var t=0;t<dateArr.length;t++) {
						if(nowY<= yearEnd_arr[t]&&nowY>=year_arr[t] &&nowM<= monthEnd_arr[t]&& nowM >= month_arr[t]&& dNum<= dayEnd_arr[t] && dNum>=day_arr[t]) {
							calOk=1;
							break;
						}
					}
					if(calOk==1) {
						calendar += "<td style='color:red;'>" + dNum + "</td>";
						var df = nowY+"-"+("00"+(nowM+1)).slice(-2)+"-"+("00"+dNum).slice(-2);
						red_date.push(new Date(df));
					}
					else {
	                	if(nowY==curY && nowM==curM && dNum > nowD)calendar += "<td id='can-reserv' onclick='setReservDate("+dNum+")'>" + dNum + "</td>";
	                	else if(nowY>=curY && nowM>curM)calendar += "<td id='can-reserv' onclick='setReservDate("+dNum+")'>" + dNum + "</td>";
	                	else if(nowY>curY)calendar += "<td id='can-reserv' onclick='setReservDate("+dNum+")'>" + dNum + "</td>";
	                	else calendar += "<td>" + dNum + "</td>";
                	}
                }
                dNum++;
            }
        }
    calendar += "<tr>";
    }    
    calendar_box.innerHTML = calendar;
}

function setReservDate(a){
	var df = printDate.getFullYear()+"-"+("00"+(printDate.getMonth()+1)).slice(-2)+"-"+("00"+a).slice(-2);
	let rd = document.getElementById("reservdate");
	reservdate = new Date(df);
	rd.value=df;
	currentDate=reservdate;
	closeCalendar();
}

function setReservEndDate(a){
	var df = printDate.getFullYear()+"-"+("00"+(printDate.getMonth()+1)).slice(-2)+"-"+("00"+a).slice(-2);
	let rd = document.getElementById("reservenddate");
	rd.value=df;
	closeCalendar();
}

var what_cal=0;

function openCalendar() {
	if(document.getElementById("roomno").value != "") {
		document.getElementById("reservenddate").value = "";
		what_cal=0;
		document.getElementById("alert-date").style.opacity = 0;
		findRoom(-1,0);
		mov_cal=0;
		printMonth();
		printCalendar();
		let room_no = document.getElementById("roomno");
		if(room_no.value != "") {
			document.getElementsByClassName("calendarBox")[0].style.opacity=1;
			document.getElementsByClassName("calendarBox")[0].style.zIndex=5;
		}
	} else {
		document.getElementById("alert-date").innerHTML = "방을 먼저 선택해주세요.";
		document.getElementById("alert-date").style.opacity = 1;
	}
}

function openEndCalendar() {
	if(document.getElementById("reservdate").value != "") {
		what_cal=1;
		document.getElementById("alert-enddate").opacity = 0;
		findRoom(-1,0);
		mov_cal=0;
		printMonth();
		printEndCalendar();
		let room_no = document.getElementById("roomno");
		if(room_no.value != "") {
			document.getElementsByClassName("calendarBox")[0].style.opacity=1;
			document.getElementsByClassName("calendarBox")[0].style.zIndex=5;
		}
	}
	else {
		document.getElementById("alert-enddate").innerHTML = "예약 시작 날짜를 먼저 선택해주세요.";
		document.getElementById("alert-enddate").style.opacity = 1;
	}
}

function closeCalendar() {
	document.getElementsByClassName("calendarBox")[0].style.opacity=0;
	document.getElementsByClassName("calendarBox")[0].style.zIndex=-1;
}

function moveCalendar(wh) {
	mov_cal += wh;
	printMonth();
	if(what_cal==0) printCalendar();
	else printEndCalendar();
}

function reservChk(){
	var ok=0;
	let roomno = document.getElementById("roomno");
	let usercnt = document.getElementById("usercnt");
	let reservdate = document.getElementById("reservdate");
	var alert_roomno = document.getElementById("alert-roomno");
	var alert_people = document.getElementById("alert-people");
	var alert_date = document.getElementById("alert-date");
	if(roomno.value=="") {
		alert_roomno.innerHTML = "객실을 선택해주세요.";
    	alert_roomno.style.opacity = 1;
	} else {
		alert_roomno.style.opacity = 0;
		ok++;
	}
	if(usercnt.value=="") {
		alert_people.innerHTML = "인원을 입력해주세요.";
    	alert_people.style.opacity = 1;
	} else if(isNaN(usercnt.value)) {
		alert_people.innerHTML = "숫자를 입력해주세요.";
    	alert_people.style.opacity = 1;
	} else if(document.getElementById("capacity").value == "") {
		alert_people.innerHTML = "객실을 먼저 선택해주세요.";
    	alert_people.style.opacity = 1;
	} else if(document.getElementById("capacity").value < usercnt.value){
		alert_people.innerHTML = "인원 초과 입니다.";
    	alert_people.style.opacity = 1;
	} else {
		alert_people.style.opacity = 0;
		ok++;
	}
	if(reservdate.value=="") {
		alert_date.innerHTML = "날짜를 선택해주세요.";
    	alert_date.style.opacity = 1;
	} else {
		alert_date.style.opacity = 0;
		ok++;
	}
	if(ok==3) document.reservForm.submit();
}

function reservDelete(wh){
	let dm = document.getElementById("reserv-edit-modal");
	if(wh==0){ //open modal
		dm.style.opacity=1;
		dm.style.zIndex=5;
	} else if(wh==1) {
		document.reservEditForm.submit();
	} else {
		dm.style.opacity=0;
		dm.style.zIndex=-1;
	}
}