var gall = setInterval(galleryFun, 2000);
var inter = true;
var idx = 2;

function galleryFun() {

    $(".gallery ul").animate({
        "left": -300 * idx + "px"
    }, 300);
    $(".g_item ul li").eq(idx - 1).addClass("on").siblings().removeClass("on");
    idx++;
    if (idx > $(".gallery ul li").length - 3) {
        $(".gallery ul").animate({
            "left": 0
        }, 0);
        idx = 0;

    }
}


$(".gallery , .g_item").hover(function () {
    if (inter == true) {
        clearInterval(gall);
        inter = false;
    }
}, function () {
    if (inter == false) {
        gall = setInterval(galleryFun, 2000);
        inter = true;
    }

});


$(".g_item ul li").on('click', function () {
    $(this).addClass("on").siblings().removeClass("on");
    idx = $(this).index() + 1;
    $(".gallery ul").animate({
        "left": -300 * idx + "px"
    }, 1000);

});

/*flow_banner js*/

$(window).on('load', function () {
    setFlowBanner();
})

function setFlowBanner() {
    const $wrap = $('.flow_banner');
    const $list = $('.flow_banner .list');
    let wrapWidth = ''; //$wrap의 가로 크기
    let listWidth = ''; //$list의 가로 크기
    const speed = 50; //1초에 몇픽셀 이동하는지 설정

    //리스트 복제
    let $clone = $list.clone();
    $wrap.append($clone);
    flowBannerAct()

    //반응형 :: 디바이스가 변경 될 때마다 배너 롤링 초기화
    let oldWChk = window.innerWidth > 1279 ? 'pc' : window.innerWidth > 767 ? 'ta' : 'mo';
    $(window).on('resize', function () {
        let newWChk = window.innerWidth > 1279 ? 'pc' : window.innerWidth > 767 ? 'ta' : 'mo';
        if (newWChk != oldWChk) {
            oldWChk = newWChk;
            flowBannerAct();
        }
    });

    //배너 실행 함수
    function flowBannerAct() {
        //배너 롤링 초기화
        if (wrapWidth != '') {
            $wrap.find('.list').css({'animation': 'none'});
            $wrap.find('.list').slice(2).remove();
        }
        wrapWidth = $wrap.width();
        listWidth = $list.width();

        //무한 반복을 위해 리스트를 복제 후 배너에 추가
        if (listWidth < wrapWidth) {
            const listCount = Math.ceil(wrapWidth * 2 / listWidth);
            for (let i = 2; i < listCount; i++) {
                $clone = $clone.clone();
                $wrap.append($clone);
            }
        }
        $wrap.find('.list').css({'animation': `${listWidth / speed}s linear infinite flowRolling`});
    }
}