<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<meta name="description" content="" />
	<meta property="og:title" content="" />
	<meta property="og:url" content="" />
	<meta property="og:image" content="" />
	<meta property="og:description" content="" />

	<link rel="shortcut icon" type="image/x-icon" href="">
	<link rel="stylesheet" href="css/swiper.min.css" />
	<link rel="stylesheet" href="css/animate.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<link rel="stylesheet" href="css/common.css" />
	
	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/swiper.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script src="js/inewsticker.js"></script>
	<!-- <script src="js/common.js"></script> -->
	<script src="js/ui.js"></script>
	<!--[if (gte IE 6)&(lte IE 8)]><script type="text/javascript" src="js/selectivizr-min.js"></script><![endif]-->
	<!--[if lt IE 9]><script src="js/html5shiv.js"></script><![endif]-->
	<!--[if lt IE 10]><script src="js/placeholders.min.js"></script><![endif]-->
	<title>대상웰라이프</title>
</head>
<body>
<div id="wrap">
	<div id="header">
		<div class="header_top">
			<div class="content_inner clearfix">
				<ul class="util clearfix">
					<li><a href="#">마이페이지</a></li>
					<li><a href="#">로그아웃</a></li>
					<li><a href="#">커뮤니티</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>
		</div>
		<div class="header_bottom">
			<div class="content_inner clearfix">
				<div id="nav">
					<h1><a href="index.xml"><img src="images/logo.png" alt="대상 Wellife" /></a></h1>
					<ul class="clearfix">
						<li><a href="#">NEW</a></li>
						<li><a href="#">BEST</a></li>
						<li><a href="#">기능별</a></li>
						<li><a href="#">성분별</a></li>
						<li><a href="#">대상별</a></li>
						<li><a href="#">브랜드별</a></li>
					</ul>
				</div>
				<div class="nav_quick clearfix">
					<a href="sample.xml" class="btn_sample"><img src="images/btn_sample.png" alt="" /></a>
					<a href="#" class="btn_search"><img src="images/ico_search.png" alt="" /></a>
					<div class="quick_btn">
						<div class="swiper-button-prev"></div>
						<!-- If we need pagination -->
						<div class="swiper-pagination"></div>
						<!-- If we need navigation buttons -->
					    <div class="swiper-button-next"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="container">
		<div class="visual">
			<div class="swiper-container">
			    <!-- Additional required wrapper -->
			    <div class="swiper-wrapper">
			        <!-- Slides -->
			        <div class="swiper-slide" style="background-image:url(images/visual.jpg);">
			        </div>
			        <div class="swiper-slide" style="background-image:url(images/visual2.jpg);">
			        </div>
			    </div>
			</div>
		</div>

		<div id="contentM">	
			<div class="wow_wrap">
				<div class="wow slideInLeft wow_left" data-wow-duration="1.5s">
					<img src="images/wow_left.png" alt="" />
				</div>
				<div class="wow slideInRight wow_right" data-wow-duration="1.5s">
					<img src="images/wow_right.jpg" alt="" />
				</div>
			</div>
			<div class="wow2_wrap">
				<div class="wow fadeInUp wow2_left" data-wow-duration="0.8s">
					<img src="images/wow2_left.png" alt="" />
				</div>
				<div class="wow fadeInUp wow2_right" data-wow-duration="0.8s" data-wow-delay="0.5s">
					<img src="images/wow2_right.png" alt="" />
				</div>
			</div>
			<div class="product_wrap">
				<div class="content_inner">
					<div class="title_wrap">
						<h2>NEW</h2>
						<a href="#" class="more">more</a>
					</div>
					<div class="product_list">
						<ul>
							<li class="wow fadeInUp" data-wow-duration="0.5s">
								<a href="detail.xml">
									<img src="images/product1.png" alt="">
								</a>
							</li>
							<li class="wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.5s">
								<a href="detail.xml">
									<img src="images/product2.png" alt="">
								</a>
							</li>
							<li class="wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1s">
								<a href="detail.xml">
									<img src="images/product3.png" alt="">
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="tab_wrap">
				<div class="tab">
					<ul>
						<li class="active"><a href="#">바나나</a></li>
						<li><a href="#">그레인</a></li>
					</ul>
				</div>
				<div class="tab_content_wrap">
					<div class="tab_content first banana">
						<div class="wow slideInLeft banana_left left_content" data-wow-duration="2s">
							<img src="images/banana_left.png" alt="" />
						</div>
						<div class="wow slideInRight banana_right right_content" data-wow-duration="2s">
							<img src="images/banana_right.png" alt="" />
						</div>
					</div>
					<div class="tab_content grain">
						<div class="wow slideInLeft grain_left left_content" data-wow-duration="2s">
							<img src="images/grain_left.png" alt="" />
						</div>
						<div class="wow slideInRight grain_right right_content" data-wow-duration="2s">
							<img src="images/grain_right.png" alt="" />
						</div>
					</div>
				</div>
			</div>
			<div class="product_wrap">
				<div class="content_inner">
					<div class="title_wrap">
						<h2>BEST</h2>
						<a href="#" class="more">more</a>
					</div>
					<div class="product_list">
						<ul>
							<li class="wow fadeInUp" data-wow-duration="0.5s">
								<a href="detail.xml">
									<img src="images/product4.png" alt="">
								</a>
							</li>
							<li class="wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.5s">
								<a href="detail.xml">
									<img src="images/product5.png" alt="">
								</a>
							</li>
							<li class="wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1s">
								<a href="detail.xml">
									<img src="images/product6.png" alt="">
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div><!-- 마이밀 End -->

		<div id="contentN">
			<div class="wow3_wrap">
				<div class="wow fadeInUp" data-wow-duration="1.5s" data-wow-delay="0.3s">
					<img src="images/wow3_top.png" alt="" />
				</div>
				<ul>
					<li class="wow fadeInUp" data-wow-duration="0.8s">
						<img src="images/wow3_img1.jpg" alt="">
					</li>
					<li class="wow fadeInUp" data-wow-duration="0.8s" data-wow-delay="0.3s">
						<img src="images/wow3_img2.jpg" alt="">
					</li>
					<li class="wow fadeInUp" data-wow-duration="0.8s" data-wow-delay="0.6s">
						<img src="images/wow3_img3.jpg" alt="">
					</li>
					<li class="wow fadeInUp" data-wow-duration="0.8s" data-wow-delay="0.9s">
						<img src="images/wow3_img4.jpg" alt="">
					</li>
				</ul>
			</div>
			<div class="product_wrap">
				<div class="content_inner">
					<div class="title_wrap">
						<h2>NEW</h2>
						<a href="#" class="more">more</a>
					</div>
					<div class="product_list">
						<ul>
							<li class="wow fadeInUp" data-wow-duration="0.5s">
								<a href="detail.xml">
									<img src="images/product2-1.png" alt="">
								</a>
							</li>
							<li class="wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.5s">
								<a href="detail.xml">
									<img src="images/product2-2.png" alt="">
								</a>
							</li>
							<li class="wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1s">
								<a href="detail.xml">
									<img src="images/product2-3.png" alt="">
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="tab_wrap">
				<div class="tab">
					<ul>
						<li class="active"><a href="#">일반 영양식</a></li>
						<li><a href="#">전문 영양식</a></li>
						<li><a href="#">영양 보충식</a></li>
						<li><a href="#">점도 증진제</a></li>
						<li><a href="#">영양 간식</a></li>
					</ul>
				</div>
				<div class="tab_content_wrap">
					<div class="tab_content first">
						<div class="wow slideInLeft newcare_left left_content" data-wow-duration="2s">
							<img src="images/newcare_left.png" alt="" />
						</div>
						<div class="wow slideInRight newcare_right right_content" data-wow-duration="2s">
							<img src="images/newcare_right.png" alt="" />
						</div>
					</div>
					<div class="tab_content">
						<div class="wow slideInLeft newcare_left left_content" data-wow-duration="2s">
							<img src="images/newcare_left.png" alt="" />
						</div>
						<div class="wow slideInRight newcare_right right_content" data-wow-duration="2s">
							<img src="images/newcare_right.png" alt="" />
						</div>
					</div>
					<div class="tab_content">
						<div class="wow slideInLeft newcare_left left_content" data-wow-duration="2s">
							<img src="images/newcare_left.png" alt="" />
						</div>
						<div class="wow slideInRight newcare_right right_content" data-wow-duration="2s">
							<img src="images/newcare_right.png" alt="" />
						</div>
					</div>
					<div class="tab_content">
						<div class="wow slideInLeft newcare_left left_content" data-wow-duration="2s">
							<img src="images/newcare_left.png" alt="" />
						</div>
						<div class="wow slideInRight newcare_right right_content" data-wow-duration="2s">
							<img src="images/newcare_right.png" alt="" />
						</div>
					</div>
					<div class="tab_content">
						<div class="wow slideInLeft newcare_left left_content" data-wow-duration="2s">
							<img src="images/newcare_left.png" alt="" />
						</div>
						<div class="wow slideInRight newcare_right right_content" data-wow-duration="2s">
							<img src="images/newcare_right.png" alt="" />
						</div>
					</div>
				</div>
			</div>
			<div class="product_wrap">
				<div class="content_inner">
					<div class="title_wrap">
						<h2>BEST</h2>
						<a href="#" class="more">more</a>
					</div>
					<div class="product_list">
						<ul>
							<li class="wow fadeInUp" data-wow-duration="0.5s">
								<a href="detail.xml">
									<img src="images/product2-4.png" alt="">
								</a>
							</li>
							<li class="wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.5s">
								<a href="detail.xml">
									<img src="images/product2-5.png" alt="">
								</a>
							</li>
							<li class="wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1s">
								<a href="detail.xml">
									<img src="images/product2-6.png" alt="">
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div><!-- 뉴케어 End -->

		<section class="line_notice">
			<div class="line_notice_left"></div>
			<div class="line_notice_right"></div>
			<div class="line_notice_bg clearfix">
				<div class="line_notice_bgl">
					<div class="line_notice_inner clearfix">
						<dl class="line_notice_inner_l clearfix">
							<dt>
								공지사항
							</dt>
							<dd>
								<ul class="news_result">
									<li>
										<a href="#">
											<p>웰라이프몰 개편 및 연간대행사 애드업 선정</p>
											<span>2019.05.25</span>
										</a>
									</li>
									<li>
										<a href="#">
											<p>웰라이프몰 개편 및 연간대행사 애드업 선정</p>
											<span>2019.05.25</span>
										</a>
									</li>
								</ul>
							</dd>
						</dl>
						<p class="line_notice_inner_r">
							<span><a href="javascript:void(0);" title="공지사항 더보기">더보기</a></span>
						</p>
					</div>
				</div>
				<div class="line_notice_bgr clearfix">
					<a href="javascript:void(0);">
						<p class="prom_ttl">대상웰라이프몰 5월 프로모션</p>
						<span class="btn_prom"><img src="images/ico_slide_down.png" alt="" role="button" /></span>
					</a>
				</div>
			</div>
		</section>
		<section class="main_prom_bnr">
			<div class="main_prom_bnr_swiper slider">
				<ul class="main_prom_bxslider">
					<li><img src="images/banner_slider1.jpg" alt=""></li>
					<li><img src="images/banner_slider2.jpg" alt=""></li>
					<li><img src="images/banner_slider3.jpg" alt=""></li>
					<li><img src="images/banner_slider1.jpg" alt=""></li>
					<li><img src="images/banner_slider2.jpg" alt=""></li>
					<li><img src="images/banner_slider3.jpg" alt=""></li>
				</ul>
				<div class="main_slider_controller">
					<div class="main_slider_controls"></div>
				</div>
			</div>
		</section>

		<div class="banner">
			<a href="#">
				<img src="images/banner.jpg" alt="" />
			</a>
		</div>
		<div class="product_wrap type2">
			<div class="content_inner">
				<div class="title_wrap">
					<h2>이달의 추천상품</h2>
					<a href="#" class="more">more</a>
				</div>
				<div class="product_list">
					<ul>
						<li class="wow fadeInUp" data-wow-duration="0.5s">
							<a href="#">
								<img src="images/product_x261_1.png" alt="">
							</a>
						</li>
						<li class="wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.5s">
							<a href="#">
								<img src="images/product_x261_2.png" alt="">
							</a>
						</li>
						<li class="wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1s">
							<a href="#">
								<img src="images/product_x261_3.png" alt="">
							</a>
						</li>
						<li class="wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="1.5s">
							<a href="#">
								<img src="images/product_x261_4.png" alt="">
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="cs_wrap">
			<img src="images/cs.png" alt="" />
		</div>
		<div class="insta_wrap">
			<img src="images/insta.png" alt="" />
		</div>
	</div>
	<div id="footer">
		<div class="content_inner">
			<img src="images/footer.jpg" alt="" />
		</div>
	</div>
	<div id="quickBox">
		<img src="images/quick_top.jpg" alt="" />
		<ul>
			<li><a href="#"><img src="images/quick_product1.jpg" alt=""></a></li>
			<li><a href="#"><img src="images/quick_product2.jpg" alt=""></a></li>
			<li><a href="#"><img src="images/quick_product3.jpg" alt=""></a></li>
		</ul>
		<div class="paging">
			<img src="images/quick_page.jpg" alt="" />
		</div>
		<div class="top_down">
			<a href="#" class="btn_top">TOP</a>
			<a href="#" class="btn_down">DOWN</a>
		</div>
	</div>
	<div id="chatBot"></div>
	<div id="channel">
		<img src="images/channel.png" alt="" />
	</div>
	<div id="popSearch">
		<div class="pop_top">
			<div class="pop_inner">
				<h1><img src="images/logo2.png" alt=""></h1>
				<div class="pop_search_wrap">
					<div class="img_search">
						<img src="images/img_search.jpg" alt="" />
					</div>
					<dl class="clearfix">
						<dt>이슈 키워드</dt>
						<dd>
							<ul>
								<li><a href="#">뉴케어</a></li>
								<li><a href="#">마이밀 핏</a></li>
								<li><a href="#">클로렐라</a></li>
								<li><a href="#">뉴케어 미니</a></li>
								<li><a href="#">구수한 맛</a></li>
								<li><a href="#">단호박 맛</a></li>
								<li><a href="#">당플랜</a></li>
								<li><a href="#">마이밀</a></li>
								<li><a href="#">뉴케어 오메가</a></li>
								<li><a href="#">바나나 맛</a></li>
							</ul>
						</dd>
					</dl>
				</div>
			</div>
		</div>
		<div class="pop_bottom">
			<div class="pop_inner">
				<h2>Smart Search</h2>
				<p>웰라이프몰만 스마트검색을 통해서 원하시는 상품을 쉽고 편하게 찾아보세요.</p>
				<div class="box_wrap">
					<div class="clearfix box_top">
						<div class="fl">
							<h3>성분별</h3>
							<div class="list">
								<a href="#" class="fl1">홍삼/산삼/녹욕</a>
								<a href="#" class="fl2">석류/레몬밤</a>
								<a href="#" class="fl3">표고/차가버섯</a>
								<a href="#" class="fl4">루테인/오메가3</a>
								<a href="#" class="fl5">콜라겐/코엔자임Q10</a>
								<a href="#" class="fl6">프로폴리스</a>
								<a href="#" class="fl7">아르기닌</a>
								<a href="#" class="fl8">비타민/미네랄</a>
								<a href="#" class="fl9">아세틸글루코사민</a>
							</div>
						</div>
						<div class="fr">
							<h3>대상별</h3>
							<div class="list">
								<a href="#" class="fr1"></a>
								<a href="#" class="fr2"></a>
								<a href="#" class="fr3"></a>
								<a href="#" class="fr4"></a>
								<a href="#" class="fr5"></a>
							</div>
						</div>
					</div>
					<div class="clearfix box_bottom">
						<div class="fl">
							<h3>기능별</h3>
							<div class="list">
								<a href="#" class="fl1"></a>
								<a href="#" class="fl2"></a>
								<a href="#" class="fl3"></a>
								<a href="#" class="fl4"></a>
								<a href="#" class="fl5"></a>
								<a href="#" class="fl6"></a>
								<a href="#" class="fl7"></a>
								<a href="#" class="fl8"></a>
								<a href="#" class="fl9"></a>
								<a href="#" class="fl10"></a>
								<a href="#" class="fl11"></a>
							</div>
						</div>
						<div class="fr">
							<h3>브랜드별</h3>
							<div class="list">
								<a href="#" class="fr1">뉴케어</a>
								<a href="#" class="fr2">마이밀</a>
								<a href="#" class="fr3">클로렐라</a>
								<a href="#" class="fr4">기타</a>
							</div>
						</div>
					</div>
				</div>
				<div class="btn_pop_search">
					<img src="images/btn_pop_search.png" alt="" />
				</div>
			</div>
		</div>
		<a href="#" class="btn_close"></a>
	</div>
