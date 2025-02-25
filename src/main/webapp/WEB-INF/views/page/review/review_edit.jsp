<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/page/review.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/review.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/ckeditor/ckeditor.css"/>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/super-build/ckeditor.js"></script>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script>
	const dataTransfer = new DataTransfer();
	
     document.addEventListener('DOMContentLoaded', () => {
    	 fileOk=1;
    	 subjectOk = 1;
    	 contentOk = 1;
    	 document.getElementById("fie").addEventListener("change", (e) => {
   		  let fileArr = document.getElementById("fie").files;

   	        if(fileArr != null && fileArr.length>0){

   	          // =====DataTransfer 파일 관리========
   	            for(var i=0; i<fileArr.length; i++){
   	                dataTransfer.items.add(fileArr[i])
   	            }
   	            document.getElementById("fie").files = dataTransfer.files;
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
			<form method="post" action="${pageContext.request.contextPath }/page/review/editOk" id="review-write-form" name="writeForm" enctype="multipart/form-data">
				<input type="hidden" name="reviewno" value="${vo.reviewno }"/>
				<div id="write-title">Review Edit</div>
				<div id="write-username">
					<div>${vo.userid }</div>
				</div>
				<div id="write-writedate-hit">
					<div id="form-writedate">${vo.writedate }</div>
				</div>
				<div id="write-roomno-rating">
					<div id="form-roomno">호수<input type="text" name="roomno" id="roomno" value="${vo.roomno }" readonly></div>
					<div id="form-rating">평점&nbsp;&nbsp;
					<input type="hidden" name="rating" id="rating" value="${vo.rating }"></div>
					<p style="padding:0; margin:0;">
            <span class='star-rating' style="cursor:pointer;">
            <span id="star-do" style="width:${vo.rating*20}%;"></span>
            </span>
            <span id="star-rt" style="display:inline-block;text-align:center;width:30px;">${vo.rating}</span>
          </p>
				</div>
				<div id="form-subject">
					<div id="form-subject-div">제목</div>
					<input type="text" name="subject" id="write-subject" value="${vo.subject }"><div id="alert-subject"></div>
				</div>
				<textarea name="content" id="write-content">${vo.content }</textarea><div id="alert-content"></div>
				<div id="upload-review-img">
					<div>
						<input type="file" name="mf" id="fie" onchange="addFile(this)" multiple>
					</div>
					<div id="upload-filename">
						<c:forEach var="vo" items="${imgVO}">
							<div>${vo.filename }</div>
						</c:forEach>
						<div id="alert-file"></div>
					</div>
				</div>
				<input type="button" value="수정하기" id="write-submit" onclick="writeChk()">
			</form>
		</div>
	</div>
</div><!-- container 끝 -->
</div>