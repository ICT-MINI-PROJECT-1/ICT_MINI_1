<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	document.addEventListener('DOMContentLoaded', () => {
		mini_msg = document.getElementById("mini-msg");
		counting(3);
	});
	let mini_msg;
	function counting(time){
		if(time == 0) {
			location.href="/";
		}
		else mini_msg.innerHTML = time-- + "초후 메인페이지로 이동합니다 . . .";
		setTimeout(()=>{counting(time)}, 1000);
	}
</script>

<div id="fade">
<div class="container">
	<div class="notice-wrap">
		<div class="notice-img"><img width=200 height=200 src="${pageContext.request.contextPath }/img/artpart_logo.png"/></div>
		<div class="notice-msg">
			${msg}
		</div>
		<div id="mini-msg">3초후 메인페이지로 이동합니다 . . .</div>
	</div>
</div>
</div>