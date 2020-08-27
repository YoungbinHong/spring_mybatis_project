<!--
	* @FileName   : member.ftl
	* @Description: 회원관리  View
	* @Author     : Youngbin Hong
	* @Version    : 2020.08.14
	* @Copyright  : ⓒADUP. All Right Reserved
-->

<#assign pagingTag = JspTaglibs["/WEB-INF/tld/paging.tld"] />
<#setting number_format = "###"/>

<!-- Contents Script START -->
<script type="text/javascript">
	
	function fn_search(){
		$("#memberFrm").prop("action","/member/member");
		formSubmit("memberFrm");
	}
		
	$(document).ready(function() {
		make_selectbox($('#searchType').val());

		$("#searchType").change(function() {
			make_selectbox($(this).val());
		});
		
	});
	
	function fn_listnum(){
		$("#memberFrm").prop("action","member/member");
		$("#nowPage").val('1');
		formSubmit("memberFrm2");
	}
	
	function make_selectbox(type) {
		
		$('#searchType2').children('option').remove();

		if (type == 'nation') {
			$('#searchType2').append("<option value=''>국가전체</option>");
			$('#searchType2').append("<option value='KR'>대한민국</option>");
			$('#searchType2').append("<option value='DE'>독일</option>");
			$('#searchType2').append("<option value='US'>미국</option>");
			$('#searchType2').append("<option value='CN'>중국</option>");
		} else if (type == 'timeZone') {
			$('#searchType2').append("<option value=''>TimeZone 전체</option>");
			$('#searchType2').append("<option value='(GMT-5:00)미국'>(GMT-5:00)미국</option>");
			$('#searchType2').append("<option value='(GMT+3:00)독일'>(GMT+3:00)독일</option>");
			$('#searchType2').append("<option value='(GMT+8:00)중국'>(GMT+8:00)중국</option>");
			$('#searchType2').append("<option value='(GMT+9:00)대한민국'>(GMT+9:00)대한민국</option>");
		} else if (type == 'languageOfTelegram') {
			$('#searchType2').append("<option value=''>Telegram언어 전체</option>");
			$('#searchType2').append("<option value='Korean'>한국어</option>");
			$('#searchType2').append("<option value='English'>English</option>");
		}
		
	}
	
</script>
<!-- Contents Script END -->

<!-- Modal Script START -->
<script type="text/javascript">
	
	// 주문 기록
	const normalArr = [ "전체", "Basic", "Position", "Reservation", "Horizontal", "Trend Line" ];
	const strategyArr = [ "전체", "15m", "30m", "60m", "4h", "1d" ];
	
	$(document).on("click", "#normalBtn", function() {
		$("#changeTag th").text("Type");
		$("#typeBtns").removeClass("d-none");
		$("#candleBtns").addClass("d-none");
		console.log($("myModal").hasClass("hide"));
	});

	$(document).on("click", "#strategyBtn", function() {
		$("#changeTag th").text("Candle Size");
		$("#typeBtns").addClass("d-none");
		$("#candleBtns").removeClass("d-none");
	});

	$(document).on("click", "#normalOrdTable tbody tr", function(e) {
		$("#normalOrd_searchTb").addClass('d-none');
		$('#sub_normalOrd_searchTb').removeClass('d-none');
		$("#ordTables").addClass('d-none');
		$('#sub_ordTables').removeClass('d-none');

		var chkModal = setInterval(function() {
			var chk_myModal = $("#myModal").is(":visible");
			console.log(chk_myModal);

			if (!chk_myModal) {
				$("#normalOrd_searchTb").removeClass('d-none');
				$('#sub_normalOrd_searchTb').addClass('d-none');
				$("#ordTables").removeClass('d-none');
				$('#sub_ordTables').addClass('d-none');

				clearInterval(chkModal);
			}
		}, 1000);
	});

	$(document).on("click", "#strategyOrdTable tbody tr", function(e) {
		$("#normalOrd_searchTb").addClass('d-none');
		$('#sub_normalOrd_searchTb').addClass('d-none');
		$("#sub_strategyOrd_searchTb").removeClass('d-none');
		$("#ordTables").addClass('d-none');
		$('#sub_ordTables').removeClass('d-none');

		var chkModal = setInterval(function() {
			var chk_myModal = $("#myModal").is(":visible");

			if (!chk_myModal) {
				$("#normalOrd_searchTb").removeClass('d-none');
				$('#sub_normalOrd_searchTb').addClass('d-none');
				$("#sub_strategyOrd_searchTb").addClass('d-none');
				$("#ordTables").removeClass('d-none');
				$('#sub_ordTables').addClass('d-none');

				clearInterval(chkModal);
			}
		}, 1000);
	}); 
	// 주문 기록

	//전략 관리 
	$(document).on("click", "#str_bottomTable tbody tr", function(e) {
		$("#strTab").addClass('d-none');
		$("#sub_strTab").removeClass('d-none');

		var chkModal = setInterval(function() {
			var chk_myModal = $("#myModal").is(":visible");

			if (!chk_myModal) {
				$("#strTab").removeClass('d-none');
				$("#sub_strTab").addClass('d-none');

				clearInterval(chkModal);
			}
		}, 1000);
	});

	var openBtnTrigger = false;
	$(document).on('click', "#openBtn", function() {
		openHtml = '<span class="fa fa-angle-double-down"></span>\n';
		closeHtml = '<span class="fa fa-angle-double-up"></span>'

		openBtnTrigger = !openBtnTrigger;
		if (openBtnTrigger) {
			$("#openBtn").text('Backtesting 거래 내역 닫기');
			$("#openBtn").append(closeHtml);
			$("#bottomInfo").removeClass('d-none');

		} else {
			$("#openBtn").text('Backtesting 거래 내역 열기');
			$("#openBtn").append(openHtml);
			$("#bottomInfo").addClass('d-none');
		}
	});

	$(document).ready(function() {
		$("#str_bottomTable tbody tr td").addClass("text-center align-middle");
		$("#str_bottomTable thead tr th").addClass("text-center align-middle");
	});
	// 전략  관리 

	$(document).on('click', "#blockModalBtn", function() {
		var chkModal = setInterval(function() {
			var chk_modal = $("#baseConfirmModal").is(":visible");
			if (!chk_modal) {
				$("#myModal").modal("hide");
				$("#myModal").modal("toggle");
				$("#myModal").modal("show");
				clearInterval(chkModal);
			}
		}, 500);
	});
</script>
<!-- Modal Script END-->

