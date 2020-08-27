<script>
	$(document).ready(function() {	
		$("#nothing").hide();
		$("#stOrder-table").hide();
		console.log($('#dfOrder-tab').hasClass('active'))
		$('#dfOrder-tab').click(function() {
			$("#stOrder-table").hide();
			$("#dfOrder-table").show();
		});

		$('#stOrder-tab').click(function() {
			$("#dfOrder-table").hide();
			$("#stOrder-table").show();
		});

	})

	
	function fn_search(){
		$("#defaultSearch").prop("action", "/log/orderLog");
		$("#detailSearch").prop("action", "/log/orderLog");
		console.log($('#searchID').val());
		formSubmit("defaultSearch");
		formSubmit("detailSearch");
	}
	
/* search resources
 * 
 * 	checkbox
 * 		defaultSearch
 * 			searchID
 * 			searchOdr
 * 		detailSearch
 * 			name="exchange" [binance , bitmex]
 * 			name="type" 	[basic, position, reservation, horizontal, trendLine]
 * 			name="position" [long , short]
 * 			name="status" 	[onGoing, pause]
 * 			name="cndlSize" [15m, 30m, 60m, 4h, 1d]
 * 		
 * 	select 
 * 		name ="symbol" [exc, excName]
 */
	
</script>
<script type="text/javascript">
	//날짜 객체 받아서 문자열로 리턴하는 함수
	function getDateStr(myDate) {
		return (myDate.getFullYear() + '-' + (myDate.getMonth() + 1) + '-' + myDate
				.getDate())
	}

	function getToday(){
		var nowDate = new Date();
		var nowYear = nowDate.getFullYear();
		var nowMonth = nowDate.getMonth() + 1;
		var nowDay = nowDate.getDate();
		
		if(nowMonth < 10)
			nowMonth = "0" + nowMonth;
		if(nowDay < 10)
			nowDay = "0" + nowDay;
		
		var todayDate = nowYear + "-" + nowMonth + "-" + nowDay;
		return todayDate;
	}
	//오늘 날짜를 문자열로 반환
	function today() {
		$("#startDt").val(getToday())
		$("#endDt").val(getToday())
	}

	//어제 날짜 반환
	function yesterday() {
		var nowDate = new Date();
		var weekDate = nowDate.getTime() - (24 * 60 * 60 * 1000);
		nowDate.setTime(weekDate);
		
		var weekYear = nowDate.getFullYear();
		var weekMonth = nowDate.getMonth() + 1;
		var weekDay = nowDate.getDate();
		
		if(weekMonth < 10)
			weekMonth = "0" + weekMonth;
		if(weekDate < 10)
			weekDay = "0" + weekDay;
		
		var resultDate = weekYear + "-" + weekMonth + "-" + weekDay;
		$("#startDt").val(resultDate);
		$("#endDt").val(getToday());
	}

	//오늘로부터 7일전 날짜 반환
	function lastWeek() {
		var nowDate = new Date();
		var monthDate = nowDate.getTime() - (7 * 24 * 60 * 60 * 1000);
		nowDate.setTime(monthDate);
		
		var monthYear = nowDate.getFullYear();
		var monthMonth = nowDate.getMonth() + 1;
		var monthDay = nowDate.getDate();
		
		if(monthMonth < 10)
			monthMonth = "0" + monthMonth;
		if(monthDay < 10)
			monthDay = "0" + monthDay;
		
		var resultDate = monthYear + "-" + monthMonth + "-" + monthDay;
		$("#startDt").val(resultDate);
		$("#endDt").val(getToday());
	}

	//오늘로부터 1개월전 날짜 변환
	function lastMonth() {
		var nowDate = new Date();
		var weekDate = nowDate.getTime() - (30 * 24 * 60 * 60 * 1000);
		nowDate.setTime(weekDate);
		
		var weekYear = nowDate.getFullYear();
		var weekMonth = nowDate.getMonth() + 1;
		var weekDay = nowDate.getDate();
		
		if(weekMonth < 10)
			weekMonth = "0" + weekMonth;
		if(weekDay < 10)
			weekDay = "0" + weekDay;
		
		var resultDate = weekYear + "-" + weekMonth + "-" + weekDay;
		$("#startDt").val(resultDate);
		$("#endDt").val(getToday());
	}

	//오늘로부터 3개월전 날짜 변환
	function lastThreeMonth() {
		var nowDate = new Date();
		var monthDate = nowDate.getTime() - (91 * 24 * 60 * 60 * 1000);
		nowDate.setTime(monthDate);
		
		var monthYear = nowDate.getFullYear();
		var monthMonth = nowDate.getMonth() + 1;
		var monthDay = nowDate.getDate();
		
		if(monthMonth < 10)
			monthMonth = "0" + monthMonth;
		if(monthDay < 10)
			monthDay = "0" + monthDay;
		
		var resultDate = monthYear + "-" + monthMonth + "-" + monthDay;
		$("#startDt").val(resultDate);
		$("#endDt").val(getToday());
	}

	//오늘로부터 6개월전 날짜 변환
	function lastSixMonth() {
		var nowDate = new Date();
		var monthDate = nowDate.getTime() - (182 * 24 * 60 * 60 * 1000);
		nowDate.setTime(monthDate);
		
		var monthYear = nowDate.getFullYear();
		var monthMonth = nowDate.getMonth() + 1;
		var monthDay = nowDate.getDate();
		
		if(monthMonth < 10)
			monthMonth = "0" + monthMonth;
		if(monthDay < 10)
			monthDay = "0" + monthDay;
		
		var resultDate = monthYear + "-" + monthMonth + "-" + monthDay;
		$("#startDt").val(resultDate);
		$("#endDt").val(getToday());
	}

	//오늘로부터 1년전 날짜 변환
	function lastYear() {
		var nowDate = new Date();
		var monthDate = nowDate.getTime() - (365 * 24 * 60 * 60 * 1000);
		nowDate.setTime(monthDate);
		
		var monthYear = nowDate.getFullYear();
		var monthMonth = nowDate.getMonth() + 1;
		var monthDay = nowDate.getDate();
		
		if(monthMonth < 10)
			monthMonth = "0" + monthMonth;
		if(monthDay < 10)
			monthDay = "0" + monthDay;
		
		var resultDate = monthYear + "-" + monthMonth + "-" + monthDay;
		$("#startDt").val(resultDate);
		$("#endDt").val(getToday());
	}
