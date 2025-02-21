function moveToRoom(loc) {
	let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '../page/room/list');
    document.body.appendChild(f);
	
	let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'loc');
    obj.setAttribute('value', loc);
	f.appendChild(obj);
    f.submit();
}

function moveReserv(loc) {
	if(loc=="") {
		location.href="/page/reservation/form";
	}
}