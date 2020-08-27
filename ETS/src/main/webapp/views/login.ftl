<!DOCTYPE html>

<html lang="ko">

<head>

<!-- Metadata -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<!-- Tab Title -->
<title>ETS 관리자</title>

<!-- Favicon; icon for IE, shortcut icon for CHROME,EDGE; -->
<link rel="icon" href="/images/common/favicon.png" />
<link rel="shortcut icon" href="/images/common/favicon.png" />

<!-- Theme for Central Making -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" type="text/css"
	href="/webjars/jquery-ui/1.12.1/themes/start/jquery-ui.min.css"
	media="screen, projection" />

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

<!-- For Modal Design -->
<link href="/vendors/animate.css/animate.min.css" rel="stylesheet">
<link href="/build/css/custom.min.css" rel="stylesheet">


<!-- Script Settings -->
<script type="text/javascript"
	src="/webjars/jquery/3.1.1/dist/jquery.min.js"></script>
<script type="text/javascript"
	src="/webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/storage.js"></script>
<script type="text/javascript" src="/js/slick.min.js"></script>
<script type="text/javascript" src="/js/validation/common.js"></script>
<script type="text/javascript"
	src="/js/validation/jquery.alerts-1.1/jquery.alerts.js"></script>
<link rel="stylesheet"
	href="/js/validation/jquery.alerts-1.1/jquery.alerts.css" />
<script type="text/javascript" src="/js/lib/jquery.inputmask.js"></script>
<script type="text/javascript"
	src="/js/lib/jquery.inputmask.date.extensions.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


<!-- Javascript Functions -->
<script type="text/javascript">
	$(document).ready(function() {
		var params = locationParameter();
		//console.log("params : " + JSON.stringify(params));

		if (typeof (params.error) != "undefined" && params.error != "") {
			setSessionStorage("error", params.error);
		}

		if (getSessionStorage("error") == "logout") {
			jsAlert.alert("알림", "로그인정보가 없습니다.", null, fn_resetStorage);
		} else if (getSessionStorage("error") == "duplogin") {
			jsAlert.alert("알림", "다른기기에서 로그인되었습니다.", null, fn_resetStorage);
		}
	});

	function fn_resetStorage() {
		removeSessionStorage("error");

		//브라우저 주소창의 URL값 변경 
		if (typeof (history.pushState) != "undefined") { //브라우저가 지원하는 경우
			history.pushState(null, "", "/login");
		} else { //브라우저가 지원하지 않는 경우 페이지 이동처리
			location.href = "/login";
		}
	}

	//function of change password
	function fn_changePW(){
		
	}
	
	
	// Login Function
	function fn_login() {
		if (checkValidation("loginInfo")) {
			$.ajax({
				url : '/login/duplication',
				data : $('#login input').serialize(),
				type : 'POST',
				dataType : 'json',
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					appendAjaxLoading();
				}
			}).done(
					function(responseData) {
						removeAjaxLoading();
						var error = responseData.error;
						if (error === true) {
							$('#sesId').val(responseData.data.sessionId);
							if (!confirm("이미 로그인 사용자가 있습니다. 중복로그인 하시겠습니까?")) {
								return;
							}
						} else if (responseData.code == "401") {
							jsAlert.alert("알림", "로그인 정보가 일치하지 않습니다.");
							return;
						}

						if (responseData.code == "200") {
							var username = $('#user_id').val();
							var cookiename = 'username';
							document.cookie = encodeURIComponent(cookiename)
									+ '=' + encodeURIComponent(username);
							appendAjaxLoading();
							$('#login').submit();
						}
					});
		}
	}
</script>

</head>

<body style="background: #fffefd;">

	<!-- Login Display Container -->
	<div class="container">

		<!-- Bootstrap Form -->
		<form class="form-signin" role="form" id="login" method="post"
			action="/signin">
			<input type="hidden" name="removeSessionId" id="sesId" value="" />
			<!-- Header -->
			<h1 class="text-center form-signin-heading"
				style="color: #2ADCC2; font-size: 40px; margin-bottom: 100px;">ETS
				Administration</h1>

			<!-- ID Input Label -->
			<label for="user_id" class="sr-only">아이디</label> <input type="text"
				name="${usernameParameter}" id="user_id" alt="아이디"
				class="form-control" placeholder="아이디" required />

			<!-- PW Input Label -->
			<label for="password" class="sr-only">비밀번호</label> <input
				type="password" name="${passwordParameter}" id="password"
				alt="Password" class="form-control" placeholder="비밀번호"
				onkeydown="if(event.keyCode==13) fn_login();" required />

			<!-- Checkbox for Saving ID -->
			<div class="checkbox">
				<input type="checkbox" value="아이디 저장"
					style="margin: 0 0 0 5px !important; position: relative;" /> <label
					style="padding-left: 0;">아이디 저장</label>
			</div>

			<!-- Login Button -->
			<div class="col-md-12 form-group has-feedback">
				<button type="button" class="btn btn-success border-0"
					style="background-color: #2ADCC2; color: white; width: 100%;"
					onclick="fn_login()">로그인</button>
			</div>
		</form>
		<!-- Text for PW Changing -->
		<div class="text-center">
			<button type="button" class="btn btn-default btn-sm pl-3"
				data-toggle="modal" data-target="#pwChangeModal">비밀번호 변경</button>
			<div class="clearfix"></div>
			<br />
		</div>

		<!-- Modal -->
		<div class="modal fade" id="pwChangeModal" tabindex="-1" role="dialog"
			aria-labelledby="pwChangeModal">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<div class="container">
							<form class="form-changePW" role="form" id="changePW"
								method="post" action="/">
								<div class="form-group row">
									<span for="curID" class="col-md-3"><b>ID</b></span>
									<div class="input-group col-md-8">
										<input type="text" class="form-control" id="curID">
									</div>
								</div>
								<div class="form-group row">
									<span for="curID" class="col-md-3"><b>현재 비밀번호</b></span>
									<div class="input-group col-md-8">
										<input type="text" class="form-control" id="curID">
									</div>
								</div>
								<div class="form-group row">
									<span for="curID" class="col-md-3"><b>변경할 비밀번호</b></span>
									<div class="input-group col-md-8">
										<input type="password" class="form-control" id="curID"
											placeholder="영문, 숫자 포함 12자 이상">
									</div>
								</div>
								<div class="form-group row">
									<span for="curID" class="col-md-3"><b>변경할 비밀번호(확인)</b></span>
									<div class="input-group col-md-8">
										<input type="password" class="form-control" id="curID"
											placeholder="영문, 숫자 포함 12자 이상">
									</div>
								</div>
							</form>
						</div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer justify-content-start">
						<div class="row">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" style="width: 150px;">취소</button>
							<button type="button" class="btn btn-success ml-1"
								style="width: 600px; background-color: #2ADCC2; color: white;"
								onclick="fn_changePW()">변경</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 오류메세지 팝업 -->
		<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
			tabindex="-1" id="popError" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button aria-hidden="true" data-dismiss="modal" class="close"
							type="button">×</button>
						<h4 class="modal-title">사용자 알림</h4>
					</div>
					<div class="modal-body">
						<ul class="list-group">
							<li class="list-group-item">아이디 또는 비밀번호를 확인 바랍니다.</li>
						</ul>
						<div class="text-center">
							<button type="button" aria-hidden="true" data-dismiss="modal"
								class="btn btn-primary">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>