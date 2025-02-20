<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/css/page/facility.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/facility.js"></script>

<style>
    #container {
        display: flex;
        width:85%;
        margin:10%;;
    }
    #text{
    	font-family:"Cormorant Garamond", serif;
   		border-bottom: 1px solid gray;
   		height:9%;
   		color:gray;
    }
    #text2{
    	font-family:"Cormorant Garamond", serif;
    	height:9%;
    	color:gray;
    	margin-top:26.5%;
    }

    .SliderBox {
        width: 80%;
        margin: 0px auto;
        overflow: hidden; /* 슬라이더 밖의 이미지 숨기기 */
        position: relative; /* 버튼을 위치시키기 위해 사용 */
        
    }

    /* 슬라이더의 이미지들 */
    #slider {
    	width:20%;
        display: flex;
        transition: transform 0.8s ease; /* 슬라이드 이동 부드럽게 하기 */
    }

    #slider img {
        
        height: auto;
        
        margin-right:10%;
        border:1px solid #7A7A7A;
        box-shadow:10px 10px 15px  rgba(0, 0, 0, 0.1); 
    }

    /* 좌우 슬라이드 버튼 */
    .prev, .next {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background-color: rgba(0, 0, 0, 0.2);
        color: yellow;
        border: none;
        border-radius: 20%;
        padding: 15px;
        cursor: pointer;
        z-index: 10;
    }

    .prev {
        left: 10px;
    }

    .next {
        right: 10px;
    }
</style>
<div id="fade">
<div id='container'>
<hr/>
    <h1 id="text">Pool</h1>
    <hr/>
    <div class="SliderBox">
        <div id="slider">
            <img src="${pageContext.request.contextPath}/img/page/facility/PoolMainSize.png" />
            <img src="${pageContext.request.contextPath}/img/page/facility/sauna2.png" />
            <img src="${pageContext.request.contextPath}/img/page/facility/sauna3.png"/>
            <img src="${pageContext.request.contextPath}/img/page/facility/sauna4.jpg"/>
            <img src="${pageContext.request.contextPath}/img/page/facility/sauna5.jpg"/>
            <img src="${pageContext.request.contextPath}/img/page/facility/sauna6.jpg"/>
            <img src="${pageContext.request.contextPath}/img/page/facility/sauna7.jpg"/>
        </div>
        <button class="prev" onclick="moveSlide(-1)">❮</button>
        <button class="next" onclick="moveSlide(1)">❯</button>
	    </div>
	    <hr/>
	    <h1 id="text2">1F</h1>
	</div>
</div>
<script>
    let currentIndex = 0;

    
    let slides;
    let totalSlides;

    
    function moveSlide(step) {
     	console.log(totalSlides);
        currentIndex += step;

        if (currentIndex >= 10) {
            currentIndex = 0;
        } else if (currentIndex < 0) {
            currentIndex = totalSlides - -2;
        }

        // 슬라이드 이동 (X축으로 이동)
        const slider = document.getElementById('slider');
        if (slider) {
            slider.style.transform = "translateX("+(-currentIndex)*84.7 +"%)"; // 슬라이드를 이동
            console.log(`Moved to slide` +currentIndex+ `, transform: `+slider.style.transform);
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        const slider = document.getElementById('slider');
        if (slider) {
            slides = slider.querySelectorAll('img');
            totalSlides = slides.length;
        }

        const prevButton = document.querySelector('.prev');
        const nextButton = document.querySelector('.next');

        if (prevButton) {
            prevButton.addEventListener('click', function() {
                moveSlide(-1); // 이전 슬라이드로
            });
        }

        if (nextButton) {
            nextButton.addEventListener('click', function() {
                moveSlide(1); // 다음 슬라이드로
            });
        }
    });
</script>