<!-- Right Column START -->
<div class="right_col" role="main">
	
	<!-- Contents START -->
	<div class="col-md-12 col-sm-12">
	
		<div class="page-title">
			<div class="title_left">
				<h3>회원 관리</h3>
			</div>
		</div>
		
		<div class="x_panel" style="padding-top:30px;">
		
			<form method="POST" name="memberFrm" id="memberFrm" style="width:100%;">
				<div class="table-responsive">
					<table class="table jambo_table">
						
						<colgroup>
							<col width="200"/>
							<col width="60%"/>
							<col width="*"/>
						</colgroup>
						
						<tbody>
							<tr>
								<th scope="row" class="text-center">ID 검색</th>
								<td><input type="text" id="searchID" name="searchID" value="${searchID}" class="form-control"/></td>
								<td rowspan="4"><button class="btn btn-success btn-sm btn-frm m-0 wd100" type="button" onclick="fn_search()">검색</button></td>
							</tr>
							<tr>
								<th scope="row" class="bg-gray-100 text-center">Telegram ID 검색</th>	
								<td><input type="text" id="searchTelegramID" name="searchTelegramID" value="${searchTelegramID}" class="form-control"/></td>
							</tr>
							<tr>
								<th scope="row" class="bg-gray-100 text-center">이용권 적용</th>
								<td>
									<select id="voucherType" name="voucherType" value="${voucherType}" class="form-control">
										<option value="">전체</option>
										<option value="1개월">1 개월</option>
										<option value="2개월">2 개월</option>
										<option value="6개월">6 개월</option>
										<option value="1년">1 년</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row" class="bg-gray-100 text-center">검색어</th>
								<td>
									<div class="select_wrap length2">
									
										<select id="searchType" name="searchType" value="" class="form-control">
											<option value="nation" selected>국가</option>
											<option value="timeZone">TimeZone</option>
											<option value="languageOfTelegram">Language of Telegram</option>
										</select>
										
										<select id="searchType2" name="searchType2" value="${searchType2}" class="form-control"></select>
										
									</div>
								</td>
							</tr>
						</tbody>	
						
					</table>
				</div>
			</form>
			
			<div class="input-group justify-content-between">
			
				<div style="padding: 10px; font-weight:700;">
					총 <span style="color: red;">${pageInfo.rowMax}</span>건
				</div>
				
				<div>
					<button type="button" class="btn btn-outline-success mb-0">Excel 다운로드</button>
					<button type="button" class="btn btn-outline-danger mb-0">Block</button>
					<div class="dropdown no-arrow" style="display: inline-block; mragin-bottom:5px;">
						<form class="form-inline" name="memberFrm2" id="memberFrm2" method="post">
							<select type="select" class="custom-select w-auto input-radius-button" name="listNum" id="listNum" onchange="fn_listnum()">
								<option value="" selected>선택</option>
								<option value="tw">20개씩 보기</option>
								<option value="tt">30개씩 보기</option>
								<option value="ft">50개씩 보기</option>
								<option value="st">70개씩 보기</option>
								<option value="hd">100개씩 보기</option>
								<option value="th">200개씩 보기</option>
							</select>
						</form>
					</div>
				</div>
				
			</div>
				
			<div class="table-responsive">
				<div class="table-responsive">
					<table class="table table-striped jambo_table bulk_action">
						
						<thead>
							<tr class="headings">
								<th class="column-title"><input type="checkbox" id="checkAll" name="checkAll" /></th>
								<th class="column-title">No</th>
								<th class="column-title">가입일</th>
								<th class="column-title">ID</th>
								<th class="column-title">국가</th>
								<th class="column-title">TimeZone</th>
								<th class="column-title">Telegram ID</th>
								<th class="column-title">이용권</th>
								<th class="column-title">레퍼럴 코드</th>
								<th class="column-title">상태</th>
								<th class="column-title">Language of Telegram</th>
							</tr>
						</thead>
						
						<tbody>
							<#if resultList?has_content>
							<#assign rNum = pageInfo.rowMax - pageInfo.startRowNum + 1 />
							<#list resultList as rMap>
							<tr style="cursor:pointer;">
								<td class=" "><input type="checkbox" name="checkbox" value=""/></td>
								<td class="even pointer"><a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">${rMap.no!}</a></td>
								<td class="even pointer"><a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">${rMap.registerDate!}</a></td>
								<td class="even pointer"><a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">${rMap.id!}</a></td>
								<td class="even pointer"><a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">${rMap.nation!}</a></td>
								<td class="even pointer"><a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">${rMap.timeZone!}</a></td>
								<td class="even pointer"><a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">${rMap.telegramId!}</a></td>
								<td class="even pointer"><a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">${rMap.voucherType!}</a></td>
								<td class="even pointer"><a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">${rMap.referralType!}</a></td>
								<td class="even pointer"><a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">${rMap.status!}</a></td>
								<td class="even pointer"><a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">${rMap.languageOfTelegram!}</a></td>
							</tr>
							<#assign rNum = rNum - 1/>
							</#list>
							<#else>
							<tr>
								<td colspan="11"><strong>게시물이 존재하지 않습니다.</strong></td>
							</tr>
							</#if>
						</tbody>
						
					</table>
				</div>
			</div>
			
			<div class="col-md-12 col-sm-20 col-xs-20">	
				<nav aria-label="Page navigation example" class="content-center text-center">
					<@pagingTag.Paging url="/member/member" pageCount="${pageInfo.pageCount!}" rowCount="${pageInfo.rowCount!}" rowMax="${pageInfo.rowMax!}" nowPage="${pageInfo.nowPage!}" params="searchID=${searchID}&searchTelegramID=${searchTelegramID}&voucherType=${voucherType}&searchType2=${searchType2}"/>
				</nav>
			</div>
			
		</div>
	</div>
	<!-- Contents END -->

	<!-- Modal START -->
	<div class="modal modal-center" id="myModal">
		<div class="modal-dialog modal-lg" style="min-width: 90%;">
			<div class="modal-content modal-fullsize">

				<!-- Header START -->
				<div class="modal-header">
					<button id="closeModalBtn" type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Header END -->

				<!-- Body START -->
				<div class="modal-body">
					<div class="container">
						<div class="row">
						
							<div class="col-md-6 text-left">
								<h2 class="page-sub-title m-0">회원정보</h2>
							</div>
							
							<div class="col-md-6 text-right">
								<button id="blockModalBtn" type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#baseConfirmModal">Block</button>
							</div>
							
						</div>

						<div class="container">
							
							<ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active" id="base-tab" data-toggle="tab" href="#base" role="tab" aria-controls="base" aria-selected="true">기본 정보</a></li>
								<li class="nav-item"><a class="nav-link" id="order-tab" data-toggle="tab" href="#order" role="tab" aria-controls="order" aria-selected="false">주문 기록</a></li>
								<li class="nav-item"><a class="nav-link" id="strategy-tab" data-toggle="tab" href="#strategy" role="tab" aria-controls="strategy" aria-selected="false">전략 관리</a></li>
								<li class="nav-item"><a class="nav-link" id="apiControl-tab" data-toggle="tab" href="#apiControl" role="tab" aria-controls="apiControl" aria-selected="false">API 관리</a></li>
							</ul>	
							
							<div class="tab-content" id="myTabContent">
								
								<!-- 기본 정보 START -->
								<div class="tab-pane fade show active" id="base" role="tabpanel" aria-labelledby="base-tab">
									<div class="table-responsive">
										<table class="table" style="border-top: solid 2px #fff;">
											<tbody class="">
												<tr style="border-bottom: solid 2px #fff;">
													<td class="text-left"><span><b>· ID</b></span></td>
													<td class="text-left"><span><b>rMap.id</b></span></td>
													<td class="text-left"><span><b>· 상태</b></span></td>
													<td class="text-left"><span><b>rMap.status</b></span></td>
												</tr>
												<tr style="border-bottom: solid 2px #fff;">
													<td class="text-left"><span><b>· Telegram ID</b></span></td>
													<td class="text-left"><span><b>rMap.telegramId</b></span></td>
													<td class="text-left"><span><b>· 최근 접속 시간</b></span></td>
													<td class="text-left"><span><b>ㅇㅅㅇ?</b></span></td>
												</tr>
												<tr style="border-bottom: solid 2px #fff;">
													<td class="text-left"><span><b>· Language of Telegram</b></span></td>
													<td class="text-left"><span><b>rMap.languageOfTelegram</b></span></td>
													<td class="text-left"><span><b>· 접속 상태</b></span></td>
													<td class="text-left"><span><b>ㅇㅅㅇ?</b></span></td>
												</tr>
												<tr style="border-bottom: solid 2px #fff;">
													<td class="text-left"><span><b>· 국가</b></span></td>
													<td class="text-left"><span><b>rMap.nation</b></span></td>
												</tr>
												<tr style="border-bottom: solid 2px #fff;">
													<td class="text-left"><span><b>· TimeZone</b></span></td>
													<td class="text-left"><span><b>rMap.timeZone</b></span></td>
												</tr>
												<tr style="border-top: solid 2px #fff;">
													<td class="text-left"></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr style="border-top: solid 2px #2ADCC2; border-bottom: solid 2px #2ADCC2;">
													<td class="text-left"><span><b><b>· 이용권 적용 상태</b></b></span></td>
													<td class="text-left"><span><b>rMap.voucherType(만료일 : ㅇㅅㅇ?)</b></span></td>
													<td></td>
													<td class="text-right">
														<button type="button" class="btn btn-outline-primary btn-sm">변경</button>
														<button type="button" class="btn btn-outline-danger btn-sm">해제</button>
														<button type="button" class="btn btn-outline-secondary btn-sm">이용권 이력</button>
													</td>
												</tr>

											</tbody>
										</table>
									</div>
								</div>
								<!-- 기본 정보 END -->

								<!-- 주문 기록 START -->
								<div class="tab-pane fade" id="order" role="tabpanel" aria-labelledby="order-tab">
									
									<!-- 검색 테이블 START -->
									<div id="normalOrd_searchTb" class="x_panel" style="padding-top: 30px;">
										<div class="input-group justify-content-between">
											
											<form name="" id="" method="POST" style="width: 100%;">
												<div class="container">
													<div class="table-responsive">
													
														<table class="table jambo_table bulk_action">
														
															<colgroup>
																<col width="200" />
																<col width="*" />
															</colgroup>
															
															<tbody>
															
																<tr>
																	<th scope="row" class="text-center align-middle">검색</th>
																	<td class="align-middle">
																		<div>
																			<input type="text" class="form-control col-md-9" placeholder="Order ID"/>
																			<div class="col-md-1"></div>
																			<button type="button" class="btn btn-success btn-sm col-md-2 m-0 btn-frm">검색</button>
																		</div>
																	</td>
																</tr>
																
																<tr id="changeTag">
																	<th scope="row" class="text-center align-middle">Type</th>
																	<td>
																		<!-- 일반 주문/ 전략주문 별 바뀌는 테이블 1 START -->
																		<div id="typeBtns" class="input-group row mb-0 text-left">
																			<div class="col-md-1"><label id="chk_1" style="margin: 4px;"> <input type="checkbox" class="flat"/> 전체</label></div>
																			<div class="col-md-1"><label id="chk_2" style="margin: 4px;"> <input type="checkbox" class="flat"/> Basic</label></div>
																			<div class="col-md-1"><label id="chk_3" style="margin: 4px;"> <input type="checkbox" class="flat"/> Position</label></div>
																			<div class="col-md-1" style="width: 9.999999996%; flex: 0 0 9.999%; max-width: 9.999%;"><label id="chk_4" style="margin: 4px;"><input type="checkbox" class="flat"/> Reservation</label></div>
																			<div class="col-md-1" style="width: 9.999999996%; flex: 0 0 9.999%; max-width: 9.999%;"><label id="chk_5" style="margin: 4px;"> <input type="checkbox" class="flat"/> Horizontal</label></div>
																			<div class="col-md-1" style="width: 9.999999996%; flex: 0 0 9.999%; max-width: 9.999%;"><label id="chk_6" style="margin: 4px;"> <input type="checkbox" class="flat"/> Trend Line</label></div>
																		</div>
																		<!-- 일반 주문/ 전략주문 별 바뀌는 테이블 1 END -->
																		
																		<!-- 일반 주문/ 전략주문 별 바뀌는 테이블 2 START -->
																		<div id="candleBtns" class="input-group row mb-0 text-left d-none">
																			<div class="col-md-1"><label id="chk_1" style="margin: 4px;"> <input type="checkbox" class="flat"> 전체</label></div>
																			<div class="col-md-1"><label id="chk_2" style="margin: 4px;"> <input type="checkbox" class="flat"> 15m</label></div>
																			<div class="col-md-1"><label id="chk_3" style="margin: 4px;"> <input type="checkbox" class="flat"> 30m</label></div>
																			<div class="col-md-1"><label id="chk_4" style="margin: 4px;"> <input type="checkbox" class="flat"> 60m</label></div>
																			<div class="col-md-1"><label id="chk_5" style="margin: 4px;"> <input type="checkbox" class="flat"> 4h</label></div>
																			<div class="col-md-1"><label id="chk_6" style="margin: 4px;"> <input type="checkbox" class="flat"> 1d</label></div>
																		</div>
																		<!-- 일반 주문/ 전략주문 별 바뀌는 테이블 2 END -->
																	</td>
																</tr>
																
																<tr>
																	<th scope="row" class="text-center align-middle">Position</th>
																	<td>
																		<div id="typeBtns2" class="input-group row mb-0 text-left">
																			<div class="col-md-1"><label style="margin: 4px;"> <input type="checkbox" class="flat"/> 전체</label></div>
																			<div class="col-md-1" style="width: 9.999999996%; flex: 0 0 9.999%; max-width: 9.999%;"><label style="margin: 4px;"> <input type="checkbox" class="flat"/> Long(buy)</label></div>
																			<div class="col-md-1" style="width: 9.999999996%; flex: 0 0 9.999%; max-width: 9.999%;"><label style="margin: 4px;"> <input type="checkbox" class="flat"/> Short(Sell)</label></div>
																		</div>
																	</td>
																</tr>
																
																<tr>
																	<th scope="row" class="text-center align-middle">검색 기간</th>
																	<td>
																		<input id="" name="date" class="datepicker form-control col-md-2 col-xs-12" type="date" required="required" style="height: 32.8px; margin: 5px; display: inline;">
																		<input id="" name="date" class="datepicker form-control col-md-2 col-xs-12" type="date" required="required" style="height: 32.8px; margin: 5px; display: inline;">
																		<div class="col-md-7 col-xs-12" style="margin: 5px;">
																			<div class="btn-group btn-group-sm border" role="group" aria-label="...">
																				<button class="btn btn-light" type="button">오늘</button>
																				<button class="btn btn-light" type="button">어제</button>
																				<button class="btn btn-light" type="button">7일</button>
																				<button class="btn btn-light" type="button">1개월</button>
																				<button class="btn btn-light" type="button">3개월</button>
																				<button class="btn btn-light" type="button">6개월</button>
																				<button class="btn btn-light" type="button">1년</button>
																			</div>
																		</div>
																	</td>
																</tr>
																
															</tbody>
															
														</table>
														
													</div>
												</div>
											</form>
											
										</div>
									</div>
									<!-- 검색 테이블 END -->

									<!-- 일반 d-none START -->
									<div id="sub_normalOrd_searchTb" class="d-none">
									
										<div class="table-responsive">
											<table class="table borderless">
												<tbody>
													<tr style="border-bottom: solid 2px #fff;">
														<th>· ID</th>
														<td>traum@traum.com</td>
														<th>· Type</th>
														<td class="text-right">Horizontal</td>
													</tr>
													<tr style="border-bottom: solid 2px #fff;">
														<th>· Order ID</th>
														<td>468326823367</td>
														<th>· Position</th>
														<td class="text-right">Long(buy)</td>
													</tr>
													<tr style="border-bottom: solid 2px #fff;">
														<th>· Exchange</th>
														<td>BitMex</td>
														<th>· Status</th>
														<td class="text-right">Ongoing</td>
													</tr>
													<tr style="border-bottom: solid 2px #fff;">
														<th>· Symbol</th>
														<td>XBTUSD</td>
													</tr>
												</tbody>
											</table>
										</div>

										<!-- 검색 테이블 START -->
										<div class="input-group justify-content-between">
											<form name="" id="" method="POST" style="width: 100%;">
												<div class="table-responsive">
												
													<table class="table jambo_table bulk_action">
													
														<colgroup>
															<col width="200" />
															<col width="*" />
														</colgroup>
														
														<tbody>
														
															<tr>
																<th scope="row" class="bg-gray-100 text-center">검색</th>
																<td style="padding-bottom: 0px;">
																	<div class="input-group row mb-0">
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat"> 전체</label></div>
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat"> 등록</label></div>
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat"> 실행</label></div>
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat"> 체결</label></div>
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat"> 수정</label></div>
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat"> 중지</label></div>
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat"> 취소</label></div>
																	</div>
																</td>
															</tr>
															
															<tr>
																<th scope="row" class="text-center">검색 기간</th>
																<td>
																	<input id="" name="date" class="datepicker form-control col-md-2 col-xs-12" type="date" required="required" onfocus="this.type='date'" style="height: 32.8px; margin: 5px; display: inline;"/>
																	<input id="" name="date" class="datepicker form-control col-md-2 col-xs-12" type="date" required="required" onfocus="this.type='date'" style="height: 32.8px; margin: 5px; display: inline;"/>
																	<div class="col-md-7 col-xs-12" style="margin: 5px;">
																		<div class="btn-group btn-group-sm border" role="group" aria-label="...">
																			<button class="btn btn-light" type="button">오늘</button>
																			<button class="btn btn-light" type="button">어제</button>
																			<button class="btn btn-light" type="button">7일</button>
																			<button class="btn btn-light" type="button">1개월</button>
																			<button class="btn btn-light" type="button">3개월</button>
																			<button class="btn btn-light" type="button">6개월</button>
																			<button class="btn btn-light" type="button">1년</button>
																		</div>
																	</div>
																</td>
															</tr>
															
														</tbody>
														
													</table>
													
												</div>
											</form>
										</div>
										<!-- 검색 테이블 END -->
									</div>
									<!-- 일반 d-none END -->

									<!-- 전략 d-none START -->
									<div id="sub_strategyOrd_searchTb" class="d-none">
										<!-- 상단 테이블 START -->
										<div class="table-responsive">
											<table class="table">
												<colgroup>
													<col width="25%">
													<col width="25%">
													<col width="25%">
													<col width="25%">
												</colgroup>
												<tbody>
													<tr style="border-bottom: solid 2px #fff;">
														<th>· ID</th>
														<td>traum@traum.com</td>
														<th>· Rate of Return</th>
														<td class="text-right" style="color: green;">7.83%</td>
													</tr>
													<tr style="border-bottom: solid 2px #fff;">
														<th>· Order ID</th>
														<td>468326823367</td>
														<th>· Max Profit Ratio</th>
														<td class="text-right" style="color: green;">6.79%</td>
													</tr>
													<tr style="border-bottom: solid 2px #fff;">
														<th>· Exchange</th>
														<td>BitMex</td>
														<th>· Max Loss Ratio</th>
														<td class="text-right" style="color: red;">-4.39%</td>
													</tr>
													<tr style="border-bottom: solid 2px #fff;">
														<th>· Symbol</th>
														<td>XBTUSD</td>
														<th>· Transaction</th>
														<td class="text-right">Buy 13 / Sell 13(14 times)</td>
													</tr>
													<tr style="border-bottom: solid 2px #fff;">
														<th>· Candle size</th>
														<td>30m</td>
														<th>· Average Transaction Period</th>
														<td class="text-right">1 day 9h 39m</td>
													</tr>
													<tr style="border-bottom: solid 2px #fff;">
														<th>· Position</th>
														<td>Long(buy)</td>
														<th>· Winning Rate</th>
														<td class="text-right">42.68%</td>
													</tr>
													<tr style="border-bottom: solid 2px #fff;">
														<th>· Status</th>
														<td>Ongoing</td>
														<th>· Win / Lose</th>
														<td class="text-right">6 / 7</td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- 상단 테이블 END -->

										<!-- 중간 테이블 START -->
										<div class="row">
										
											<div class="table-responsive">
											
												<table class="table table-borderless">
												
													<colgroup>
														<col width="25%">
														<col width="12.5%">
														<col width="12.5%">
														<col width="25%">
														<col width="12.5%">
														<col width="12.5%">
													</colgroup>
													
													<thead class="text-center">
														<tr style="background-color: black;">
															<th colspan="3" style="color: #2ADCC2;">Open Strategy</th>
															<th colspan="3" style="color: #2ADCC2;">Close Strategy</th>
														</tr>
													</thead>
													
													<tbody>
													
														<tr style="border-bottom: solid 2px #fff;">
															<th class="text-center" rowspan="2">Super Trend</th>
															<td>Period</td>
															<td>7</td>
															<th class="text-center" rowspan="2"
																style="border-left: dashed 2px black;">Super Trend
															</th>
															<td>Price</td>
															<td>7</td>
														</tr>
														
														<tr style="border-bottom: solid 2px #fff;">
															<td class="pt-0">Multier</td>
															<td class="pt-0">2.3</td>
															<td class="pt-0">Multier</td>
															<td class="pt-0">2.3</td>
														</tr>
														
														<tr style="border-bottom: solid 2px #fff;">
															<th class="text-center" rowspan="4">TVW</th>
															<td>Period</td>
															<td>50</td>
															<th class="text-center" rowspan="4"
																style="border-left: dashed 2px black;">VMA</th>
															<td>Period</td>
															<td>50</td>
														</tr>
														
														<tr style="border-bottom: solid 2px #fff;">
															<td class="pt-0">Rate</td>
															<td class="pt-0">200</td>
															<td class="pt-0">Rate</td>
															<td class="pt-0">200</td>
														</tr>
														
														<tr style="border-bottom: solid 2px #fff;">
															<td class="pt-0"></td>
															<td class="pt-0"></td>
															<td class="pt-0">Trailing</td>
															<td class="pt-0">3$</td>
														</tr>
														
														<tr style="border-bottom: solid 2px #fff;">
															<td class="pt-0"></td>
															<td class="pt-0"></td>
															<td class="pt-0">Qty</td>
															<td class="pt-0">25%</td>
														</tr>
														
														<tr style="border-bottom: solid 2px #fff;">
															<td></td>
															<td></td>
															<td></td>
															<th class="text-center" style="border-left: dashed 2px black;">Stop Loss</th>
															<td></td>
															<td>5%</td>
														</tr>
														
													</tbody>
													
												</table>
												
											</div>
										</div>
										<!-- 중간 테이블 END -->

										<!-- 검색 테이블 START -->
										<div class="input-group justify-content-between">
											
											<form name="" id="" method="POST" style="width: 100%;">
												<div class="table-responsive">	
													<table class="table jambo_table bulk_action">
														
														<colgroup>
															<col width="200" />
															<col width="*" />
														</colgroup>
														
														<tbody>
														
															<tr>
																<th scope="row" class="bg-gray-100 text-center">검색</th>
																<td style="padding-bottom: 0px;">
																	<div class="input-group row mb-0">
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat">전체</label></div>
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat">등록</label></div>
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat">실행</label></div>
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat">체결</label></div>
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat">수정</label></div>
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat">중지</label></div>
																		<div class="checkbox col-xl-1 col-lg-3 col-md-4 col-sm-6 col-xs-12"><label><input type="checkbox" class="flat">취소</label></div>
																	</div>
																</td>
															</tr>
															
															<tr>
																<th scope="row" class="text-center">검색 기간</th>
																<td><input id="" name="date" class="datepicker form-control col-md-2 col-xs-12" type="date" required="required" onfocus="this.type='date'" style="height: 32.8px; margin: 5px; display: inline;"/>
																	<input id="" name="date" class="datepicker form-control col-md-2 col-xs-12" type="date" required="required" onfocus="this.type='date'" style="height: 32.8px; margin: 5px; display: inline;"/>
																	<div class="col-md-7 col-xs-12" style="margin: 5px;">
																		<div class="btn-group btn-group-sm border" role="group" aria-label="...">
																			<button class="btn btn-light" type="button">오늘</button>
																			<button class="btn btn-light" type="button">어제</button>
																			<button class="btn btn-light" type="button">7일</button>
																			<button class="btn btn-light" type="button">1개월</button>
																			<button class="btn btn-light" type="button">3개월</button>
																			<button class="btn btn-light" type="button">6개월</button>
																			<button class="btn btn-light" type="button">1년</button>
																		</div>
																	</div>
																</td>
															</tr>
															
														</tbody>
													</table>
												</div>
											</form>
										</div>
										<!-- 검색 테이블 END -->
									</div>
									<!-- 전략 d-none END -->

									<!-- 일반 주문, 전략 주문  START -->
									<div id="ordTables" class="container">
										
										<ul class="nav nav-tabs bar_tabs" id="subTab1" role="tablist">
											<li id="normalBtn" class="nav-item"><a class="nav-link active" id="normalOrd-tab" data-toggle="tab" href="#normalOrd" role="tab" aria-controls="normalOrd" aria-selected="true">일반 주문</a></li>
											<li id="strategyBtn" class="nav-item"><a class="nav-link" id="strategyOrd-tab" data-toggle="tab" href="#strategyOrd" role="tab" aria-controls="strategyOrd" aria-selected="false">전략 주문</a></li>
										</ul>

										<div class="row justify-content-end">
											<div class="input-group pt-3 col-md-4">
												<button type="button" class="btn btn-outline-success border">Excel 다운로드</button>
												<select type="select" name="" id="" class="form-control custom-select w-auto input-radius-button">
													<option value="" selected>선택</option>
													<option value="20">20개씩 보기</option>
													<option value="30">30개씩 보기</option>
													<option value="50">50개씩 보기</option>
													<option value="100">100개씩 보기</option>
													<option value="200">200개씩 보기</option>
												</select>
											</div>
										</div>

										<div class="tab-content" id="myTabContent">
											
											<!-- 일반 주문 START -->
											<div class="tab-pane fade show active" id="normalOrd" role="tabpanel" aria-labelledby="normalOrd-tab">
												<div class="table-responsive">
												
													<table id="normalOrdTable" class="table table-bordered jambo_table bulk_action">
														
														<thead class="border borderless text-center">
															
															<tr class="headings">
																<th rowspan="2" class="column-title align-middle">No</th>
																<th rowspan="2" class="column-title align-middle">주문 등록일</th>
																<th rowspan="2" class="column-title align-middle">Exchange</th>
																<th rowspan="2" class="column-title align-middle">Order ID</th>
																<th rowspan="2" class="column-title align-middle">Symbol</th>
																<th rowspan="2" class="column-title align-middle">Type</th>
																<th rowspan="2" class="column-title align-middle">Position</th>
																<th rowspan="2" class="column-title align-middle">Leverage</th>
																<th colspan="2" class="column-title border-bottom-0">Open</th>
																<th colspan="3" class="column-title border-bottom-0">Take Profit 1</th>
																<th colspan="3" class="column-title border-bottom-0">Take Profit 2</th>
																<th colspan="2" class="column-title border-bottom-0">Stop Loss</th>
																<th rowspan="2" class="column-title align-middle">Status</th>
															</tr>
															
															<tr>
																<th class="border-top-0 border-right-0">Privacy</th>
																<th class="border-top-0 border-left-0">Qty</th>
																<th class="border-top-0 border-right-0">Price</th>
																<th class="border-top-0 border-right-0 border-left-0">Qty</th>
																<th class="border-top-0 border-left-0">Trailing</th>
																<th class="border-top-0 border-right-0">Price</th>
																<th class="border-top-0 border-right-0 border-left-0">Qty</th>
																<th class="border-top-0 border-left-0">Trailing</th>
																<th class="border-top-0 border-right-0">Price</th>
																<th class="border-top-0 border-left-0">Qty</th>
															</tr>
															
														</thead>
														
														<#if normalOrderList?has_content>
														<#list normalOrderList as rMap>
														<tbody class="text-center">
														
															<tr class="even-pointer">
																<td>${rMap.no!}</td>
																<td>${rMap.orderDate!}</td>
																<td>${rMap.exchange!}</td>
																<td>${rMap.orderId!}</td>
																<td>${rMap.symbol!}</td>
																<td>${rMap.type!}</td>
																<td>${rMap.position!}</td>
																<td>${rMap.leverage!}</td>
																<td>${rMap.openPrivacy!}</td>
																<td>${rMap.openQty!}</td>
																<td>${rMap.takeProfit1Price!}</td>
																<td>${rMap.takeProfit1Qty!}</td>
																<td>${rMap.takeProfit1Trailing!}</td>
																<td>${rMap.takeProfit2Price!}</td>
																<td>${rMap.takeProfit2Qty!}</td>
																<td>${rMap.takeProfit2Trailing!}</td>
																<td>${rMap.stopLossPrice!}</td>
																<td>${rMap.stopLossQty!}</td>
																<td>${rMap.status!}</td>
															</tr>
															
														</tbody>
														</#list>
														<#else>
															<tr>
																<td colspan="19"><strong>게시물이 존재하지 않습니다.</strong></td>
															</tr>
														</#if>
														
													</table>
													
												</div>
											</div>
											<!-- 일반 주문 END -->
											
											<!-- 전략 주문 START -->
											<div class="tab-pane fade" id="strategyOrd" role="tabpanel" aria-labelledby="strategyOrd-tab">
												<div class="table-responsive">
													
													<table id="strategyOrdTable" class="table table-bordered jambo_table bulk_action text-center">
														
														<thead class="border borderless">
														
															<tr class="headings">
																<th class="column-title align-middle">No</th>
																<th class="column-title align-middle">주문 등록일</th>
																<th class="column-title align-middle">Exchange</th>
																<th class="column-title align-middle">Order ID</th>
																<th class="column-title align-middle">Symbol</th>
																<th class="column-title align-middle">QTY</th>
																<th class="column-title align-middle">Position</th>
																<th class="column-title align-middle">Candle size</th>
																<th class="column-title align-middle">Lverage</th>
																<th class="column-title align-middle">Open</th>
																<th class="column-title align-middle">Close<br>(Trriger)</th>
																<th class="column-title align-middle">Close<br>(Trailing)</th>
																<th class="column-title align-middle">Stop Loss<br>Price<br>QTY</th>
																<th class="column-title align-middle">Trans.No</th>
																<th class="column-title align-middle">Status</th>
															</tr>
															
														</thead>
														
														<tbody>
														
															<tr>
																<td>100</td>
																<td>2020-01-01<br>22:22:41
																</td>
																<td>BitMEX</td>
																<td>65131321213211</td>
																<td>XBTUSD</td>
																<td>Reservation</td>
																<td>Long(buy)</td>
																<td>30m</td>
																<td>10 X</td>
																<td>EMA</td>
																<td>EMA</td>
																<td>2%</td>
																<td>5%</td>
																<td>2</td>
																<td>Ongoing</td>
															</tr>
															
														</tbody>
														
													</table>
													
												</div>
											</div>
											<!-- 전략 주문 END -->
										</div>
									</div>
									<!-- 일반 주문, 전략 주문  END -->

									<!-- row 클릭 시 일반 주문, 전략 주문 -->
									<div id="sub_ordTables" class="container d-none">
										
										<ul class="nav nav-tabs bar_tabs" id="subTab1" role="tablist">
											<li class="nav-item"><a class="nav-link active" id="sub_normalOrd-tab" data-toggle="tab" href="#sub_normalOrd" role="tab" aria-controls="sub_normalOrd" aria-selected="true">일반 주문</a></li>
											<li class="nav-item"><a class="nav-link" id="sub_strategyOrd-tab" data-toggle="tab" href="#sub_strategyOrd" role="tab" aria-controls="sub_strategyOrd" aria-selected="false">전략 주문</a></li>
										</ul>
										
										<div class="row justify-content-end">
											<div class="input-group pt-3 col-md-4">
												<button type="button" class="btn btn-light border">Excel 다운로드</button>
												<select type="select" name="" id="" class="form-control custom-select w-auto input-radius-button">
													<option value="20">20개 씩 보기</option>
													<option value="30">30개 씩 보기</option>
													<option value="50">50개 씩 보기</option>
													<option value="100">100개 씩 보기</option>
													<option value="200">200개 씩 보기</option>
												</select>
											</div>
										</div>
										
										<div class="tab-content" id="myTabContent">
										
											<!-- 일반 주문 상세 START -->
											<div class="tab-pane fade show active" id="sub_normalOrd" role="tabpanel" aria-labelledby="sub_normalOrd-tab">
												
												<div class="table-responsive">
												
													<table class="table table-bordered jambo_table bulk_action text-center">
														
														<thead class="border borderless">
															
															<tr class="headings">
																<th rowspan="2" class="column-title align-middle">No</th>
																<th rowspan="2" class="column-title align-middle">주문 등록일</th>
																<th rowspan="2" class="column-title align-middle">단계</th>
																<th colspan="2" class="column-title border-bottom-0">Open</th>
																<th colspan="4" class="column-title border-bottom-0">Take Profit 1</th>
																<th colspan="4" class="column-title border-bottom-0">Take Profit 2</th>
																<th colspan="2" class="column-title border-bottom-0">Stop Loss</th>
																<th rowspan="2" class="column-title align-middle">비고</th>
															</tr>
															
															<tr>
																<th class="border-top-0 border-right-0">Privacy</th>
																<th class="border-top-0 border-left-0">Qty</th>
																<th class="border-top-0 border-right-0">Price</th>
																<th class="border-top-0 border-right-0 border-left-0">Qty</th>
																<th class="border-top-0 border-right-0 border-left-0">Trailing</th>
																<th class="border-top-0 border-left-0">Trailing Qty</th>
																<th class="border-top-0 border-right-0">Price</th>
																<th class="border-top-0 border-right-0 border-left-0">Qty</th>
																<th class="border-top-0 border-right-0 border-left-0">Trailing</th>
																<th class="border-top-0 border-left-0">Trailing Qty</th>
																<th class="border-top-0 border-right-0">Privacy</th>
																<th class="border-top-0 border-left-0">Qty</th>
															</tr>
															
														</thead>
														
														<tbody>
														
															<tr>
																<td>100</td>
																<td>2020-01-01 22:22:41</td>
																<td>체결</td>
																<td>-</td>
																<td>-</td>
																<td>-</td>
																<td>-</td>
																<td>-</td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td>8220.5</td>
																<td>1,000</td>
																<td>Sell now</td>
															</tr>
															
															<tr>
																<td>99</td>
																<td>2020-01-01 22:22:41</td>
																<td>실행</td>
																<td>-</td>
																<td>-</td>
																<td>-</td>
																<td>-</td>
																<td>-</td>
																<td></td>
																<td>8,300.5</td>
																<td>500</td>
																<td>0</td>
																<td></td>
																<td>-</td>
																<td>-</td>
																<td>Cancel</td>
															</tr>
															
															<tr>
																<td>98</td>
																<td>2020-01-01 16:55:10</td>
																<td>체결</td>
																<td>-</td>
																<td>-</td>
																<td>8,100.5</td>
																<td>250</td>
																<td>250</td>
																<td></td>
																<td>-</td>
																<td>-</td>
																<td>-</td>
																<td></td>
																<td>-</td>
																<td>-</td>
																<td></td>
															</tr>
															
															<tr>
																<td>97</td>
																<td>2020-01-01 16:55:01</td>
																<td>실행</td>
																<td>-</td>
																<td>-</td>
																<td>8,100.5</td>
																<td>250</td>
																<td>250</td>
																<td></td>
																<td>-</td>
																<td>-</td>
																<td>-</td>
																<td></td>
																<td>-</td>
																<td>-</td>
																<td></td>
															</tr>
															
															<tr>
																<td>96</td>
																<td>2020-01-01 15:45:41</td>
																<td>수정</td>
																<td>●</td>
																<td>●</td>
																<td>○</td>
																<td>○</td>
																<td>○</td>
																<td></td>
																<td>○</td>
																<td>○</td>
																<td>○</td>
																<td></td>
																<td>○</td>
																<td>○</td>
																<td></td>
															</tr>
															
														</tbody>
														
													</table>
													
												</div>
												
												<!-- 페이지  -->
												<div>
													<nav aria-label="Page navigation">
														<ul class="pagination justify-content-center">
															<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
															<li class="page-item"><a class="page-link" href="#">1</a></li>
															<li class="page-item"><a class="page-link" href="#">2</a></li>
															<li class="page-item"><a class="page-link" href="#">3</a></li>
															<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
														</ul>
													</nav>
												</div>
												<!-- 페이지  -->
											
											</div>
											<!-- 일반 주문 상세 END -->
											
											<!-- 전략 주문 상세 START -->
											<div class="tab-pane fade" id="sub_strategyOrd"
												role="tabpanel" aria-labelledby="sub_strategyOrd-tab">
												<div class="table-responsive">
													
													<table class="table table-bordered jambo_table bulk_action text-center">
														
														<thead class="border borderless">
															
															<tr class="headings">
																<th class="column-title align-middle">No</th>
																<th class="column-title align-middle">주문 등록일</th>
																<th class="column-title align-middle">Exchange</th>
																<th class="column-title align-middle">Order ID</th>
																<th class="column-title align-middle">Symbol</th>
																<th class="column-title align-middle">Type</th>
																<th class="column-title align-middle">Position</th>
																<th class="column-title align-middle">Candle size</th>
																<th class="column-title align-middle">Lverage</th>
																<th class="column-title align-middle">답계</th>
																<th class="column-title align-middle">Open</th>
																<th class="column-title align-middle">Close<br>(Trriger)</th>
																<th class="column-title align-middle">Close<br>(Trailing)</th>
																<th class="column-title align-middle">Stop Loss</th>
																<th class="column-title align-middle">비고</th>
															</tr>
															
														</thead>
														
														<tbody>
														
															<tr>
																<td>100</td>
																<td>2020-01-01 22:22:41</td>
																<td>BitMEX</td>
																<td>65131321213211</td>
																<td>XBTUSD</td>
																<td>Reservation</td>
																<td>Long(buy)</td>
																<td>30m</td>
																<td>10 X</td>
																<td>체결</td>
																<td>-</td>
																<td>-</td>
																<td></td>
																<td>7220.5</td>
																<td>Sell now</td>
															</tr>
															
															<tr>
																<td>99</td>
																<td>2020-01-01 22:22:22</td>
																<td>BitMEX</td>
																<td>65131321213211</td>
																<td>XBTUSD</td>
																<td>Reservation</td>
																<td>Long(buy)</td>
																<td>30m</td>
																<td>10 X</td>
																<td>실행</td>
																<td>-</td>
																<td>-</td>
																<td>8330.0</td>
																<td>-</td>
																<td>Cancel</td>
															</tr>
															
															<tr>
																<td>98</td>
																<td>2020-01-01 16:55:10</td>
																<td>BitMEX</td>
																<td>65131321213211</td>
																<td>XBTUSD</td>
																<td>Reservation</td>
																<td>Long(buy)</td>
																<td>30m</td>
																<td>10 X</td>
																<td>체결</td>
																<td>-</td>
																<td>8100.5</td>
																<td>-</td>
																<td>-</td>
																<td></td>
															</tr>
															
															<tr>
																<td>97</td>
																<td>2020-01-01 16:55:01</td>
																<td>BitMEX</td>
																<td>65131321213211</td>
																<td>XBTUSD</td>
																<td>Reservation</td>
																<td>Long(buy)</td>
																<td>30m</td>
																<td>10 X</td>
																<td>실행</td>
																<td>-</td>
																<td>8100.5</td>
																<td>-</td>
																<td>-</td>
																<td></td>
															</tr>
															
															<tr>
																<td>96</td>
																<td>2020-01-01 15:45:41</td>
																<td>BitMEX</td>
																<td>65131321213211</td>
																<td>XBTUSD</td>
																<td>Reservation</td>
																<td>Long(buy)</td>
																<td>30m</td>
																<td>10 X</td>
																<td>수정</td>
																<td>●</td>
																<td>○</td>
																<td>○</td>
																<td>○</td>
																<td></td>
															</tr>
															
														</tbody>
														
													</table>
													
												</div>
											</div>
											<!-- 전략 주문 상세 END -->
										</div>
									</div>
									<!-- 클릭 시 일반 주문, 전략 주문 END -->
								</div>
								<!-- 주문 기록 탭 END -->

								<!-- 전략 관리 탭 -->
								<div class="tab-pane fade" id="strategy" role="tabpanel" aria-labelledby="strategy-tab">
									<div class="x_panel" style="padding-top: 30px;">
										<!-- 전략 관리 기존 탭 -->
										<div id="strTab">
											<div class="input-group justify-content-between">
												
												<form name="" id="" method="POST" style="width: 100%;">
													<div class="container">
														<div class="table-responsive">
														
															<table class="table jambo_table bulk_action">
																
																<colgroup>
																	<col width="200" />
																	<col width="*" />
																</colgroup>
																
																<tbody>
																
																	<tr>
																		<th scope="row" class="text-center">검색</th>
																		<td><input type="text"
																			class="form-control col-md-9" placeholder="전략명">
																			<div class="col-md-1"></div>
																			<button type="button"
																				class="btn btn-success btn-sm col-md-2 m-0 btn-frm">검색</button>
																			<!-- <div class="row">
                                              <input type="text" class="form-control col-md-5 ml-2" placeholder="전략명">
                                              <span class="col-md-6">
                                                <button type="button" class="btn btn-success col-md-4 col-xs-4">검색</button>
                                              </span>
                                            </div> --></td>
																	</tr>
																	
																	<tr>
																		<th scope="row" class="text-center">Position</th>
																		<td>
																			<div class="input-group row mb-0 text-left">
																				<div class="checkbox col-md-3 col-sm-6 col-xs-12">
																					<label style="margin: 4px;"> <input
																						type="checkbox" class="flat" /> 전체
																					</label>
																				</div>
																				<div class="checkbox col-md-3 col-sm-6 col-xs-12">
																					<label style="margin: 4px;"> <input
																						type="checkbox" class="flat" /> Long(buy)
																					</label>
																				</div>
																				<div class="checkbox col-md-3 col-sm-6 col-xs-12">
																					<label style="margin: 4px;"> <input
																						type="checkbox" class="flat" /> Short(Sell)
																					</label>
																				</div>
																			</div>
																		</td>
																	</tr>
																	
																	<tr>
																		<th scope="row" class="text-center align-middle">삭제
																			여부</th>
																		<td>
																			<div class="input-group row mb-0 text-left">
																				<div class="checkbox col-md-3 col-sm-6 col-xs-12">
																					<label style="margin: 4px;"> <input
																						type="checkbox" class="flat" /> 전체
																					</label>
																				</div>
																				<div class="checkbox col-md-3 col-sm-6 col-xs-12">
																					<label style="margin: 4px;"> <input
																						type="checkbox" class="flat" /> Long(buy)
																					</label>
																				</div>
																				<div class="checkbox col-md-3 col-sm-6 col-xs-12">
																					<label style="margin: 4px;"> <input
																						type="checkbox" class="flat" /> Short(Sell)
																					</label>
																				</div>
																			</div>
																		</td>
																	</tr>
																	
																	<tr>
																		<th scope="row" class="text-center align-middle">생성일</th>
																		<td>
																			<div class="row">
																				<div class="col-md-12">
																					<input id="" name="date" class="datepicker form-control col-md-2 col-xs-12" type="date" required="required" onfocus="this.type='date'" style="height: 32.8px;">
																					<span class="text-center col-md-1 col-xs-12">~</span>
																					<input id="" name="date" class="datepicker form-control col-md-2 col-xs-12" type="date" required="required" onfocus="this.type='date'" style="height: 32.8px;">
																				</div>
																			</div>
																		</td>
																	</tr>
																	
																</tbody>
															</table>
														</div>
													</div>
												</form>
											</div>
											<!-- 전략 관리 - 하단 테이블 -->
											<div id="">
											
												<!-- Excel 다운로드, Select Btn -->
												<div class="input-group justify-content-end">
													<button type="button" class="btn btn-outline-success border">Excel 다운로드</button>
													<div class="dropdown no-arrow">
														<select type="select" class="custom-select w-auto input-radius-button" name="" id="">
															<option value="" selected>선택</option>
															<option value="">20개씩 보기</option>
															<option value="">30개씩 보기</option>
															<option value="">50개씩 보기</option>
															<option value="">100개씩 보기</option>
															<option value="">200개씩 보기</option>
														</select>
													</div>
												</div>

												<!-- 테이블 START -->
												<div class="table-responsive">
													<table id="str_bottomTable"
														class="table jambo_table bulk_action text-center">
														<thead>
															<tr class="headings">
																<th class="column-title">No</th>
																<th class="column-title">생성일</th>
																<th class="column-title">삭제일</th>
																<th class="column-title">Exchange</th>
																<th class="column-title">전략명</th>
																<th class="column-title">Symbol</th>
																<th class="column-title">Position</th>
																<th class="column-title">Candle size</th>
																<th class="column-title">Open</th>
																<th class="column-title">Close(Trigger)</th>
																<th class="column-title">Close<br>(Trailing)
																</th>
																<th class="column-title">Stop Loss</th>
																<th class="column-title">ROR</th>
															</tr>
														</thead>

														<tbody class="text-center">
															<tr class="even pointer">
																<td>100</td>
																<td>2020-01-01<br>15:15:15
																</td>
																<td>2020-01-01<br>15:15:15
																</td>
																<td>BitMEX</td>
																<td>상승 후 조정</td>
																<td>XBTUSD</td>
																<td>Long(Buy)</td>
																<td>60m</td>
																<td>EMA</td>
																<td>EMA</td>
																<td>-</td>
																<td>-</td>
																<td>37%</td>
															</tr>
															<tr class="odd pointer">
																<td>100</td>
																<td>2020-01-01<br>15:15:15
																</td>
																<td>2020-01-01<br>15:15:15
																</td>
																<td>BitMEX</td>
																<td>상승 후 조정</td>
																<td>XBTUSD</td>
																<td>Long(Buy)</td>
																<td>60m</td>
																<td>EMA</td>
																<td>EMA</td>
																<td>2%</td>
																<td>5%</td>
																<td>37%</td>
															</tr>
														</tbody>
													</table>
												</div>
												<!--테이블 END-->

												<!-- 번호 페이지 넘김 START -->
												<div class="mt-2">
													<nav aria-label="Page navigation">
														<ul class="pagination justify-content-center">
															<li class="page-item"><a class="page-link" href="#"
																aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
															</a></li>
															<li class="page-item"><a class="page-link" href="#">1</a></li>
															<li class="page-item"><a class="page-link" href="#">2</a></li>
															<li class="page-item"><a class="page-link" href="#">3</a></li>
															<li class="page-item"><a class="page-link" href="#"
																aria-label="Next"> <span aria-hidden="true">&raquo;</span>
															</a></li>
														</ul>
													</nav>
												</div>
												<!-- 번호 페이지 넘김 END -->
												
											</div>
											<!-- 하단 테이블 END -->
										</div>
										<!-- 전략 관리 기존 탭 END -->
										
										<!-- Sub 하단 전략 관리 탭 -->
										<div id="sub_strTab" class="d-none">
											<!-- 상단 1,2번 테이블 -->
											<div class="row">
												<div class="col-md-12 col-sm-12">
													<!-- 1번 테이블 -->
													<div class="col-md-6 col-xs-12">
														<div class="table-responsive">
															<table class="table table-borderless">
																<tbody>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· Order ID</td>
																		<td>468326823367</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· 생성일</td>
																		<td>2020-01-01 15:45:41</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· 삭제일</td>
																		<td>-</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· Exchange</td>
																		<td>BitMEX</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· 전략명</td>
																		<td>이평매매 15m</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· Symbol</td>
																		<td>XBTUSD</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· Position</td>
																		<td>Long(buy)</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· Candle size</td>
																		<td>15m</td>
																	</tr>
																	<tr></tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· Rate of Return</td>
																		<td style="color: green;">37.31 %</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· Max Profit Ratio</td>
																		<td style="color: green;">58.92 %</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· Max Loss Ratio</td>
																		<td style="color: red;">-13.09 %</td>
																	</tr>
																	<tr></tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· Transaction</td>
																		<td>Open 6 / Close 6(12 times)</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· Average Transaction Period</td>
																		<td>1 day 10h 52m</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· Winning Rate</td>
																		<td>66.00%</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· Win / Lose</td>
																		<td>10/2</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>· Profit And Loss</td>
																		<td>35 USDT</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<!-- 1번 테이블 END -->

													<!-- 2번 테이블 -->
													<div class="col-md-6 col-xs-12">
														<div class="table-responsive">
															<table class="table table-borderless">
																<colgroup>
																	<col width="50%">
																	<col width="30%">
																	<col width="20%">
																</colgroup>
																<tbody>
																	<tr style="border-bottom: solid 2px #fff;">
																		<th scope="col" colspan="3"
																			style="color: #2ADCC2; background-color: black;">Open</th>
																	</tr>
																	<tr>
																		<th class="text-center align-middle" rowspan="3"
																			style="border-bottom: dashed 2px #2ADCC2;">MACD</th>
																		<td style="border-bottom: solid 2px #fff;">Fast
																			MA Period</td>
																		<td style="border-bottom: solid 2px #fff;">12</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>Slow MA Period</td>
																		<td>26</td>
																	</tr>
																	<tr style="border-bottom: dashed 2px #2ADCC2;">
																		<td>Signal Period</td>
																		<td>9</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<th class="text-center align-middle" rowspan="2">TVW</th>
																		<td>Peroid</td>
																		<td>50</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>Rate</td>
																		<td>200</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<th scope="col" colspan="3"
																			style="color: #2ADCC2; background-color: black;">Close</th>
																	</tr>
																	<tr style="border-bottom: dashed 2px #fff;">
																		<th class="text-center align-middle" rowspan="3"
																			style="border-bottom: dashed 2px #2ADCC2;">MACD</th>
																		<td>Fast MA Period</td>
																		<td>12</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<td>Slow MA Period</td>
																		<td>26</td>
																	</tr>
																	<tr>
																		<td style="border-bottom: dashed 2px #2ADCC2;">Signal
																			Period</td>
																		<td style="border-bottom: dashed 2px #2ADCC2;">9</td>
																	</tr>
																	<tr>
																		<th class="text-center align-middle" rowspan="2"
																			style="border-bottom: dashed 2px #2ADCC2;">TVW</th>
																		<td style="border-bottom: solid 2px #fff;">Peroid</td>
																		<td style="border-bottom: solid 2px #fff;">50</td>
																	</tr>
																	<tr>
																		<td style="border-bottom: dashed 2px #2ADCC2;">Rate</td>
																		<td style="border-bottom: dashed 2px #2ADCC2;">200</td>
																	</tr>
																	<tr>
																		<th class="text-center align-middle" rowspan="2"
																			style="border-bottom: dashed 2px #2ADCC2;">Trailing</th>
																		<td style="border-bottom: solid 2px #fff;">Trailing</td>
																		<td style="border-bottom: solid 2px #fff;">2%</td>
																	</tr>
																	<tr>
																		<td style="border-bottom: dashed 2px #2ADCC2;">Trailing
																			Qty</td>
																		<td style="border-bottom: dashed 2px #2ADCC2;">25%</td>
																	</tr>
																	<tr style="border-bottom: solid 2px #fff;">
																		<th class="text-center align-middle">Stop Loss</th>
																		<td></td>
																		<td>3%</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
													<!-- 2번 테이블 END -->
												</div>
											</div>
											<!-- 상단 1,2번 테이블 END -->

											<!-- Back Testing 버튼 START -->
											<div class="text-center mb-2">
												<button id="openBtn" type="button"
													class="btn btn-success btn-lg" style="color: black;">
													Backtesting 거래 내역 열기<span class="fa fa-angle-double-down"></span>
												</button>
											</div>
											<!-- Back Testing 버튼 START -->

											<div id="bottomInfo"
												class="container-fluid bg-secondary rounded d-none">
												<!-- Excel 다운로드, Select Btn -->
												<div class="input-group justify-content-end pt-3">
													<!-- <button type="button" class="btn btn-light border">Excel 다운로드</button> -->
													<div class="dropdown no-arrow">
														<select type="select" class="custom-select w-auto input-radius-button" name="" id="">
															<option value="" selected>20개씩 보기</option>
															<option value="">30개씩 보기</option>
															<option value="">50개씩 보기</option>
															<option value="">100개씩 보기</option>
															<option value="">200개씩 보기</option>
														</select>
													</div>
												</div>
												
												<!-- 테이블 -->
												<div class="table-responsive text-center">
												
													<table class="table jambo_table bulk_action text-center">
													
														<thead>
														
															<tr class="headings">
																<th class="column-title align-middle" rowspan="2">No</th>
																<th class="column-title align-middle" rowspan="2">Win
																	/ Loss</th>
																<th class="column-title align-middle" rowspan="2">Profit</th>
																<th class="column-title align-middle" rowspan="2">Rate
																	of Returns</th>
																<th class="column-title border-bottom-0" colspan="2">Transaction</th>
															</tr>
															
															<tr>
																<th class="border-top-0">Time</th>
																<th class="border-top-0">Price</th>
															</tr>
															
														</thead>
														
														<tbody class="bg-light">
														
															<tr>
																<td>100</td>
																<td>Lose</td>
																<td>-0.8 USDT</td>
																<td style="color: red;">-0.61 %</td>
																<td style="color: green;">2020-05-28 19:08:43</td>
																<td style="color: green;">9,192.68</td>
															</tr>
															
															<tr>
																<td>99</td>
																<td>Win</td>
																<td>3.43 USDT</td>
																<td style="color: green;">2.59 %</td>
																<td style="color: red;">2020-05-28 19:08:43</td>
																<td style="color: red;">9,192.68</td>
															</tr>

															<tr>
																<td>100</td>
																<td>Lose</td>
																<td>-0.8 USDT</td>
																<td style="color: red;">-0.61 %</td>
																<td style="color: green;">2020-05-28 19:08:43</td>
																<td style="color: green;">9,192.68</td>
															</tr>

															<tr>
																<td>99</td>
																<td>Win</td>
																<td>3.43 USDT</td>
																<td style="color: green;">2.59 %</td>
																<td style="color: red;">2020-05-28 19:08:43</td>
																<td style="color: red;">9,192.68</td>
															</tr>

															<tr>
																<td>100</td>
																<td>Lose</td>
																<td>-0.8 USDT</td>
																<td style="color: red;">-0.61 %</td>
																<td style="color: green;">2020-05-28 19:08:43</td>
																<td style="color: green;">9,192.68</td>
															</tr>

															<tr>
																<td>99</td>
																<td>Win</td>
																<td>3.43 USDT</td>
																<td style="color: green;">2.59 %</td>
																<td style="color: red;">2020-05-28 19:08:43</td>
																<td style="color: red;">9,192.68</td>
															</tr>

														</tbody>

													</table>

												</div>
												<!--테이블 END-->

												<!-- 번호 페이지 넘김 START -->
												<div class="mt-2 pb-2">
													<nav aria-label="Page navigation">
														<ul class="pagination justify-content-center">
															<li class="page-item"><a class="page-link" href="#"
																aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
															</a></li>
															<li class="page-item"><a class="page-link" href="#">1</a></li>
															<li class="page-item"><a class="page-link" href="#">2</a></li>
															<li class="page-item"><a class="page-link" href="#">3</a></li>
															<li class="page-item"><a class="page-link" href="#"
																aria-label="Next"> <span aria-hidden="true">&raquo;</span>
															</a></li>
														</ul>
													</nav>
												</div>
												<!-- 번호 페이지 넘김 END -->

											</div>

										</div>
										<!-- Sub 하단 전략 관리 탭  END -->
									</div>

								</div>
								<!--전략 관리 탭 END-->

								<!-- API 관리 탭 START -->
								<div class="tab-pane fade" id="apiControl" role="tabpanel" aria-labelledby="apiControl-tab">
									<div class="x_panel" style="padding-top: 30px;">
										<div class="input-group justify-content-between">
											<span class="pt-3">총 <span style="color: red;">30</span>건</span>
											<button type="button" class="btn btn-outline-success border">Excel 다운로드</button>
										</div>
										
										<!-- 테이블 END -->
										<div class="table-responsive">
											<table class="table jambo_table bulk_action text-center">
											
												<thead>
													<tr class="headings">
														<th>No.</th>
														<th>일시</th>
														<th>Exchange</th>
														<th>Telegram ID</th>
														<th>구분</th>
													</tr>
												</thead>

												<tbody>
													<tr class="even pointer">
														<td>100</td>
														<td>2020-01-01 22:22:41</td>
														<td>BitMEX</td>
														<td>telegram</td>
														<td>등록</td>
													</tr>
													
												</tbody>
												
											</table>
										</div>
										<!-- 테이블 END -->
										
										<!-- 번호 페이지 넘김 -->
										<div>
											<nav aria-label="Page navigation">
												<ul class="pagination justify-content-center">
													<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
													<li class="page-item"><a class="page-link" href="#">1</a></li>
													<li class="page-item"><a class="page-link" href="#">2</a></li>
													<li class="page-item"><a class="page-link" href="#">3</a></li>
													<li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
												</ul>
											</nav>
										</div>
									</div>
								</div>
								<!-- API 관리 탭 END -->
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal END -->
	
	<!-- Block Modal START -->
	<div class="modal" id="baseConfirmModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

				<div class="modal-body">
					<div class="container text-center">
						<div class="text-left mb-4"><span><b>Confirm</b></span></div>
						<span>ID <a href="" style="color: blue;">traum@traum.com</a> 를 블럭하시겠습니까?</span>
						<div class="row justify-content-around mt-5">
							<button id="closeCancelBtn" type="button" class="btn btn-outline-secondary btn-sm col-md-5" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-outline-danger btn-sm col-md-5">Block</button>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<!-- Block Modal END -->
	
</div>
<!-- Right Column END -->