</script>
<div class="right_col" role="main">
	<div class="page-title">
		<div class="title_left">
			<h3>주문 로그</h3>
		</div>
	</div>
	<div class="x_panel" style="padding-top: 30px;">
		<!-- searching option -->
		<div class="input-group justify-content-between">
			<form name="defaultSearch" id="defaultSearch" method="POST" style="width: 100%;">
				<div class="table-responsive">
					<table class="table jambo_table bulk_action">
						<colgroup>
							<col width="200" />
							<col width="60%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="bg-gray-100 text-center">ID 검색</th>
								<td><input type="text" id="searchID" name="searchID"
								value="${searchID}" class="form-control" /></td>
								<td rowspan="2">
									<button type="button" onclick="fn_search()" class="btn btn-success wd100 btn-sm-10">검색</button>
								</td>
							</tr>
							<tr>
								<th scope="row" class="bg-gray-100 text-center">Order ID 검색</th>
								<td><input type="text" id="searchOdr" name="searchOdr"
								value="${searchOdr}" class="form-control" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
		<!-- detail searching option -->
		<div style='display: inline-block; width: 100%;'>
			<ul class="nav navbar-left panel_toolbox" style="float: left !important;">
				<li><a class="collapse-link collapsed" data-target="#detailcon" aria-expanded="false" aria-controls="datailcon"> <span
						style="font-weight: 700;">상세검색 펼침</span> <i
						class="fa fa-chevron-down"></i></a></li>
			</ul>
			<div class="x_content collapse" id="detailcon">
				<form name="detailSearch" id="detailSearch" method="POST"
					style="width: 100%;">
					<div class="table-responsive">
						<table class="col-sm-12 col-md-12 table jambo_table bulk_action"
							style="width: 100%;">
							<colgroup>
								<col width="200" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr class="even pointer">
									<th scope="row" class="bg-gray-100 text-center">Exchange</th>
									<td>
										<div class="input-group row mb-0 text-left">
											<div class="checkbox col-md-3 col-sm-6 col-xs-12">
												<label style="margin: 4px;">
													<input name="exchange" value="all" type="checkbox" class="flat" /> 전체
												</label>
											</div>
											<div class="checkbox col-md-3 col-sm-6 col-xs-12">
												<label style="margin: 4px;">
													<input name="exchange" value="1" type="checkbox" class="flat" /> Binance
												</label>
											</div>
											<div class="checkbox col-md-3 col-sm-6 col-xs-12">
												<label style="margin: 4px;">
													<input name="exchange" value="2" type="checkbox" class="flat" /> BitMEX
												</label>
											</div>
										</div>
									</td>
								</tr>
								<tr class="odd pointer">
									<th scope="row" class="bg-gray-100 text-center">Symbol</th>
									<td>
										<div class="select_wrap length2">
											<select name="symbol" id="exc" class="form-control">
												<option>거래소</option>
											</select>
											<select name="symbol" id="excName" class="form-control">
												<option>XBTUSD</option>
											</select>
										</div>
									</td>
								</tr>
								<tr class="even pointer">
									<th scope="row" class="bg-gray-100 text-center">Type</th>
									<td>
										<div class="input-group row mb-0 text-left">
											<div class="checkbox col-md-3 col-sm-4 col-xs-12">
												<label id="chk_1" style="margin: 4px;"> 
												<input name="type" value="all"	type="checkbox" class="flat"> 전체
												</label>
											</div>
											<div class="checkbox col-md-3 col-sm-4 col-xs-12">
												<label id="chk_2" style="margin: 4px;">
												<input name="type" value="1" type="checkbox" class="flat"> Basic
												</label>
											</div>
											<div class="checkbox col-md-3 col-sm-4 col-xs-12">
												<label id="chk_3" style="margin: 4px;"> 
												<input name="type" value="2" type="checkbox" class="flat"> Position
												</label>
											</div>
											<div class="checkbox col-md-3 col-sm-4 col-xs-12">
												<label id="chk_4" style="margin: 4px;">
												<input name="type" value="3" type="checkbox" class="flat"> Reservation
												</label>
											</div>
											<div class="checkbox col-md-3 col-sm-4 col-xs-12">
												<label id="chk_5" style="margin: 4px;"></label>
												<input name="type" value="4" type="checkbox" class="flat"> Horizontal
												</label>
											</div>
											<div class="checkbox col-md-3 col-sm-4 col-xs-12">
												<label id="chk_6" style="margin: 4px;"> 
												<input name="type" value="5" type="checkbox" class="flat"> Trend Line
												</label>
											</div>
										</div>
									</td>
								</tr>
								<tr class="odd pointer">
									<th scope="row" class="bg-gray-100 text-center">Position</th>
									<td>
										<div class="input-group row mb-0 text-left">
											<div class="checkbox col-md-3 col-sm-6 col-xs-12">
												<label style="margin: 4px;">
												<input name="postion" type="checkbox" value="all" class="flat" /> 전체
												</label>
											</div>
											<div class="checkbox col-md-3 col-sm-6 col-xs-12">
												<label style="margin: 4px;"> 
												<input name="position" type="checkbox" value="1" class="flat" /> Long(buy)
												</label>
											</div>
											<div class="checkbox col-md-3 col-sm-6 col-xs-12">
												<label style="margin: 4px;">
												<input name="position" type="checkbox" value="2" class="flat" /> Short(Sell)
												</label>
											</div>
										</div>
									</td>
								</tr>
								<tr id="dfOrder-table" class="even pointer">
									<th scope="row" class="bg-gray-100 text-center">Status</th>
									<td>
										<div class="input-group row mb-0 text-left">
											<div class="checkbox col-md-3 col-sm-6 col-xs-12">
												<label style="margin: 4px;">
												<input name="status" type="checkbox" value="all" class="flat" /> 전체
												</label>
											</div>
											<div class="checkbox col-md-3 col-sm-6 col-xs-12">
												<label style="margin: 4px;">
												<input name="status" type="checkbox" value="1" class="flat" /> Ongoing
												</label>
											</div>
											<div class="checkbox col-md-3 col-sm-6 col-xs-12">
												<label style="margin: 4px;">
												<input name="status" type="checkbox" value="2" class="flat" /> Paused
												</label>
											</div>
										</div>
									</td>
								</tr>
								<tr id="nothing"></tr>
								<tr id="stOrder-table" class="even pointer">
									<th scope="row" class="bg-gray-100 text-center">Status</th>
									<td>
										<div class="input-group row mb-0 text-left">
											<div class="checkbox col-md-2 col-sm-4 col-xs-12">
												<label style="margin: 4px;">
												<input name="cndlSize" type="checkbox" value=all"" class="flat"> 전체
												</label>
											</div>
											<div class="checkbox col-md-2 col-sm-4 col-xs-12">
												<label style="margin: 4px;">
												<input name="cndlSize" type="checkbox" value="1" class="flat"> 15m
												</label>
											</div>
											<div class="checkbox col-md-2 col-sm-4 col-xs-12">
												<label style="margin: 4px;">
												<input type="checkbox" value="" class="flat"> 30m
												</label name="cndlSize" style="margin: 4px;">
											</div>
											<div class="checkbox col-md-2 col-sm-4 col-xs-12">
												<label style="margin: 4px;">
												<input name="cndlSize" type="checkbox" value="2" class="flat"> 60m
												</label>
											</div>
											<div class="checkbox col-md-2 col-sm-4 col-xs-12">
												<label style="margin: 4px;">
												<input name="cndlSize" type="checkbox" value="3" class="flat"> 4h
												</label>
											</div>
											<div class="checkbox col-md-2 col-sm-4 col-xs-12">
												<label style="margin: 4px;">
												<input name="cndlSize" type="checkbox" value="4" class="flat"> 1d
												</label>
											</div>
										</div>
									</td>
								</tr>
								<tr class="even pointer">
									<th scope="row" class="text-center">검색 기간</th>
								<td>
									<div class="col-md-6 p-0">
										<div class="datepicker_wrap">
											<input id="startDt" name="startDt"
											class="datepicker form-control" type="date"
											value="" required="required"
											onfocus="this.type='date'"> 
											
											<input id="endDt" name="endDt"
											class="datepicker form-control" type="date"
											value="" required="required" default="today"
											onfocus="this.type='date'">
										</div>
									</div>
									<div class="col-md-6 text-left datepicker_btn p-0 pl-1">
										<div class="btn-group btn-group-sm p-0" role="group"
											aria-label="...">
											<button class="btn btn-light" onclick="today()" type="button">오늘</button>
											<button class="btn btn-light" onclick="yesterday()"
												type="button">어제</button>
											<button class="btn btn-light" onclick="lastWeek()"
												type="button">7일</button>
											<button class="btn btn-light" onclick="lastMonth()"
												type="button">1개월</button>
											<button class="btn btn-light" onclick="lastThreeMonth()"
												type="button">3개월</button>
											<button class="btn btn-light" onclick="lastSixMonth()"
												type="button">6개월</button>
											<button class="btn btn-light" onclick="lastYear()"
												type="button">1년</button>
										</div>
									</div>
								</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>

		<!-- tab & table -->
		<!-- tab name -->
		<ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="dfOrder-tab"
				data-toggle="tab" href="#dfOrder" role="tab" aria-controls="dfOrder"
				aria-selected="true">일반 주문</a></li>
			<li class="nav-item"><a class="nav-link" id="stOrder-tab"
				data-toggle="tab" href="#stOrder" role="tab" aria-controls="stOrder"
				aria-selected="false">전략 주문</a></li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<!-- default order table -->
			<div class="tab-pane fade show active" id="dfOrder" role="tabpanel"
				aria-labelledby="dfOrder-tab">
				<div class="col-sm-12 col-md-5"
					style="padding: 15px 10px 0px 10px; font-weight: 700;">
					총 <span style="color: red;">10</span>건
				</div>
				<div class="col-sm-12 col-md-7 input-group justify-content-end">
					<button type="button" class="btn btn-light border">Excel
						다운로드</button>
					<div class="dropdown no-arrow">
						<select type="select"
							class="custom-select w-auto input-radius-button" 
							id="rowCount" name="rowCount">
							<option value="" selected>20개씩 보기</option>
							<option value="">30개씩 보기</option>
							<option value="">50개씩 보기</option>
							<option value="">100개씩 보기</option>
							<option value="">200개씩 보기</option>
						</select>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table jambo_table bulk_action">
						<thead>
							<tr class="headings">
								<th rowspan="2" class="column-title text-center">No</th>
								<th rowspan="2" class="column-title text-center">일시</th>
								<th rowspan="2" class="column-title text-center">ID</th>
								<th rowspan="2" class="column-title text-center">Exchange</th>
								<th rowspan="2" class="column-title text-center">Order ID</th>
								<th rowspan="2" class="column-title text-center">Symbol</th>
								<th rowspan="2" class="column-title text-center">Type</th>
								<th rowspan="2" class="column-title text-center">Position</th>
								<th rowspan="2" class="column-title text-center">Leverage</th>
								<th rowspan="2" class="column-title text-center">단계</th>
								<th colspan="2" class="column-title text-center">open</th>
								<th colspan="4" class="column-title text-center">Take Profit1</th>
								<th colspan="4" class="column-title text-center">Take Profit2</th>
								<th colspan="2" class="column-title text-center">Stop Loss</th>
							</tr>
							<tr class="headings">
								<th class="column-title text-center">Price</th>
								<th class="column-title text-center">Qty</th>
								<th class="column-title text-center">Price</th>
								<th class="column-title text-center">Qty</th>
								<th class="column-title text-center">Trailing</th>
								<th class="column-title text-center">Trailing qty</th>
								<th class="column-title text-center">price</th>
								<th class="column-title text-center">Qty</th>
								<th class="column-title text-center">Trailing</th>
								<th class="column-title text-center">Trailing qty</th>
								<th class="column-title text-center">Price</th>
								<th class="column-title text-center">Qty</th>
							</tr>
						</thead>
						<tbody>
							<tr class="even pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>15:15:15 </td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Reservation</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">체결</td>
								<td class="text-center">7,900.5</td>
								<td class="text-center">1,000</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right text-center">-</td>
								<td class=" last text-center"><a href="#">-</a></td>
							</tr>
							<tr class="odd pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>15:15:15
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Reservation</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">체결</td>
								<td class="text-center">7,900.5</td>
								<td class="text-center">1,000</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right text-center">-</td>
								<td class=" last text-center"><a href="#">-</a></td>
							</tr>
							<tr class="even pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>15:15:15
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Reservation</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">체결</td>
								<td class="text-center">7,900.5</td>
								<td class="text-center">1,000</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right text-center">-</td>
								<td class="last text-center"><a href="#">-</a></td>
							</tr>
							<tr class="odd pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>15:15:15
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Reservation</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">체결</td>
								<td class="text-center">7,900.5</td>
								<td class="text-center">1,000</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right text-center">-</td>
								<td class=" last text-center"><a href="#">-</a></td>
							</tr>
							<tr class="even pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>15:15:15
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Reservation</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">체결</td>
								<td class="text-center">7,900.5</td>
								<td class="text-center">1,000</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right text-center">-</td>
								<td class=" last text-center"><a href="#">-</a></td>
							</tr>
							<tr class="odd pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>15:15:15
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Reservation</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">체결</td>
								<td class="text-center">7,900.5</td>
								<td class="text-center">1,000</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right text-center">-</td>
								<td class=" last text-center"><a href="#">-</a></td>
							</tr>
							<tr class="even pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>15:15:15
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Reservation</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">체결</td>
								<td class="text-center">7,900.5</td>
								<td class="text-center">1,000</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right text-center">-</td>
								<td class=" last text-center"><a href="#">-</a></td>
							</tr>
							<tr class="odd pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>15:15:15
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Reservation</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">체결</td>
								<td class="text-center">7,900.5</td>
								<td class="text-center">1,000</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right text-center">-</td>
								<td class=" last text-center"><a href="#">-</a></td>
							</tr>

							<tr class="even pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>15:15:15
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Reservation</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">체결</td>
								<td class="text-center">7,900.5</td>
								<td class="text-center">1,000</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right text-center">-</td>
								<td class=" last text-center"><a href="#">-</a></td>
							</tr>
							<tr class="odd pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>15:15:15
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Reservation</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">체결</td>
								<td class="text-center">7,900.5</td>
								<td class="text-center">1,000</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right text-center">-</td>
								<td class=" last text-center"><a href="#">-</a></td>
							</tr>
						</tbody>
					</table>
				</div>
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
			<!-- strategy order table -->
			<div class="tab-pane fade" id="stOrder" role="tabpanel"
				aria-labelledby="stOrder-tab">
				<div class="col-sm-12 col-md-5"
					style="padding: 15px 10px 0px 10px; font-weight: 700;">
					총 <span style="color: red;">10</span>건
				</div>
				<div class="col-sm-12 col-md-7 input-group justify-content-end">
					<button type="button" class="btn btn-light border">Excel
						다운로드</button>
					<div class="dropdown no-arrow">
						<select type="select"
							class="custom-select w-auto input-radius-button" name="" id="">
							<option value="" selected>20개씩 보기</option>
							<option value="">30개씩 보기</option>
							<option value="">50개씩 보기</option>
							<option value="">100개씩 보기</option>
							<option value="">200개씩 보기</option>
						</select>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table jambo_table">
						<colgroup>
							<col width="3%" />
							<col width="9%" />
							<col width="9%" />
							<col width="9%" />
							<col width="9%" />
							<col width="10%" />
							<col width="4%" />
							<col width="4%" />
							<col width="3%" />
							<col width="3%" />
							<col width="3%" />
							<col width="3%" />
							<col width="3%" />
							<col width="3%" />
							<col width="3%" />
							<col width="3%" />
							<col width="3%" />
							<col width="3%" />
							<col width="3%" />
							<col width="10%" />
						</colgroup>
						<thead>
							<tr class="headings">
								<th rowspan="2" class="text-center">No</th>
								<th rowspan="2" class="text-center">주문 실행일</th>
								<th rowspan="2" class="text-center">ID</th>
								<th rowspan="2" class="text-center">Exchange</th>
								<th rowspan="2" class="text-center">주문 번호</th>
								<th rowspan="2" class="text-center">전략명</th>
								<th rowspan="2" class="text-center">Symbol</th>
								<th rowspan="2" class="text-center">Position</th>
								<th rowspan="2" class="text-center">Leverage</th>
								<th rowspan="2" class="text-center">Candle Size</th>
								<th rowspan="2" class="text-center">단계</th>
								<th colspan="2" class="text-center">Open</th>
								<th colspan="2" class="text-center">Close (Trigger)</th>
								<th colspan="2" class="text-center">Close (Trailing)</th>
								<th colspan="2" class="text-center">Stop Loss</th>
								<th rowspan="2" class="text-center">비고</th>
							</tr>
							<tr>
								<th class="text-center">Price</th>
								<th class="text-center">Qty</th>
								<th class="text-center">Price</th>
								<th class="text-center">Qty</th>
								<th class="text-center">Price</th>
								<th class="text-center">Qty</th>
								<th class="text-center">Price</th>
								<th class="text-center">Qty</th>
							</tr>
						</thead>

						<tbody>
							<tr class="even pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>22:22:41
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">상승 후 조정</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">60m</td>
								<td class="text-center">실행</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right " style="text-align: center;">-</td>
								<td class=" last" style="text-align: center;"><a href="#">cancel</a></td>
							</tr>
							<tr class="odd pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>22:22:41
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">상승 후 조정</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">60m</td>
								<td class="text-center">실행</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right " style="text-align: center;">-</td>
								<td class=" last" style="text-align: center;"><a href="#">cancel</a></td>
							</tr>
							<tr class="even pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>22:22:41
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">상승 후 조정</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">60m</td>
								<td class="text-center">실행</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right " style="text-align: center;">-</td>
								<td class=" last" style="text-align: center;"><a href="#">cancel</a></td>
							</tr>
							<tr class="odd pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>22:22:41
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">상승 후 조정</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">60m</td>
								<td class="text-center">실행</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right " style="text-align: center;">-</td>
								<td class=" last" style="text-align: center;"><a href="#">cancel</a></td>
							</tr>
							<tr class="even pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>22:22:41
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">상승 후 조정</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">60m</td>
								<td class="text-center">실행</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right " style="text-align: center;">-</td>
								<td class=" last" style="text-align: center;"><a href="#">cancel</a></td>
							</tr>
							<tr class="odd pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>22:22:41
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">상승 후 조정</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">60m</td>
								<td class="text-center">실행</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right " style="text-align: center;">-</td>
								<td class=" last" style="text-align: center;"><a href="#">cancel</a></td>
							</tr>
							<tr class="even pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>22:22:41
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">상승 후 조정</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">60m</td>
								<td class="text-center">실행</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right " style="text-align: center;">-</td>
								<td class=" last" style="text-align: center;"><a href="#">cancel</a></td>
							</tr>
							<tr class="odd pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>22:22:41
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">상승 후 조정</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">60m</td>
								<td class="text-center">실행</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right " style="text-align: center;">-</td>
								<td class=" last" style="text-align: center;"><a href="#">cancel</a></td>
							</tr>

							<tr class="even pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>22:22:41
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">상승 후 조정</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">60m</td>
								<td class="text-center">실행</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right " style="text-align: center;">-</td>
								<td class=" last" style="text-align: center;"><a href="#">cancel</a></td>
							</tr>
							<tr class="odd pointer">
								<td class="text-center">100</td>
								<td class="text-center">2020-01-01<br>22:22:41
								</td>
								<td class="text-center">traum@traum.com</td>
								<td class="text-center">BitMEX</td>
								<td class="text-center">65131321213211</td>
								<td class="text-center">상승 후 조정</td>
								<td class="text-center">XBTUSD</td>
								<td class="text-center">Long(buy)</td>
								<td class="text-center">10 X</td>
								<td class="text-center">60m</td>
								<td class="text-center">실행</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="text-center">-</td>
								<td class="a-right a-right " style="text-align: center;">-</td>
								<td class=" last" style="text-align: center;"><a href="#">cancel</a></td>
							</tr>
						</tbody>
					</table>
				</div>
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
		</div>
	</div>
</div>
</div>