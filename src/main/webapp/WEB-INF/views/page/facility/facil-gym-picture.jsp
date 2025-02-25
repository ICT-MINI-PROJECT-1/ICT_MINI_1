<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/css/page/facility.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/facility.js"></script>

<style>

    #container {
    	position:absolute;
    	left:26%;
    	top:140px;
        width:900px;
        height:60vh;
        margin:15px;     
    }
    
    #text{
    	position:absolute;
    	top:180px;
    	left:10%;
    	font-family:"Cormorant Garamond", serif;
   		height:5vh;
   		margin:3%;
   		color:gray;
   		text-shadow: 5px 5px 10px rgba(0, 0, 0, 0.6);
    }

    .SliderBox {
    	flex-shrink: 0;
        width: 100%;
        margin: 0px auto;
        overflow: hidden;/* 슬라이더 밖의 이미지 숨기기 */
        position: relative; /* 버튼을 위치시키기 위해 사용 */
        
    }

    /* 슬라이더의 이미지들 */
    #slider {
    	flex-shrink: 0;
    	width:1550px;
        display: flex;
        transition: transform 0.5s ease; /* 슬라이드 이동 부드럽게 하기 */
    }

    #slider img {
    	margin-top:1%;
    	width:100%;
        height: auto;
        box-shadow:10px 10px 15px  rgba(0, 0, 0, 0.1); 
    }

    /* 좌우 슬라이드 버튼 */
    .prev, .next {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background-color: rgba(0, 0, 0, 0.2);
        color: white;
        border: 1px solid black;
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
    
    #line{
    	position:absolute;
    	bottom:600px;
    	left:600px;
    	align-items: center;
   	    justify-content: center;
    	line-height: 30px;
   	    text-align: left;
    	margin-left:10%;
    	width:40%;
    	background-color:gray;
    }
   
     @media (max-width: 1250px) {
        #container {
            width: 800px;
        }

        .SliderBox {
            width: 100%;
        }

        #slider {
            width: auto;
        }

        #slider img {
            width: 50%;
          
        }

        .prev, .next {
            padding: 10px;
        }
         #text,#text2{
         	font-size : 20px;
         }
  	  }	
    	@media (max-width:1050px){
    		#container {
    		width:600px;
    	}

        .SliderBox {
            width: 100%;
        }

        #slider {
            width: auto;
        }

        #slider img {
            width: 50%;
          
        }

        .prev, .next {
            padding: 10px;
        }
         #text,#text2{
         	font-size : 20px;
         }
    }
    
    	@media (max-width:950px) {
        #content ul {
         	font-size: 14px;
         }
      }
    
       @media (max-width:700px) {
        #container {
            width: 420px;
        }
        #text{
        	writing-mode: vertical-lr;
    		text-orientation: upright;
        }

        .SliderBox {
            width: 100%;
        }

        #slider {
            width: auto;
        }

        #slider img {
            width: 50%;
          
        }

        .prev, .next {
            padding: 10px;
        }
         #text,#text2{
         	font-size : 20px;
         }
    }
    
    
    #content ul {
	    display: flex;
	    list-style: none;
	    padding: 0;
	    margin: 0;
	    justify-content: center;
	}
	
	#content li {
	    display: flex;  
	    flex-direction: column; 
	    align-items: center;
	    justify-content: center;
	    border: 1px solid #ccc;
	    padding: 10px;
	    margin: 10px;
	    width: 25%;
	    line-height:30px;
	    text-align: center;
	    font-family: 'Gowun Batang';
	}
	
	#type1 {
		font-weight: bold;
	}
	
	#titleName {
		text-align:center;
		font-family: 'Gowun Batang';
	}
	

</style>

<div id="fade">
<h1 id="text">Gym</h1>
    <div id="container">
        <div class="SliderBox" id="sliderContainer">
            <div id="slider">
            	 <img src="${pageContext.request.contextPath}/img/page/facility/gym.png" />
           	 <img src="${pageContext.request.contextPath}/img/page/facility/gym2.png" />
           	 <img src="${pageContext.request.contextPath}/img/page/facility/gym3.png"/>
                 <img src="${pageContext.request.contextPath}/img/page/facility/gym4.png"/>
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
            		<li><div id="type1">타입</div><div>헬스장</div></li>
            		<li><div id="type1">위치</div><div>7F</div></li>
            		<li><div id="type1">이용시간</div><div>06:30~22:00</div></li>
            		<li><div id="type1">문의안내</div><div>02-0000-0000</div></li>
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


