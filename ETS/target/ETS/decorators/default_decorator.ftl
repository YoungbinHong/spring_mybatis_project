<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>

<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Tab Title -->
<title>ETS 관리자</title>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/images/common/favicon.png">

<!-- Bootstrap -->
<link href="/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jquery-ui -->
<link href="/css/jquery-ui.min.css" rel="stylesheet">

<!-- Font Awesome -->
<link href="/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<!-- NProgress -->
<link href="/vendors/nprogress/nprogress.css" rel="stylesheet">

<!-- iCheck -->
<link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="/build/css/custom.min.css" rel="stylesheet">

<!-- jQuery -->
<script src="/vendors/jquery/dist/jquery.min.js"></script>
<script src="/vendors/jquery/dist/jquery.min.js"></script>
<script src="/js/jquery-ui.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script>
	$("#datepicker").datepicker();
</script>
</head>
<!-- Javascript Functions -->
<script type="text/javascript">
	var dtNow = new Date();
	$(function() {
		$(".datepicker").datepicker(
						{
							buttonImageOnly : false,
							prevText : '이전달',
							nextText : '다음달',
							monthNamesShort : [ '1월', '2월', '3월', '4월', '5월',
									'6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
							changeYear : true,
							minDate : '-1y',
							yearRange : 'c-1:c+3',
							changeMonth : true,
							showMonthAfterYear : false,
							dateFormat : 'yy-mm-dd',
							duration : '',
							isRTL : false,
							beforeShow : function(input, inst) {
								if ($(this).val() != "") {
									var selectYear = new Date($(this).val());
									var nowYear = dtNow.getFullYear();
									var num = parseInt(selectYear.getFullYear())
											- nowYear;
									if (num > 100) {
										inst.settings.yearRange = Number(nowYear)
												- 1
												+ ':'
												+ Number(Number(nowYear) + num);
									} else if (num < -100) {
										inst.settings.yearRange = Number(Number(Number(nowYear)
												+ num) - 1)
												+ ':'
												+ Number(Number(nowYear) + 3);
									} else {
										inst.settings.yearRange = Number(nowYear)
												- 100
												+ ':'
												+ Number(Number(nowYear) + 3);
									}
								}
							}
						}).keyup(function(e) {
					if (e.keyCode == 8 || e.keyCode == 46) {
						$.datepicker._clearDate(this);
					}
				});

		// 다국어 선택
		$(".lang").click(function(e) {
			e.preventDefault();
			$(this).toggleClass("active");
			$(this).find("ul").toggle();
		});
		$(".lang").on("mouseleave blur", function() {
			$(this).removeClass("active");
			$(this).find("ul").hide();
		});
		$(".lang ul").click(function(e) {
			e.stopPropagation();
		});
	});
</script>




<body class="nav-md">

	<div class="container body">

		<div class="main_container">

			<!-- Side Bar Title -->
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">

					<div class="clearfix"></div>
					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<h1 class="text-center mt-4" style="color: #ffffff;">
						<a href="/notice/notice">ETS</a>
						</h1>
					</div>

					<!-- sidebar menu -->
					<#include "inc/sidebar.ftl"/>
				</div>
			</div>

			<!-- Top Navigation -->
			<#include "inc/topbar.ftl"/> ${body}

			<!-- footer content -->
			<#include "inc/footer.ftl"/>
			<!-- /footer content -->
		</div>
	</div>
	<!-- Script in body -->
	
	<!-- Bootstrap -->
	<script src="/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- FastClick -->
	<script src="/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="/vendors/nprogress/nprogress.js"></script>
	<!-- iCheck -->
	<script src="/vendors/iCheck/icheck.min.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="/build/js/custom.min.js"></script>

	<script type="text/javascript" src="/js/validation/common.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/validation/jquery.alerts-1.1/jquery.alerts.js"></script>
	<link rel="stylesheet" href="/js/validation/jquery.alerts-1.1/jquery.alerts.css" />
	<script type="text/javascript" src="/js/lib/jquery.inputmask.js"></script>
	<script type="text/javascript" src="/js/lib/jquery.inputmask.date.extensions.js"></script>

</body>

</html>