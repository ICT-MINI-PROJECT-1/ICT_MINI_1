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


window.onload = function(){
	closeModal();
}
function openModal(reviewno,userid,sessionid){
	document.getElementById("btn").style.display='none';
	document.getElementById("review-list-modal").style.display = "block";
	
	fetch("/page/review/modalReview",{
		method: "POST",
		headers: {
			"Content-Type":"text/plain"
		},
		body: reviewno
	}).then(response => {
		return response.json()
	}).then(data => {
		console.log(data);
		document.getElementById("modal-subject").innerHTML = data.subject;
		document.getElementById("modal-roomno").innerHTML = data.roomno;
		document.getElementById("modal-rating").innerHTML = data.rating;
		document.getElementById("modal-writedate").innerHTML = data.writedate;
		document.getElementById("modal-userid").innerHTML = data.userid;
		document.getElementById("modal-content").innerHTML = data.content;
	}).catch(error => {
		console.log(error);
	});
	if(userid == sessionid) document.getElementById("btn").style.display='block';
}
function closeModal(){
	if(document.getElementById("review-list-modal")!=null)
		document.getElementById("review-list-modal").style.display = "none";
}

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


//function reviewPrevPage(pageNum){
	//let f = document.createElement('form');
	//f.setAttribute('method','post');
	//f.setAttribute('action','review');
	//document.getElementById('').appendChild(f);
//}