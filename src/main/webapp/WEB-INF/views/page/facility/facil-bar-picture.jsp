<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/css/page/facility.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/facility.js"></script>


<div id="fade">
<h1 id="text">Lounge&Bar</h1>
    <div id="container">
        <div class="SliderBox" id="sliderContainer">
            <div id="slider">
            	 <img src="${pageContext.request.contextPath}/img/page/facility/bar1.jpg" />
           		 <img src="${pageContext.request.contextPath}/img/page/facility/bar4.jpg" />
           		 <img src="${pageContext.request.contextPath}/img/page/facility/bar3.jpg"/>
                 <img src="${pageContext.request.contextPath}/img/page/facility/bar2.jpg"/>
            </div>
          	  <button class="prev" onclick="moveSlide(-1)">❮</button>
      		  <button class="next" onclick="moveSlide(1)">❯</button>
            </div>
            <br/>
            <hr/>
            <div id="title">
            <h2 id="titleName">부대시설 개요</h2>
            <div id="content">
            	<ul>
            		<li><div id="type1">타입</div><div>라운지&바</div></li>
            		<li><div id="type1">위치</div><div>8F</div></li>
            		<li><div id="type1">이용시간</div><div>18:30~02:00</div></li>
            		<li><div id="type1">문의안내</div><div>02-3333-3333</div></li>
            	</ul>
            </div>
         </div>
	    </div>
</div>

<script>
    let currentIndex = 0;
    let slides;
    let totalSlides = 2;  // 사진 갯수

   
    function calculateMove() {
        const sliderContainer = document.querySelector('.SliderBox');
        if (sliderContainer) {
            
            const containerWidth = sliderContainer.offsetWidth;
            const move = containerWidth; 
            return move;
        }
        return 0;
    }

    function moveSlide(step) {
        const move = calculateMove(); 
        console.log('Move distance: ', move);

        currentIndex += step;

        if (currentIndex < 0) {
            currentIndex = 3;
        } else if (currentIndex >= totalSlides) {
            currentIndex = totalSlides - 1;
        }
        if (currentIndex > 3) {
            currentIndex = 0;
        }

        // 슬라이드 이동 (X축으로 이동)
        const slider = document.getElementById('slider');
        if (slider) {
            slider.style.transition = 'transform 0.4s ease';
            slider.style.transform = "translateX(" + (-currentIndex * move)/2 + "px)"; 
            console.log(`Moved to slide ${currentIndex}, transform: ${slider.style.transform}`);
        }
    }

    
    document.addEventListener("DOMContentLoaded", function() {
        const slider = document.getElementById('slider');
        if (slider) {
            slides = slider.querySelectorAll('img');
            totalSlides = slides.length * 2;  
        }

        const prevButton = document.querySelector('.prev');
        const nextButton = document.querySelector('.next');

        let isSliding = false; 

        // 슬라이드 중복 실행 방지 처리
        function disableButtonsTemporarily() {
            // 버튼 비활성화
            isSliding = true;

            // 슬라이드가 완료된 후에 버튼을 다시 활성화
            setTimeout(function() {
                isSliding = false;
            }, 10); 
        }

       
        if (prevButton) {
            prevButton.addEventListener('click', function(event) {
                if (!isSliding) {  
                    event.stopImmediatePropagation(); 
                    disableButtonsTemporarily();
                    moveSlide(-1); // 이전 슬라이드로
                }
            });
        }

        
        if (nextButton) {
            nextButton.addEventListener('click', function(event) {
                if (!isSliding) {  
                    event.stopImmediatePropagation(); 
                    disableButtonsTemporarily();
                    moveSlide(1); // 다음 슬라이드로
                }
            });
        }

        // 창 크기 변경 시 이동 거리 재계산
        window.addEventListener('resize', function() {
            calculateMove();
        });
    });
</script>