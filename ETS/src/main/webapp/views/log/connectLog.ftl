<#assign pagingTag = JspTaglibs["/WEB-INF/tld/paging.tld"] /> <#setting
number_format = "###"/>

<script type="text/javascript">
	$(document).ready(function() {
		$('#searchType').val("${searchType}");
		$('#rowCount').val(${rowCount});
		//console.log("${searchType}");
		//alert("${searchType}");
	});

	function rowCntChange() {
		$("#logFrm").prop("action", "/log/connectLog");
		$('#nowPage').val('1');
		formSubmit("logFrm");
	}

	function fn_search() {
		$("#logFrm").prop("action", "/log/connectLog");
		$('#nowPage').val('1');
		formSubmit("logFrm");
	}
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
			<h3>접속 로그</h3>
		</div>
	</div>
	<div class="x_panel" style="padding-top: 30px;">
		<form name="logFrm" id="logFrm" method="POST" style="width: 100%;">
			<!-- searching option -->
			<div class="input-group justify-content-between">
				<div class="table-responsive">
					<table class="table jambo_table bulk_action">
						<colgroup>
							<col width="200" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="text-center">검색 기간</th>
								<td>
									<div class="col-md-6 p-0">
										<div class="datepicker_wrap">
											<input id="startDt" name="startDt"
												class="datepicker form-control" type="date"
												value="${startDt}" required="required"
												onfocus="this.type='date'"> <input id="endDt"
												name="endDt" class="datepicker form-control" type="date"
												value="${endDt}" required="required" default="today"
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
							<tr>
								<th scope="row" class="bg-gray-100 text-center">검색</th>
								<td>
									<div class="input_wrap col-md-9 p-0">
										<select type="select" name="searchType" id="searchType" class="form-control">
											<option value="all">전체</option>
											<option value="FndByID">ID</option>
											<option value="FndByTelD">Telegram ID</option>
										</select> <input type="text" name="searchText" id="searchText"
											value="${searchText!}" class="form-control" />
									</div>
									<div class="col-md-1"></div>
									<button type="button" onclick="fn_search()"
										class="btn btn-success btn-sm btn-frm m-0 col-md-2">검색</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- seeing option -->
			<div class="input-group justify-content-between">

				<div style="padding: 10px; font-weight: 700;">
					총 <span style="color: red;">${pageInfo.rowMax}</span>건
				</div>

				<div style="display: inline;">
					<button type="button" class="btn btn-light border"
						style="margin: 0px">Excel 다운로드</button>

					<div class="dropdown no-arrow" style="display: inline;">
						<select type="select" id="rowCount" name="rowCount"
							class="custom-select w-auto input-radius-button"
							onchange="rowCntChange()">
							<option value="20">20개씩 보기</option>
							<option value="30">30개씩 보기</option>
							<option value="50">50개씩 보기</option>
							<option value="100">100개씩 보기</option>
							<option value="200">200개씩 보기</option>
						</select>
					</div>
				</div>
			</div>
		</form>
		<!-- main table -->
		<div id="mainTable" class="table-responsive">
			<table class="table jambo_table bulk_action">
				<colgroup>
					<col width="10%" />
					<col width="15%" />
					<col width="15%" />
					<col width="10%" />
					<col width="10%" />
					<col width="15%" />
					<col width="10%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr class="headings">
						<th class="column-title" style="text-align: center;">No</th>
						<th class="column-title" style="text-align: center;">가입일</th>
						<th class="column-title" style="text-align: center;">ID</th>
						<th class="column-title" style="text-align: center;">국가</th>
						<th class="column-title" style="text-align: center;">TimeZone</th>
						<th class="column-title" style="text-align: center;">Telegram
							ID</th>
						<th class="column-title" style="text-align: center;">이용권</th>
						<th class="column-title" style="text-align: center;">이용권 만료일</th>
					</tr>
				</thead>

				<tbody>
					<#if resultList?has_content>
					<!-- <#assign rNum = pageInfo.rowMax - pageInfo.startRowNum + 1 /> -->
					<#assign rNum = pageInfo.rowCount /> <#list resultList as rMap>
					<tr>
						<td>${rMap.logIdx}</td>
						<td>${rMap.logDt!}</td>
						<td>${rMap.logId!}</td>
						<td>${rMap.logCountry!}</td>
						<td>${rMap.logTimezone!}</td>
						<td>${rMap.logTelgrm!}</td>
						<td>${rMap.logUse!}</td>
						<td>${rMap.logExp!}</td>
					</tr>
					<#assign rNum = rNum - 1/> </#list> <#else>
					<tr>
						<td colspan="8"><strong>로그가 존재하지 않습니다.</strong></td>
					</tr>
					</#if>
				</tbody>
			</table>
		</div>
		<!-- paging -->
		<div><@pagingTag.Paging url="/log/connectLog"
			pageCount="${pageInfo.pageCount!}" rowCount="${pageInfo.rowCount!}"
			rowMax="${pageInfo.rowMax!}" nowPage="${pageInfo.nowPage!}"
			params="searchText=${searchText!}&searchType=${searchType!}&startDt=${startDt!} &endDt=${endDt!}"/></div>
	</div>
</div>
