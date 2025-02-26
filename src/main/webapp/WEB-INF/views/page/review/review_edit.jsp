<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/css/page/review.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/review.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/ckeditor/ckeditor.css"/>
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/super-build/ckeditor.js"></script>
<script src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script>
const dataTransfer = new DataTransfer();
const minFileCnt = 1;
const maxFileCnt = 5;	//첨부파일 최대 개수

where="review_edit";
fileOk=1;

const handler = {
        init() {
            const fileInput = document.querySelector('#fie');
            const preview = document.querySelector('#preview');
            fileInput.addEventListener('change', () => {
            	addFile();
                const files = Array.from(fileInput.files);
                files.forEach(file => {
                    preview.innerHTML += `
                    <p id="`+file.lastModified+`">
                        `+file.name+`
                        <button type='button' data-index="`+file.lastModified+`" class='file-remove'>X</button>
                    </p>`;
                    dataTransfer.items.add(file);
                });
                fileInput.files = dataTransfer.files;
                let alert_file = document.getElementById("alert-file");
            	
            	var curFileCnt = dataTransfer.files.length; //현재 선택된 첨부파일 개수
            	console.log(curFileCnt+"!!");
            	if(curFileCnt<minFileCnt || curFileCnt>maxFileCnt){
            		alert_file.innerHTML = "파일을 1-5개 넣어주세요.";
            		alert_file.style.opacity = 1;
            		fileOk = 0;
            	}else{
            		alert_file.style.opacity = 0;
            		fileOk = 1;
            	}
            });
        },
        
        removeFile: () => {
            document.addEventListener('click', (e) => {
            addFile();
            if(e.target.className !== 'file-remove') return;
            const removeTargetId = e.target.dataset.index;
            const removeTarget = document.getElementById(removeTargetId);
            const files = document.querySelector('#fie').files;
            const dataTranster = new DataTransfer();
        
            Array.from(files)
                .forEach(file => {
                if(file.lastModified == removeTargetId) dataTransfer.items.remove(file);
                else dataTranster.items.add(file);
             });

            document.querySelector('#fie').files = dataTranster.files;
			
            removeTarget.remove();
            let alert_file = document.getElementById("alert-file");
        	
        	var curFileCnt = dataTransfer.files.length; //현재 선택된 첨부파일 개수
        	console.log(curFileCnt+"!!");
        	if((curFileCnt<minFileCnt || curFileCnt>maxFileCnt) && curFileCnt!=0){
        		alert_file.innerHTML = "파일을 1-5개 넣어주세요.";
        		alert_file.style.opacity = 1;
        		fileOk = 0;
        	}else{
        		alert_file.style.opacity = 0;
        		fileOk = 1;
        	}
        })
        }
    }
	document.addEventListener('DOMContentLoaded', () => {
	 subjectOk=1;
	 contentOk=1;
	 /*
	 document.getElementById("fie").addEventListener("change", (e) => {
		  let fileArr = document.getElementById("fie").files;

	        if(fileArr != null && fileArr.length>0){

	          // =====DataTransfer 파일 관리========
	            for(var i=0; i<fileArr.length; i++){
	                dataTransfer.items.add(fileArr[i])
	            }
	            document.getElementById("fie").files = dataTransfer.files;
	        }
		});*/
		handler.init();
   	handler.removeFile();
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
				<!-- 
				<div id="form-subject">
					<div id="form-subject-div">제목</div>
					<input type="text" name="subject" id="write-subject" value="${vo.subject }">
				</div>
				<div id="form-subject">
					<div id="form-subject-div"></div>
					<div id="alert-subject"></div>
				</div>
				-->
				<div id="form-subject">
					<input type="text" name="subject" id="write-subject" value="test" placeholder="제목을 입력해 주세요">
				</div>
				<div id="alert-subject"></div>
				<textarea name="content" id="write-content">${vo.content }</textarea><div id="alert-content"></div>
				<div id="upload-review-img">
					<label class="input-file-button" for="fie">
					    사진 첨부
					</label>
						<input type="file" style="display:none;" name="mf" id="fie" onchange="addFile()" multiple><div id="alert-file"></div>
					</div>
					<div id="preview"></div>
				<div id="upload-filename">
				<div>기존 파일 리스트</div>
				<c:forEach var="vo" items="${imgVO}">
						<div>${vo.filename }</div>
					</c:forEach></div>
				<input type="button" value="수정하기" id="write-submit" onclick="writeChk()">
			</form>
		</div>
	</div>
</div><!-- container 끝 -->
</div>