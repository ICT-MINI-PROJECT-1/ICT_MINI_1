function moveToRoom(loc) {
	let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '../page/room/list');
    document.body.appendChild(f);
	
	let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'loc');
    obj.setAttribute('value', loc);
	f.appendChild(obj);
    f.submit();
}

function moveReserv(loc) {
	if(loc=="") {
		location.href="/page/reservation/form";
	}
}


document.addEventListener('DOMContentLoaded', function() {
    const mypageNav = document.querySelector('.mypage-nav');

    if (mypageNav) {
        mypageNav.style.transition = 'none';
        mypageNav.style.zIndex = '1000';

        let lastScrollY = 0;

        window.addEventListener('scroll', (e) => {
            let curScrollY = window.scrollY;
            console.log('scroll event');
            console.log('curScrollY:', curScrollY);
            console.log('mypageNav:', mypageNav);

            if (lastScrollY < curScrollY) {
                if (curScrollY >= 15) {
                	document.querySelector(".mypage-nav ul").style.flexDirection = "column";
                    mypageNav.style.position = 'fixed';
			        mypageNav.style.right = '3%';
			        mypageNav.style.top = '37%';
			        mypageNav.style.width = '150px'; // 너비 조정
			        mypageNav.style.height = 'auto'; // 높이 자동 조정
                    console.log('mypageNav fixed');
                    console.log('mypageNav.style.position:', mypageNav.style.position);
                }
            } else {
                if (curScrollY <= 80) {
                document.querySelector(".mypage-nav ul").style.flexDirection = "row";
                    mypageNav.style.position = 'relative';
                    mypageNav.style.right = 'auto';
                    mypageNav.style.top = '0';
                    mypageNav.style.width = '100%';
                    mypageNav.style.height = 'auto';
                    console.log('mypageNav relative');
                    console.log('mypageNav.style.position:', mypageNav.style.position);
                }
            }

            lastScrollY = curScrollY;
        });
    } else {
        console.error('mypage-nav element not found');
    }

    console.log('scroll listener attached');
});