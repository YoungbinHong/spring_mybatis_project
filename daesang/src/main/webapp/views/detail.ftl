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
					<h1><a href="index.ftl"><img src="images/logo.png" alt="대상 Wellife" /></a></h1>
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
					<a href="sample.ftl" class="btn_sample"><img src="images/btn_sample.png" alt="" /></a>
					<a href="#" class="btn_search"><img src="images/ico_search.png" alt="" /></a>
				</div>
			</div>
		</div>
	</div>
	<div id="container">
		<div class="content_inner">
			<div class="detail_content" style="margin-top:40px;">
				<img src="images/detail.jpg" alt="">
				<div class="radio_wrap">
					<ul>
						<li>
							<div class="inline radio">
								<input type="radio" name="radio" checked="checked">
								<span><i>1회구매</i>15,900원 (10ml당 111원)</span>
							</div>
						</li>
						<li>
							<div class="inline radio">
								<input type="radio" name="radio">
								<span><i>정기구매</i>15,000원 (10ml당 100원)</span>
							</div>
							<div class="styled-select slate">
								<select name="" id="">
									<option value="">구매주기</option>
									<option value="">1달주기</option>
									<option value="">2달주기</option>
									<option value="">3달주기</option>
									<option value="">4달주기</option>
									<option value="">5달주기</option>
									<option value="">6달주기</option>
								</select>
							</div>
						</li>
					</ul>
				</div>
				<div class="sns_group1">
					<a href="#" class="btn_like"></a>
					<a href="#" class="btn_sns"></a>
					<div class="pop_sns">
						<img src="images/sns.png" alt="" />
					</div>
				</div>
				<div class="sns_group2">
					<a href="#" class="btn_like"></a>
					<a href="#" class="btn_sns"></a>
					<div class="pop_sns">
						<img src="images/sns.png" alt="" />
					</div>
				</div>
			</div>
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
	$("#quickBox").css({
        position:"absolute",
        top:"142px"
    });

    $(".btn_sns").click(function(e){
        e.preventDefault();
        $(this).next().toggle();
    });
    $(".btn_like").click(function(e){
        e.preventDefault();
        $(".btn_like").toggleClass("on");
    });

    $(window).scroll(function(){
        if($(window).scrollTop() > $(".header_top").outerHeight(true)){
            $("#header").addClass("fixed");
        }else{
            $("#header").removeClass("fixed");
        }

        if($(window).scrollTop() > 0){
            $("#quickBox").css({
                position:"fixed",
                top:"142px"
            });
            $("#chatBot").fadeIn();
        }else{
            $("#quickBox").css({
                position:"absolute",
                top:"142px"
            });
            $("#chatBot").fadeOut();
        }
    });
});
</script>
</body>
</html>