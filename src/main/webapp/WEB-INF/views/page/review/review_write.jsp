<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/page/review.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/review.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/ckeditor/ckeditor.css"/>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/super-build/ckeditor.js"></script>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script>
	const dataTransfer = new DataTransfer();
	
     document.addEventListener('DOMContentLoaded', () => {
    	 document.getElementById("filename").addEventListener("change", (e) => {
   		  let fileArr = document.getElementById("filename").files;

   	        if(fileArr != null && fileArr.length>0){

   	          // =====DataTransfer 파일 관리========
   	            for(var i=0; i<fileArr.length; i++){
   	                dataTransfer.items.add(fileArr[i])
   	            }
   	            document.getElementById("filename").files = dataTransfer.files;
   	        }
   		});
    	 let sr=document.getElementsByClassName("star-rating")[0];
    		sr.addEventListener("click", (e) => {
    		let t=e.clientX - sr.getBoundingClientRect().left;
    		let tt=(100*(t/88));
    		for(var i=1;i<=10;i++){
    			if(tt>=10*(i-1) && tt<=10*i) {
    				tt=10*i;
    				break;
    			}
    		}
    		document.getElementById("star-do").style.width=tt+"%";
    		document.getElementById("star-rt").innerHTML = (5*tt)/100;
    		document.getElementById("rating").value=(5*tt)/100;
    	 });
     });
</script>
<div id="fade">
<div class="container">
	<div class="review-write-wrap">
		<div id="write-box">
			<form method="post" action="${pageContext.request.contextPath }/page/review/writeOk" id="review-write-form" onsubmit="return writeFormCheck(event)" enctype="multipart/form-data">
				<div id="write-title">Review Write</div>
				<div id="write-username">
					<div>작성자 : ${loginName }</div>
				</div>
				<div id="write-writedate-hit">
					<div id="form-writedate">
						<script>
							let date = new Date();
							let year = date.getFullYear();
							let month = date.getMonth()+1;
							let day = date.getDate();
						
							document.getElementById("form-writedate").innerHTML = year+"-"+month+"-"+day;
						</script>
					</div>
				</div>
				<div id="write-roomno-rating">
					<div id="form-roomno">호수
					<select id="roomno" name="roomno">
					<c:forEach var="rVO"  items="${rVO}">
						<option value="${rVO.roomno }">${rVO.roomno}</option>
					</c:forEach>
					</select>
					</div>
					<div id="form-rating">평점&nbsp;&nbsp;
					<input type="hidden" name="rating" id="rating" value="4.5"></div>
					<p style="padding:0; margin:0;">
            <span class='star-rating' style="cursor:pointer;">
            <span id="star-do" style="width:90%;"></span>
            </span>
            <span id="star-rt" style="display:inline-block;text-align:center;width:30px;">4.5</span>
          </p>
				</div>
				<div id="form-subject">
					<input type="text" name="subject" id="write-subject" value="test" placeholder="제목을 입력해 주세요"><div id="alert-subject"></div>
				</div>
				<textarea name="content" id="write-content" placeholder="내용을 입력해 주세요">test</textarea><div id="alert-content"></div>
				<div id="upload-review-img">
					<input type="file" name="mf" id="filename" multiple><div id="alert-file"></div>
				</div>
				<input type="submit" value="작성완료" id="write-submit">
			</form>
		</div>
	</div>
</div><!-- container 끝 -->
</div>