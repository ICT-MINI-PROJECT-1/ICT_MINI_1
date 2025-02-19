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

function renderList(arg,path){
	for(var i=0;i<8;i++) {
		let room = document.getElementById("item-"+(arg+i));
		room.style.background="url('../../img/page/room/"+path+"/"+(arg+i)+".jpg') no-repeat";
		room.style.backgroundSize="cover";
		room.style.backgroundPosition="center";
	}
}

function openModal(data){
	var path="contemp";
	if(parseInt(data/100)==3) path="contemp";
	if(parseInt(data/100)==4) path="artnou";
	if(parseInt(data/100)==5) path="artdec";
	if(parseInt(data/100)==6) path="asian";
	
	let modal=document.getElementById("room-list-modal");
	let modal_img=document.getElementById("modal-img");
	modal.style.opacity=1;
	modal.style.zIndex=10;
	modal_img.style.background="url('../../img/page/room/"+path+"/"+data+".jpg') no-repeat";
	modal_img.style.backgroundSize="cover";
	modal_img.style.backgroundPosition="center";
	fetch("/page/room/modalinfo",{
		method:"POST",
		headers:{
			"Content-Type":"text/plain",
		},
		body:data
		}).then(response => response.json())
		.then(data=>{
			document.getElementById("contents-roominfo").innerHTML="<pre>"+data.roominfo+"</pre>";
			document.getElementById("contents-roomno").innerHTML=data.roomno;
			move_roomno=data.roomno;
			if(data.roomconcept=='contemp')document.getElementById("contents-roomconcept").innerHTML="현대풍";
			if(data.roomconcept=='artnou')document.getElementById("contents-roomconcept").innerHTML="아르누보풍";
			if(data.roomconcept=='artdec')document.getElementById("contents-roomconcept").innerHTML="아르데코풍";
			if(data.roomconcept=='asian')document.getElementById("contents-roomconcept").innerHTML="동양풍";
			
			document.getElementById("contents-viewtype").innerHTML=data.viewtype;
			document.getElementById("contents-capacity").innerHTML=data.capacity;
			document.getElementById("contents-area").innerHTML=data.area;
			document.getElementById("contents-bedtype").innerHTML=data.bedtype;
			document.getElementById("contents-price").innerHTML=data.price;
			document.getElementById("contents-rating").innerHTML=`
				<div class="modal-star-box">
					<div class="modal-star-fill" style="width:90%"></div>
				</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			` + data.rating;
		}).catch(err=> {
		console.log(err);
	});
}

var move_roomno;

function closeModal(){
	let modal=document.getElementById("room-list-modal");
	modal.style.opacity=0;
	modal.style.zIndex=-5;
}

function renderWish(roomno){
	fetch("/page/room/renderWish")
	.then(response => response.json())
	.then(data=>{
		for(var i=roomno*100+1;i<=roomno*100+8;i++){
			let ok=0;
			let x = document.getElementById("wish-"+i);
			for(var j=0;j<data.length;j++) {
				if(i==data[j].roomno) {
					x.style.background="url('../../img/public/wish.png') no-repeat";
					x.style.backgroundSize="cover";
					x.style.backgroundPosition="center";
					ok=1;
					break;
				}
			}
			if(!ok) {
				x.style.background="url('../../img/public/unwish.png') no-repeat";
				x.style.backgroundSize="cover";
				x.style.backgroundPosition="center";
			}
		}
	}).catch(err=> {
	console.log(err);
	});
}

function doWish(roomno){
	fetch("/page/room/doWish",{
		method:"POST",
		headers:{
			"Content-Type":"text/plain",
		},
		body:roomno
		})
		.then((res) =>
			{renderWish(parseInt(roomno/100));}
		).catch(err=> {
		console.log(err);
	});
}

document.addEventListener('keydown', function(event) {
    if (event.keyCode == 27) {
        closeModal();
    }
});

function moveReserv(){
	let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '../reservation/form');
    document.body.appendChild(f);
	
	let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'roomno');
    obj.setAttribute('value', move_roomno);
	f.appendChild(obj);
    f.submit();
}