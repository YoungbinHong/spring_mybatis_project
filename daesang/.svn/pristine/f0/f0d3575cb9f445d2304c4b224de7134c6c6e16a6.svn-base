var App = function() {

	var path = window.location.pathname;
		path = path.replace(/\/$/, "");
		path = decodeURIComponent(path);
	var sct = $(window).scrollTop();

	var uiInit = function() {

		// 브라우저 및 버전을 구하기 위한 변수들.
	    'use strict';
	    var agent = navigator.userAgent.toLowerCase(),
	        name = navigator.appName,
	        browser,
	        os = '';
	    
	    // MS 계열 브라우저를 구분하기 위함.
	    if(name === 'Microsoft Internet Explorer' || agent.indexOf('trident') > -1 || agent.indexOf('edge/') > -1) {
	        browser = 'ie';
	    } else if(agent.indexOf('safari') > -1) { // Chrome or Safari
	        if(agent.indexOf('opr') > -1) { // Opera
	            browser = 'opera';
	        } else if(agent.indexOf('chrome') > -1) { // Chrome
	            browser = 'chrome';
	        } else { // Safari
	            browser = 'safari';
	        }
	    } else if(agent.indexOf('firefox') > -1) { // Firefox
	        browser = 'firefox';
	    }

	    // Mac OS
	    if (navigator.userAgent.indexOf('Mac OS X') > -1) {
	    	os = 'mac'
	    }

	    // IE: ie7~ie11, Edge: edge, Chrome: chrome, Firefox: firefox, Safari: safari, Opera: opera
	    document.getElementsByTagName('html')[0].className = browser;
	    document.getElementsByTagName('body')[0].className = os;

		if( /Android/i.test(navigator.userAgent)) {
		    // 안드로이드
		    $("body").addClass("android");
		} else if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
		    // iOS 아이폰, 아이패드, 아이팟
		    $("body").addClass("ios");
		}

	    // 파일업로드
		var fileTarget = $('.filebox .upload-hidden');
		fileTarget.on('change', function(){ // 값이 변경되면
			if(window.FileReader){ // modern browser
				var filename = $(this)[0].files[0].name;
			} else { // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 } // 추출한 파일명 삽입
			}
			$(this).siblings('.upload-name').val(filename);
		});

		$( ".datepicker" ).datepicker({
			dateFormat:"yy-mm-dd",
			dayNamesMin:["일","월","화","수","목","금","토"],
			monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
		});

		// 내비게이션
		$('#nav .menu_depth1 > ul > li.arw').on('mouseenter focusin',function(){
			$(this).find('.menu_depth2').stop().slideDown();
		});
		$('#nav .menu_depth1 > ul > li.arw').on('mouseleave focusout',function(){
			$(this).find('.menu_depth2').stop().slideUp();
		});

		// 팝업 확인버튼
		$('.btn_confirm').click(function(e){
			e.preventDefault();
			$('.btn_close').click();
		});

		// 모바일메뉴
		$(".btn_menu").click(function(e){
			e.preventDefault();
			$(".layer_bg").fadeIn();
			$("#mNav").stop().animate({
				right:0
			});
		});
		$("#mNav #mMenu > ul > li.arr").click(function(e){
			e.preventDefault();
			$(this).toggleClass("active");
			$(this).find("ul").slideToggle();
		});
		$(".layer_bg, #mNav .m_close").click(function(e){
			e.preventDefault();
			$(".layer_bg").fadeOut(500,function(){
				$("#mNav #mMenu > ul > li.arr").removeClass("active");
				$("#mNav #mMenu > ul > li.arr ul").slideUp();
			});
			$("#mNav").stop().animate({
				right:"-300px"
			});
		});

		$(window).scroll(function(){
			sct = $(window).scrollTop();
			var navTop = $(".nav_top").outerHeight(true);

			if(sct >= navTop){
				$(".nav_bottom").css({
					position:'fixed'
				});
				$("#container").addClass("fixed");
			}else {
				$(".nav_bottom").css({
					position:'relative'
				});
				$("#container").removeClass("fixed");
			}

		});
	};

	/* Gets window width cross browser */
    var getWindowWidth = function(){
        return window.innerWidth
                || document.documentElement.clientWidth
                || document.body.clientWidth;
    };

	var handleNav = function() {
		
	};

	return {
        init: function() {
            uiInit(); // Initialize UI Code
        }
    };
}();

$(function(){
	App.init();
});

// 팝업 디폴트
function openPopup(popup){
	$(popup).bPopup({
        closeClass: 'btn_close',
        opacity: 0.53,
        position: ['auto','auto'] //x, y
    });
}
function smoothScroll(){

	$(document).SmoothScrollWheel({
		debug: false,
		defaultDetailDelta: 3,
		defaultWheelDelta: 120,
		defaultSpeed: 240,
		defaultAnimationTime: 700
	});
}