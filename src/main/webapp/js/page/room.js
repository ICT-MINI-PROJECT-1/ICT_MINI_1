document.addEventListener('DOMContentLoaded', () => {
	room_wrap=document.getElementsByClassName("room-wrap")[0];
	
	room_title=document.getElementsByClassName("room-title")[0];
	
	grid_1=document.getElementById("room-contemp");
	grid_2=document.getElementById("room-artnou");
	grid_3=document.getElementById("room-artdec");
	grid_4=document.getElementById("room-asian");
	
});
var room_wrap;
var room_title;

var room_moving=0;
var room_state=0;

var grid_1;
var grid_2;
var grid_3;
var grid_4;

window.addEventListener("wheel", (e) => {
	if(room_title!=null && room_wrap!=null && window.scrollY==0) {
		if (e.wheelDelta > 0 || e.detail < 0){
			if(room_state==1&&room_moving++==0) {
				room_title.style.top = '100px';
				room_wrap.style.opacity=0;
				room_wrap.style.height='0px';
				grid_1.style.paddingBottom=0;		
				grid_2.style.paddingBottom=0;				
				grid_3.style.paddingBottom=0;
				grid_4.style.paddingBottom=0;
				setTimeout(function() {
				  	room_moving=0;
				}, 1000);
				room_state=0;
			}
		} else { //scroll down
			if(room_state==0&&room_moving++==0) {
				room_title.style.top = '-1000px';
				room_wrap.style.opacity= 1;
				room_wrap.style.height='70vw';
				grid_1.style.paddingBottom='60%';		
				grid_2.style.paddingBottom='60%';				
				grid_3.style.paddingBottom='60%';
				grid_4.style.paddingBottom='60%';
				setTimeout(function() {
				  	room_moving=0;
				}, 1000);
				room_state=1;
			}
		}
	}
});

where="room";

function moveToRoom(loc) {
	let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', 'room/list');
    document.body.appendChild(f);
	
	let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'loc');
    obj.setAttribute('value', loc);
	f.appendChild(obj);
    f.submit();
	//location.href="/page/room/list?loc="+loc;
}