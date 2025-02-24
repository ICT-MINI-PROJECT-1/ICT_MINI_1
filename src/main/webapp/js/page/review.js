document.addEventListener('DOMContentLoaded', () => {
	review_wrap=document.getElementsByClassName("review-wrap")[0];
	
	review_title=document.getElementsByClassName("review-title")[0];
});

var review_wrap;
var review_title;

var review_moving=0;
var review_state=0;

var selected_reviewno;
var selected_userid;
var selected_session_id;
window.addEventListener("wheel", (e) => {
	if(review_title!=null && review_wrap!=null && window.scrollY==0) {
		if (e.wheelDelta > 0 || e.detail < 0){
			if(review_state==1&&review_moving++==0) {
				review_title.style.top = '100px';
				review_wrap.style.position = 'fixed';
				review_wrap.style.opacity= 0;
				setTimeout(function() {
				  	review_moving=0;
				}, 1000);
				review_state=0;
			}
		} else { //scroll down
			if(review_state==0&&review_moving++==0) {
				review_title.style.top = '-1000px';
				review_wrap.style.position = 'static';
				review_wrap.style.opacity= 1;
				setTimeout(function() {
				  	review_moving=0;
				}, 1000);
				review_state=1;
			}
		}
	}
});

where="review";

//review_main.jsp에 있는 함수
window.onload = function(){
	closeModal();
}




/////////////////////////////////////////////////////////////
var selected_roomno;

function openModal(reviewno,userid,sessionid,roomno){
	selected_reviewno = reviewno;
	selected_roomno =  roomno;
	
	document.getElementById("btn").style.display='none';
	
	let review_modal = document.getElementById("review-list-modal");
	review_modal.style.opacity=1;
	review_modal.style.zIndex=10;
	
	fetch("/page/review/modalReview",{
		method: "POST",
		headers: {
			"Content-Type":"application/json"
		},
		body: JSON.stringify({
            reviewno: reviewno, 
            roomno: roomno
        })
	}).then(response => {
		if (!response.ok) {
	        return response.text().then(text => {
	            throw new Error('Network response was not ok: ' + text);
	        });
	    }
		return response.json()
	}).then(data => {
		console.log(data);
		document.getElementById("modal-subject").innerHTML = data.subject;
		document.getElementById("modal-roomno").innerHTML = data.roomno;
		document.getElementById("modal-rating").innerHTML = data.rating;
		document.getElementById("modal-writedate").innerHTML = data.writedate;
		document.getElementById("modal-userid").innerHTML = data.userid;
		document.getElementById("modal-content").innerHTML = data.content;
		document.getElementById("modal-hit").innerHTML = data.hit;
		console.log("data.hit="+data.hit);
		
		var roomconcept = "";
		var roomconceptKor = Math.trunc(data.roomno/100);
		
		if(roomconceptKor==3) roomconcept="현대풍";
		if(roomconceptKor==4) roomconcept="아르누보풍";
		if(roomconceptKor==5) roomconcept="아르데코풍";
		if(roomconceptKor==6) roomconcept="아시안";
		
		document.getElementById("modal-concept").innerHTML = roomconcept;
	}).catch(error => {
		console.log(error);
	});
	if(userid == sessionid) document.getElementById("btn").style.display='block';
}
function closeModal(){
	if(document.getElementById("review-list-modal")!=null)
		document.getElementById("review-list-modal").style.opacity = 0;
		document.getElementById("review-list-modal").style.zIndex = -5;
}

//리뷰수정 버튼
function reviewEdit(){
	let f = document.createElement('form');
	f.setAttribute('method','post');
	f.setAttribute('action','review/edit');
	document.getElementById('review-list-modal').appendChild(f);
	
	let obj;
	obj = document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','reviewno');
	obj.setAttribute('value', selected_reviewno);
	f.appendChild(obj);
	f.submit();
}
//리뷰삭제 버튼
function reviewDelete(){
	let f = document.createElement('form');
	f.setAttribute('method','post');
	f.setAttribute('action','review/delete');
	document.getElementById('review-list-modal').appendChild(f);
	
	let obj;
	obj = document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','reviewno');
	obj.setAttribute('value',selected_reviewno);
	f.appendChild(obj);
	f.submit();
}

//review_write.jsp에 있는 함수
function writeFormCheck(event){
	if(document.getElementById('write-subject').value==''){
		alert("제목 없음");
		event.preventDefault();
	}
	
	const content = editor.getData();	//ckeditor에 작성한 글 가져오기
	if(content.trim() == ''){
		alert("내용 없음");
		event.preventDefault();
	}
}

//function reviewPrevPage(pageNum){
	//let f = document.createElement('form');
	//f.setAttribute('method','post');
	//f.setAttribute('action','review');
	//document.getElementById('').appendChild(f);
//}

function postPaging(now_page,search_word,search_key,search_hr, search_concept){
	let f = document.createElement('form');
	f.setAttribute('method','post');
	f.setAttribute('action','review');
	document.body.appendChild(f);
	
	let obj;
	obj = document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','nowPage');
	obj.setAttribute('value',now_page);
	f.appendChild(obj);
	if(search_key!=null && search_key!="") {
		obj = document.createElement('input');
		obj.setAttribute('type','hidden');
		obj.setAttribute('name','searchKey');
		obj.setAttribute('value',search_key);
		f.appendChild(obj);
	}
	if(search_word!=null && search_word!="") {
		obj = document.createElement('input');
		obj.setAttribute('type','hidden');
		obj.setAttribute('name','searchWord');
		obj.setAttribute('value',search_word);
		f.appendChild(obj);
	}
	if(search_hr!=null && search_hr!="") {
		obj = document.createElement('input');
		obj.setAttribute('type','hidden');
		obj.setAttribute('name','searchHR');
		obj.setAttribute('value',search_hr);
		f.appendChild(obj);
	}
	if(search_concept!=null && search_concept!="") {
		obj = document.createElement('input');
		obj.setAttribute('type','hidden');
		obj.setAttribute('name','searchConcept');
		obj.setAttribute('value',search_concept);
		f.appendChild(obj);
	}
	f.submit();
}

function postSearching(){
	let f = document.createElement('form');
	f.setAttribute('method','post');
	f.setAttribute('action','review');
	document.body.appendChild(f);
	
	let obj = document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','searchKey');
	obj.setAttribute('value',document.getElementById("searchKey").value);
	f.appendChild(obj);
	
	obj = document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','searchWord');
	obj.setAttribute('value',document.getElementById("searchWord").value);
	f.appendChild(obj);
	
	obj = document.createElement('input');
	obj.setAttribute('type','hidden');
	obj.setAttribute('name','searchConcept');
	obj.setAttribute('value',document.getElementById("searchConcept").value);
	f.appendChild(obj);
	
	f.submit();
}
