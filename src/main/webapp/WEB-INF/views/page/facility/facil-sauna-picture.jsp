<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath}/css/page/facility.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/js/page/facility.js"></script>

<style>
    /* 슬라이더 전체 컨테이너 */
    #container {
        display: flex;
        widht:100%;
        margin:10%;;
    }
    #text{
    	font-family:"Cormorant Garamond", serif;
    }

    /* 슬라이더 박스 */
    .SliderBox {
        width: 80%;
        margin: 0px auto;
        overflow: hidden; /* 슬라이더 밖의 이미지 숨기기 */
        position: relative; /* 버튼을 위치시키기 위해 사용 */
    }

    /* 슬라이더의 이미지들 */
    .slider {
        display: flex;
        transition: transform 0.3s ease; /* 슬라이드 이동 부드럽게 하기 */
    }

    .slider img {
        width: 100%; /* 이미지를 슬라이드 영역에 맞게 크기 설정 */
        height: auto;
        margin-right:10px;
    }

    /* 좌우 슬라이드 버튼 */
    .prev, .next {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background-color: rgba(0, 0, 0, 0.5);
        color: white;
        border: none;
        padding: 10px;
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
<div id='container'>
<hr/>
    <h1 id="text">Spa & Sauna</h1>
    <div class="SliderBox">
        <!-- 이미지 슬라이더 -->
        <div class="slider" id="slider">
            <img src="${pageContext.request.contextPath}/img/page/facility/sauna.png" alt="Sauna 1" />
            <img src="${pageContext.request.contextPath}/img/page/facility/sauna2.png" alt="Sauna 2" />
            <img src="${pageContext.request.contextPath}/img/page/facility/sauna3.png" alt="Sauna 3" />
            <img src="${pageContext.request.contextPath}/img/page/facility/SaunaMain.jpg" alt="Sauna Main" />
        </div>

        <!-- 좌우 슬라이드 버튼 -->
        <button class="prev" onclick="moveSlide(-1)">❮</button>
        <button class="next" onclick="moveSlide(1)">❯</button>
	    </div>
	    <hr/>
	</div>

<script>
    // 현재 이미지 인덱스
    let currentIndex = 0;

    // 슬라이더 이미지들
    const slides = document.querySelectorAll('#slider img');
    const totalSlides = slides.length;

    // 슬라이드를 이동하는 함수
    function moveSlide(step) {
        // 현재 인덱스를 업데이트
        currentIndex += step;

        // 인덱스가 슬라이드 범위를 벗어나지 않도록 처리
        if (currentIndex >= totalSlides) {
            currentIndex = 0;
        } else if (currentIndex < 0) {
            currentIndex = totalSlides - 1;
        }

        // 슬라이드 이동 (X축으로 이동)
        const slider = document.getElementById('slider');
        slider.style.transform = `translateX(${-currentIndex * 100}%)`; // 슬라이드를 이동
    }
</script>

