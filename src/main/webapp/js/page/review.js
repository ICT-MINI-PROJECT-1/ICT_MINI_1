document.addEventListener('DOMContentLoaded', () => {
	review_wrap=document.getElementsByClassName("review-wrap")[0];
	review_title=document.getElementsByClassName("review-title")[0];
	
	var write_subject = document.getElementById("write-subject");
	var write_content = document.getElementById("write-content");
	var input_file = document.getElementById("fie");
	
	var alert_subject = document.getElementById("alert-subject");
	var alert_content = document.getElementById("alert-content");
	var alert_file = document.getElementById("alert-file");
	
	write_subject.addEventListener("input", ()=>{
		if(write_subject.value.length<5){
			alert_subject.innerHTML = "제목을 5자 이상 입력해주세요.";
			alert_subject.style.opacity = 1;
			subjectOk = 0;
		}else if(write_subject.value.length>45){
			alert_subject.innerHTML = "제목을 45자 이하로 입력해주세요.";
			alert_subject.style.opacity = 1;
			subjectOk = 0;
		}else{
			alert_subject.style.opacity = 0;
			subjectOk = 1;
		}
	});
	write_content.addEventListener("input",()=>{
		if(write_content.value.length<10){
			alert_content.innerHTML = "내용을 10자 이상 입력해주세요.";
			alert_content.style.opacity = 1;
			contentOk = 0;
		}else if(write_content.value.length>500){
			alert_content.innerHTML = "내용을 500자 이하로 입력해주세요.";
			alert_content.style.opacity = 1;
			contentOk = 0;
		}else{
			alert_content.style.opacity = 0;
			contentOk = 1;
		}
	});
});

var review_result = 0;
var subjectOk = 1;
var contentOk = 1;
var fileOk = 0;

//제목, 내용, 파일업로드 조건에 맞을 때만 submit 가능하게 하기
function writeChk(){
	review_result = subjectOk + contentOk + fileOk;
	if(fileOk==0){
		let alert_file = document.getElementById("alert-file");
		alert_file.innerHTML = "파일을 1-5개 넣어주세요.";
		alert_file.style.opacity = 1;
	} 
	if(review_result==3) document.writeForm.submit();
}

//첨부파일 갯수 5개로 제한
function addFile(obj){
	let alert_file = document.getElementById("alert-file");
	//alert(obj);
	const minFileCnt = 1;
	const maxFileCnt = 5;	//첨부파일 최대 개수
	
	//var attFileCnt = document.getElementById("filename").files.length; //기존에 추가된 첨부파일 개수
	//var remainFileCnt = maxFileCnt - attFileCnt; //추가로 첨부가능한 개수
	var curFileCnt = obj.files.length; //현재 선택된 첨부파일 개수
	//alert("attFileCnt="+attFileCnt);
	
	if(curFileCnt<minFileCnt || curFileCnt>maxFileCnt){
		alert_file.innerHTML = "파일을 1-5개 넣어주세요.";
		alert_file.style.opacity = 1;
		fileOk = 0;
	}else{
		alert_file.style.opacity = 0;
		fileOk = 1;
	}

}


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
				}, 700);
				review_state=0;
			}
		} else { //scroll down
			if(review_state==0&&review_moving++==0) {
				review_title.style.top = '-1000px';
				review_wrap.style.position = 'static';
				review_wrap.style.opacity= 1;
				setTimeout(function() {
				  	let f = document.createElement('form');
					f.setAttribute('method','post');
					f.setAttribute('action','review');
					document.body.appendChild(f);
					f.submit();
				}, 700);
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

		let modal_main_img = document.getElementById("modal-img-main");
		let modals = document.getElementById("modals");
		modals.innerHTML="";
		modal_main_img.innerHTML = `<div style="width:100%; height:100%; background:url('/uploadfile/`+data.vo.reviewno+`/`+data.rivo[0].filename+`') no-repeat;background-size:cover;background-position:center;"></div>`;
		for(var t=0;t<data.rivo.length;t++) {
			modals.innerHTML+=`<li class="modal-img-mini" onclick="moveModalPage('`+t+`','`+reviewno+`','`+roomno+`')" style="cursor:pointer;background:url('/uploadfile/`+data.vo.reviewno+`/`+data.rivo[t].filename+`') no-repeat; background-size:cover;background-position:center;"></li>`;
		}
		document.getElementById("modal-subject").innerHTML = data.vo.subject;
		document.getElementById("modal-roomno").innerHTML = data.vo.roomno;
		document.getElementById("modal-rating").innerHTML = data.vo.rating;
		document.getElementById("modal-writedate").innerHTML = data.vo.writedate;
		document.getElementById("modal-userid").innerHTML = data.vo.userid;
		document.getElementById("modal-content").innerHTML = data.vo.content;
		document.getElementById("modal-hit").innerHTML = data.vo.hit;
		
		var roomconcept = "";
		var roomconceptKor = Math.trunc(data.vo.roomno/100);
		
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
/*
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
	
	
	////////////////
	if(review_result==3){
		alert("제출가능"+review_result);
		return true;
	}else{
		alert("제출 못한다"+review_result);
		return false;
	}
	
}
*/



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

function moveModalPage(page,reviewno,roomno){
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
		let modal_main_img = document.getElementById("modal-img-main");
		modal_main_img.innerHTML = `<div style="width:100%; height:100%; background:url('/uploadfile/`+data.vo.reviewno+`/`+data.rivo[page].filename+`') no-repeat;background-size:cover;background-position:center;"></div>`;
	}).catch(error => {
		console.log(error);
	});
	console.log(page);
}