</div>
<script>
$(document).ready(function(){

	// wow.js
	new WOW().init();

	// 공지사항 slide
    $('ul.news_result').inewsticker({
        speed        : 2500,
        effect          : 'slide',
        dir             : 'ltr',
        font_size   : 13,
        color           : '#fff',
        delay_after : 1000
    });

    // 프로모션 slide 
    var mpSlider = $('.main_prom_bxslider').bxSlider({
        onSlideAfter:function(currentSlideNumber, totalSlideQty, currentSlideHtmlObject){
            $('.active_slide').removeClass('active_slide');
            $('.main_prom_bxslider > li').eq(currentSlideHtmlObject + 1).addClass('active_slide')
        },
        onSliderLoad: function () {
            $('.main_prom_bxslider > li').eq(1).addClass('active_slide')
        },
        infiniteLoop:true,
        controls:true,
        auto:true,
        autoControls:true,
        autoControlsCombine:true,
        speed:500,
        autoHover:false,
    });

    $('.main_prom_bnr_swiper div.bx-viewport').append('<p class="bnr_swiper_left_mask"></p><p class="bnr_swiper_right_mask"></p>');

    var lineNotice = false;

    $('.line_notice_bgr a').click(function () {
      if (lineNotice == false) {
        $('.line_notice_bgr a span.btn_prom').find('img').attr('src', 'images/ico_slide_up.png');
        $('.main_prom_bnr').slideDown();
        $('body').animate({
          scrollTop: $('.line_notice_bgr').offset().top
        }, 1000);
        lineNotice = true;
        mpSlider.reloadSlider();
      } else {
        $('.line_notice_bgr a span.btn_prom').find('img').attr('src', 'images/ico_slide_down.png');
        $('.main_prom_bnr').slideUp(400,function(){
        	mpSlider.reloadSlider();
        });
        lineNotice = false;
      }
    });

    // 메인 visual slide
    var visualSwiper = new Swiper ('.visual .swiper-container', {
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
        el:'.swiper-pagination',
            clickable: true,
        },
        speed:700,
        effect:'fade'
    });
    
    visualSwiper.on('slideChangeTransitionStart', function () {
        if(this.activeIndex == 2){
            $("#contentM").hide();
            $("#contentN").fadeIn();
        }else{
            $("#contentN").hide();
            $("#contentM").fadeIn();
        }
    });

    // tab
    $(".tab_wrap .tab li").click(function(e){
        e.preventDefault();

        var idx = $(this).index();
        $(this).siblings().removeClass("active");
        $(this).addClass("active");

        $(this).parent().parent().next(".tab_content_wrap").find(".tab_content").hide();
        $(this).parent().parent().next(".tab_content_wrap").find(".tab_content").eq(idx).show();
        $(this).parent().parent().next(".tab_content_wrap").find(".tab_content").find(".left_content").css({
                "visibility":"visible",
                "animation-duration":"2s",
                "animation-name":"slideInLeft"
        });
        $(this).parent().parent().next(".tab_content_wrap").find(".tab_content").find(".right_content").css({
                "visibility":"visible",
                "animation-duration":"2s",
                "animation-name":"slideInRight"
        });
    });

    // quick메뉴위치
    if($(window).scrollTop() > $(".visual").outerHeight(true)){
        $("#quickBox").css({
            position:"fixed",
            top:"142px"
        });
    }else{
        $("#quickBox").css({
            position:"absolute",
            top:"1056px"
        });
    }

    // visual slide 버튼위치
    if($(window).scrollTop() > $(".header_top").outerHeight(true)){
        $(".quick_btn").addClass("fixed");
    }else{
        $("#header").removeClass("fixed");
		$(".quick_btn").removeClass("fixed");
		$(".quick_btn .swiper-button-prev,.quick_btn .swiper-button-next").css({
		    top:$(".visual").offset().top + ($(".visual").outerHeight(true)/2) - 30
		});
		$(".quick_btn .swiper-pagination").css({
		    top:$(".visual").offset().top + $(".visual").outerHeight(true) - 60
		});
    }

    $(window).scroll(function(){
        if($(window).scrollTop() > $(".header_top").outerHeight(true)){
	    	$("#header").addClass("fixed");
		    $(".quick_btn").addClass("fixed");
		    
		    $(".quick_btn").css({
		        "margin-left":"44px",
		        "margin-top":"30px",
		    });
		    $(".quick_btn .swiper-pagination").css({
		        "position":"relative",
		        "display":"inline-block",
		        "vertical-align":"middle",
		        "top":0,
		        "width":"auto"
		    });
		    
		    $(".quick_btn .swiper-pagination-clickable .swiper-pagination-bullet").stop().animate({
		        "margin":"0 3px"
		    },function(){
		        $(".quick_btn .swiper-pagination-clickable .swiper-pagination-bullet").css({
		             "background":"rgba(0,0,0,0.65)",
		        });
		    });
		    
		    $(".quick_btn .swiper-button-prev").stop().animate({
		        "left":0,
		        "margin-left":0,
		        "top":0,
		        "margin-top":0,
		        "width":"10px",
		        "height":"19px",
		        "margin-right":"4px"
		    });
		    $(".quick_btn .swiper-button-prev").css({
	            "display":"inline-block",
	            "vertical-align":"middle",
	            "position":"relative",
	            "background-image":"url(images/visual_slide_prev2.png)",
	        });
		    
		    $(".quick_btn .swiper-button-next").stop().animate({
		        "left":0,
		        "margin-left":0,
		        "top":0,
		        "margin-top":0,
		        "width":"10px",
		        "height":"19px",
		        "margin-left":"4px"
		    });

		    $(".quick_btn .swiper-button-next").css({
	            "display":"inline-block",
	            "vertical-align":"middle",
	            "position":"relative",
	            "background-image":"url(images/visual_slide_next2.png)",
	        });

		    $(".quick_btn").css({
		        "float":"left",
		        "position":"relative",
		        "width":"84px"
		    });
		    
		}else{
		    $("#header").removeClass("fixed");
		    $(".quick_btn").removeClass("fixed");
		    $(".quick_btn").css({
		        "float":"none",
		        "position":"static",
		        "width":"84px"
		    });
		    $(".quick_btn").css({
		        "margin-left":"0",
		        "margin-top":"0",
		    });
		    $(".quick_btn .swiper-pagination").css({
		        "position":"absolute",
		        "display":"inline-block",
		        "vertical-align":"middle",
		        "width":"100%",
		        "top":$(".visual").offset().top + $(".visual").outerHeight(true) - 60,
		    });
		    
		    $(".quick_btn .swiper-pagination-clickable .swiper-pagination-bullet").stop().animate({
		        "margin":"0 3px"
		    },function(){
		        $(".quick_btn .swiper-pagination-clickable .swiper-pagination-bullet").css({
		             "background":"rgba(255,255,255,0.65)",
		        });
		    });
		    $(".quick_btn .swiper-button-next").stop().animate({
		        "left":"50%",
		        "margin-left":"760px",
		        "top":$(".visual").offset().top + ($(".visual").outerHeight(true)/2) - 30,
		        "margin-top":"-16px",
		        "width":"32px",
		        "height":"59px",
		        "margin-right":"0"
		    },function(){
		        $(".quick_btn .swiper-button-next").css({
		            "display":"inline-block",
		            "vertical-align":"middle",
		            "position":"absolute",
		            "background-image":"url(images/visual_slide_next.png)",
		        });
		    });
		    
		    $(".quick_btn .swiper-button-prev").stop().animate({
		        "left":"50%",
		        "margin-left":"-795px",
		        "top":$(".visual").offset().top + ($(".visual").outerHeight(true)/2) - 30,
		        "margin-top":"-16px",
		        "width":"32px",
		        "height":"59px",
		        "margin-right":"0"
		    },function(){
		        $(".quick_btn .swiper-button-prev").css({
		            "display":"inline-block",
		            "vertical-align":"middle",
		            "position":"absolute",
		            "background-image":"url(images/visual_slide_prev.png)",
		        });
		    });   
		}

		// quick메뉴위치
        if($(window).scrollTop() > $(".visual").outerHeight(true)){
            $("#quickBox").css({
                position:"fixed",
                top:"142px"
            });
            $("#chatBot").fadeIn();
        }else{
            $("#quickBox").css({
                position:"absolute",
                top:"1056px"
            });
            $("#chatBot").fadeOut();
        }
    });
});
</script>
</body>
</html>