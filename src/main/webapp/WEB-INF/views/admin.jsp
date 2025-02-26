<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<script src="${pageContext.request.contextPath}/js/admin.js"></script>
	<link href="${pageContext.request.contextPath }/css/admin.css" rel="stylesheet" type="text/css"/>
	<script>
	var tag="";
	var searchKey="";
	var searchWord="";
	
	function adminUserList(page){
		tag="user";
		document.getElementById("page-box").innerHTML="";
		let user_box=document.getElementById("users");
		user_box.innerHTML=`<ul id='user-box'><li>
				userid
			</li>
			<li>
				userpw
			</li>
			<li>
				username
			</li>
			<li>
				tel
			</li>
			<li>
				email
			</li>
			<li>
				zipcode
			</li>
			<li>
				addr
			</li>
			<li>
				addrdetail
			</li>
			<li>
				creditcardno
			</li><li>삭제</li></ul>`;
		document.getElementById("page-box").innerHTML="";
		var params;
		if(searchKey!="" && searchWord!="") {
			params ={
					nowPage:page,
					searchKey:searchKey,
					searchWord:searchWord
			}
		}
		else {
			params ={
					nowPage:page
			}
		}
		fetch("/admin/user",{
			method:"POST",
			headers:{
				"Content-Type":"application/json",
			},
			body:JSON.stringify(params)
		})
		.then(response => response.json())
		.then(data=>{
			for(var i=0;i<data.uv.length;i++) {
				users.innerHTML += "<ul id='user-box'><li>"+data.uv[i].userid+"</li><li>"+data.uv[i].userpw+"</li><li>"+data.uv[i].username+"</li><li>"+data.uv[i].tel+"</li><li>"+data.uv[i].email+"</li><li>"+data.uv[i].zipcode+"</li><li>"+data.uv[i].addr+"</li><li>"+data.uv[i].addrdetail+"</li><li>"+data.uv[i].creditcardno+"</li><li><a href='#' onclick="+`deleteUser("`+data.uv[i].userid+`")`+">삭제</a></li></ul>";
			}
			for(var i=data.pvo.startPageNum; i<data.pvo.startPageNum+data.pvo.onePageCount;i++) {
				if(i==data.pvo.startPageNum) {
					if(data.pvo.nowPage == 1) document.getElementById("page-box").innerHTML += `<li>◀</li>`;
					else document.getElementById("page-box").innerHTML += `<li onclick="adminUserList(`+(data.pvo.nowPage-1)+`)">◀</li>`;
				}
				if(i<=data.pvo.totalPage) {
					if(i==data.pvo.nowPage)document.getElementById("page-box").innerHTML+=`<li style='color:blue' onclick="adminUserList(`+i+`)">`+i+`</li>`;
					else document.getElementById("page-box").innerHTML+=`<li onclick="adminUserList(`+i+`)">`+i+`</li>`;
				}
			}
			if(data.pvo.nowPage == data.pvo.totalPage) document.getElementById("page-box").innerHTML += `<li>▶</li>`;
			else document.getElementById("page-box").innerHTML += `<li onclick="adminUserList(`+(data.pvo.nowPage+1)+`)">▶</li>`;
		}).catch(err=> {
			console.log(err);
		});
	}
		function deleteUser(userid){
			fetch("/admin/delete/user",{
				method:"POST",
				headers:{
					"Content-Type":"text/plain",
				},
				body:userid
			})
			.then(response => response)
			.then(data=>{

			}).catch(err=> {
				console.log(err);
			});
		}
		function adminReservList(page){
			tag="reserv";
			document.getElementById("page-box").innerHTML="";
			let user_box=document.getElementById("users");
			user_box.innerHTML=`<ul id='reserv-box'><li>
					reservno
				</li>
				<li>
					userid
				</li>
				<li>
					roomno
				</li>
				<li>
					reservdate
				</li>
				<li>
					reservenddate
				</li>
				<li>
					usercnt
				</li>
				<li>
					request
				</li>
				<li>
					삭제
				</li>
				</ul>`;
			document.getElementById("page-box").innerHTML="";
			var params;
			if(searchKey!="" && searchWord!="") {
				params ={
						nowPage:page,
						searchKey:searchKey,
						searchWord:searchWord
				}
			}
			else {
				params ={
						nowPage:page
				}
			}
			fetch("/admin/reserv",{
				method:"POST",
				headers:{
					"Content-Type":"application/json",
				},
				body:JSON.stringify(params)
			})
			.then(response => response.json())
			.then(data => {
				for(var i=0;i<data.rv.length;i++) {
					users.innerHTML += "<ul id='reserv-box'><li>"+data.rv[i].reservno+"</li><li>"+data.rv[i].userid+"</li><li>"+data.rv[i].roomno+"</li><li>"+data.rv[i].reservdate.substring(0,10)+"</li><li>"+data.rv[i].reservenddate.substring(0,10)+"</li><li>"+data.rv[i].usercnt+"</li><li>"+data.rv[i].request+"</li><li><a href='#' onclick="+`deleteReserv("`+data.rv[i].reservno+`")`+">삭제</a></li></ul>";
				}
				for(var i=data.pvo.startPageNum; i<data.pvo.startPageNum+data.pvo.onePageCount;i++) {
					if(i==data.pvo.startPageNum) {
						if(data.pvo.nowPage == 1) document.getElementById("page-box").innerHTML += `<li>◀</li>`;
						else document.getElementById("page-box").innerHTML += `<li onclick="adminReservList(`+(data.pvo.nowPage-1)+`)">◀</li>`;
					}
					if(i<=data.pvo.totalPage) {
						if(i==data.pvo.nowPage)document.getElementById("page-box").innerHTML+=`<li style='color:blue' onclick="adminReservList(`+i+`)">`+i+`</li>`;
						else document.getElementById("page-box").innerHTML+=`<li onclick="adminReservList(`+i+`)">`+i+`</li>`;
					}
				}
				if(data.pvo.nowPage == data.pvo.totalPage) document.getElementById("page-box").innerHTML += `<li>▶</li>`;
				else document.getElementById("page-box").innerHTML += `<li onclick="adminReservList(`+(data.pvo.nowPage+1)+`)">▶</li>`;
			}).catch(err=> {
				console.log(err);
			});
		}
		function deleteReserv(reservno){
			fetch("/admin/delete/reserv",{
				method:"POST",
				headers:{
					"Content-Type":"text/plain",
				},
				body:reservno
			})
			.then(response => response)
			.then(data=>{

			}).catch(err=> {
				console.log(err);
			});
		}
		function doSearch(){
			if(tag=="user") {
				searchKey=document.getElementById("searchKey").value;
				searchWord=document.getElementById("searchWord").value;
				adminUserList(1);
			}
			else if(tag=="reserv"){
				searchKey=document.getElementById("searchKey").value;
				searchWord=document.getElementById("searchWord").value;
				adminReservList(1);
			}
			else {
				alert("목록을 선택하세요");
			}
			return false;
		}
		document.addEventListener('DOMContentLoaded', () => {
			const search_form = document.getElementById("adm-srch");
			search_form.addEventListener("submit", (event) => {
				  event.preventDefault();
			});
		});
		
		function adminReviewList(page) {
			tag="review";
			document.getElementById("page-box").innerHTML="";
			/* let users = document.getElementById("users"); */
			users.innerHTML = `<ul id='review-box'><li>
				reviewno
				</li>
				<li>
					subject
				</li>
				<li>
					content
				</li>
				<li>
					roomno
				</li>
				<li>
					rating
				</li>
				<li>
					userid
				</li>
				<li>
					writedate
				</li>
				<li>
					삭제
				</li></ul>`;
				
				document.getElementById("page-box").innerHTML = "";
				var params;
				if(searchKey!="" && searchWord!="") {
					params ={
							nowPage:page,
							searchKey:searchKey,
							searchWord:searchWord
					};
				} else {
					params ={
						nowPage:page
					};
				}
				fetch("/admin/review",{
					method:"POST",
					headers:{
						"Content-Type":"application/json",
					},
					body:JSON.stringify(params)
				})
				.then(response => {
					if(!response.ok){
						throw new Error('Network response was not ok');
					}
					return response.json();
				})
				.then(data => {
					//console.log(data);
					for(var i=0;i<data.rv.length;i++) {
						users.innerHTML += "<ul id='review-box'><li>" + data.rv[i].reviewno + "</li><li>" + data.rv[i].subject + "</li><li>" + data.rv[i].content.substring(0,10) + "</li><li>" + data.rv[i].roomno + "</li><li>" + data.rv[i].rating + "</li><li>" + data.rv[i].userid.substring(0,10) + "</li><li>" + data.rv[i].writedate} + "</li><li><a href='#' onclick='deleteReview(" + data.rv[i].reviewno + ")'>삭제</a></li></ul>";
					}
					for(var i=data.pvo.startPageNum; i<data.pvo.startPageNum+data.pvo.onePageCount;i++) {
						if(i==data.pvo.startPageNum) {
							if(data.pvo.nowPage == 1) document.getElementById("page-box").innerHTML += `<li>◀</li>`;
							else document.getElementById("page-box").innerHTML += `<li onclick="adminReviewList(`+(data.pvo.nowPage-1)+`)">◀</li>`;
						}
						if(i<=data.pvo.totalPage) {
							if(i==data.pvo.nowPage)document.getElementById("page-box").innerHTML+=`<li style='color:blue' onclick="adminReviewList(`+i+`)">`+i+`</li>`;
							else document.getElementById("page-box").innerHTML+=`<li onclick="adminReviewList(`+i+`)">`+i+`</li>`;
						}
					}
					if(data.pvo.nowPage == data.pvo.totalPage) document.getElementById("page-box").innerHTML += `<li>▶</li>`;
					else document.getElementById("page-box").innerHTML += `<li onclick="adminReviewList(`+(data.pvo.nowPage+1)+`)">▶</li>`;
				}).catch(err=> {
					console.log(err);
				});
		}
		function deleteReview(reviewno) {
			fetch("/admin/delete/review", {
				method: "POST",
				headers: {
					"Content-Type": "text/plain",
				},
				body:reviewno
			})
			.then(response => response)
			.then(data => {
				
			}).catch(err => {
				console.log(err);
			});
		}
	</script>
</head>
<body>
	<h1>Admin Page</h1>
	<a id="logout-title" href="${pageContext.request.contextPath}/user/logout">Logout</a>
	<div class="admin-search">
		<form id="adm-srch" onsubmit="doSearch()">
			<select id="searchKey" name="searchKey">
				<option value="userid">아이디</option>
			</select>
			<input id="searchWord" type="text" name="searchWord">
			<input type="button" onclick="doSearch()" value="검색">
		</form>
	</div>
	<div class="admin-container">
		<div class="admin-list">
			<ul>
				<li>
					<a onclick="adminUserList(1)" href="#">회원 조회</a>
				</li>
				<li>
					<a onclick="adminReservList(1)" href="#">예약 조회</a>
				</li>
				<li>
					<a onclick="adminReviewList(1)" href="#">리뷰 조회</a>
				</li>
			</ul>
		</div>
		<div class="admin-contents">
			<div id="users"></div>
			<ul id="page-box">
			</ul>
		</div>
	</div>
</body>
</html>