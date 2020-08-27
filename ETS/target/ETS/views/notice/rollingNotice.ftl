<!--
	* @FileName   : connectLog.ftl
	* @Description: 롤링 공지  View
	* @Author     : 알 수 없음
	* @Version    : 2020.08.14
	* @Copyright  : ⓒADUP. All Right Reserved
-->

<#assign pagingTag = JspTaglibs["/WEB-INF/tld/paging.tld"] />
<#setting number_format = "###"/>

<link rel="stylesheet" href="/css/jquery-ui-timepicker-addon.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />

<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="/js/jquery-ui-timepicker-addon.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")){
				$("input[name=chk]").prop("checked",true);
			}else{
				$("input[name=chk]").prop("checked",false);
			}
		});
		
		 $('#from').datetimepicker({
			 dateformat:"YYYY-MM-DD", 
			 monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		     dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
		     changeMonth:true,
		     changeYear:true,
		     showMonthAfterYear:true,
			 timeFormat:'HH:mm:ss', 
			 controlType:'select', oneLine:true});
		 
		 $('#to').datetimepicker({
			 dateformat:"YYYY-MM-DD", 
			 monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		     dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
		     changeMonth:true,
		     changeYear:true,
		     showMonthAfterYear:true,
			 timeFormat:'HH:mm:ss', 
			 controlType:'select', oneLine:true});
		 
		 $('#stdate').datetimepicker({
			 dateformat:"YYYY-MM-DD", 
			 monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		     dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
		     changeMonth:true,
		     changeYear:true,
		     showMonthAfterYear:true,
			 timeFormat:'HH:mm:ss', 
			 controlType:'select', oneLine:true});
		 
		 $('#eddate').datetimepicker({
			 dateformat:"YYYY-MM-DD", 
			 monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		     dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
		     changeMonth:true,
		     changeYear:true,
		     showMonthAfterYear:true,
			 timeFormat:'HH:mm:ss', 
			 controlType:'select', oneLine:true});
	});
	
	function fn_delete(){
		if($('input:checkbox[name=chk]').is(':checked') == false){
			jsAlert.alert("알림", "삭제할 게시물을 선택해주세요");
			return false;
		}
		jsAlert.confirm("확인", "해당 게시물을 삭제 하시겠습니까?", fn_deleteYn, null, "확인", "취소");
    }
	
	function fn_deleteYn(){
		var seqs = [];
		$("input[name=chk]:checked").each(function() {
			seqs[seqs.length] = $(this).val();
		});
		
		$("#noticeSeq").val(seqs.join(","));
		
		ajaxFormExecute("noticeFrm", "/notice/ajaxRollingDelete", "post", false, false, ajaxReturnDelete);
	}
	
	function ajaxReturnDelete(data){
		if(data.sw){
    		jsAlert.alert("알림", "삭제되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "삭제에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	function fn_list(){
		$("#noticeFrm").prop("action", "/notice/rollingNotice");
		$('#nowPage').val('1');
 		formSubmit("noticeFrm");
	}
	
	function fn_search(){
		$("#noticeFrm").prop("action", "/notice/rollingNotice");
		$('#nowPage').val('1');
 		formSubmit("noticeFrm");
	}
	
	function fn_listnum(){
		$("#noticeFrm").prop("action", "/notice/rollingNotice");
		$('#nowPage').val('1');
 		formSubmit("noticeFrm");
	}
	
	function replaceAll(str, searchStr, replaceStr) {
		return str.split(searchStr).join(replaceStr);
	}
	
	function fn_save(){	
		oEditors.getById["icontents"].exec("UPDATE_CONTENTS_FAIELD", []);
		var text = $('#icontents').val();
		var texttrim = replaceAll(text, '&nbsp;', '');
		texttrim = replaceAll(texttrim, ' ', '');
		texttrim = replaceAll(texttrim, '<p></p>', '');
		if(texttrim==""){
			jsAlert.alert("알림", "내용을 입력하세요.", $("#icontents"));
			return ;
		}
		
		jsAlert.confirm("확인", "등록하시겠습니까?", fn_submit, null, "확인", "취소");
	}
	
	function fn_submit(){
		ajaxFileFormExecute("noticeFrm", "/notice/ajaxRollingSubmit", "post", false, false, ajaxReturnSubmit);
    }
	
	function ajaxReturnSubmit(data){
		if(data.sw){
    		jsAlert.alert("알림", "등록되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "등록에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
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
	
	function setToday(){
		$("#stdate").val(getToday());
		$("#eddate").val(getToday());
	}
	
	function setYesterday(){
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
		$("#stdate").val(resultDate);
		$("#eddate").val(getToday());
	}
	
	function setWeekAgo(){
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
		$("#stdate").val(resultDate);
		$("#eddate").val(getToday());
	}
	
	function setMonthAgo(){
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
		$("#stdate").val(resultDate);
		$("#eddate").val(getToday());
	}
	
	function set3MonthAgo(){
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
		$("#stdate").val(resultDate);
		$("#eddate").val(getToday());
	}
	
	function set6MonthAgo(){
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
		$("#stdate").val(resultDate);
		$("#eddate").val(getToday());
	}
	
	function setYearAgo(){
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
		$("#stdate").val(resultDate);
		$("#eddate").val(getToday());
	}
</script>

<div class="right_col" role="main">
	<div class="col-md-12 col-sm-12 ">
		<div class="page-title">
			<div class="title_left">
				<h3>롤링 공지</h3>
			</div>
		</div>
		<div class="x_panel" style="padding-top: 30px;">
			<div class="input-group justify-content-between">
				<form name="" id="" method="POST"
					style="width: 100%; margin-bottom: 50px;">
					<div class="table-responsive">
						<table class="table jambo_table">
							<colgroup>
								<col width="200" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">노출 일자</th>
									<td>
										<div class="datepicker_wrap">
											<input id="" name="date" class="datepicker form-control"
												type="date" required="required" onfocus="this.type='date'">
											<input id="" name="date" class="datepicker form-control"
												type="date" required="required" onfocus="this.type='date'">
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">내용</th>
									<td><input type="text" name="" id="" value=""
										class="form-control passwd" /></td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="text-center">
											<button type="button" class="btn btn-success">등록</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<form name="" id="" method="POST" style="width: 100%;">
					<div class="table-responsive">
						<table class="table jambo_table bulk_action">
							<colgroup>
								<col width="200" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="bg-gray-100 text-center">검색어</th>
									<td colspan="3"><input type="text" name="" id="" value=""
										class="form-control col-md-9" placeholder="" />
										<div class="col-md-1"></div>
										<button type="button"
											class="btn btn-success btn-sm col-md-2 m-0 btn-frm">검색</button>
									</td>
								</tr>
								<tr>
									<th scope="row" class="text-center">검색 기간</th>
									<td colspan="3">
										<div class="col-md-6 p-0">
											<div class="datepicker_wrap">
												<input id="" name="date" class="datepicker form-control"
													type="date" required="required" onfocus="this.type='date'">
												<input id="" name="date" class="datepicker form-control"
													type="date" required="required" onfocus="this.type='date'">
											</div>
										</div>
										<div class="col-md-6 text-left datepicker_btn p-0 pl-1">
											<div class="btn-group btn-group-sm p-0" role="group"
												aria-label="...">
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

			<div class="input-group justify-content-between">
				<div class="">
					<div style="margin: 3px; font-weight: 700; display: inline;">
						총 <span style="color: red;">5</span>건
					</div>
					<!-- <div style="display: inline;"><span style="color: red; font-weight: 700;">1,275,000</span>원</div> -->
					<button type="button" class="btn btn-light btn-sm border"
						data-toggle="modal" data-target="#deleteNotice">삭제</button>
				</div>

				<div class="" style="display: inline;">
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
			</div>
			<div class="table-responsive">
				<table class="table jambo_table bulk_action">
					<colgroup>
						<col width="5%" />
						<col width="5%" />
						<col width="13%" />
						<col width="13%" />
						<col width="44%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<thead>
						<tr class="headings">
							<th><input type="checkbox" id="check-all" class="flat">
							</th>
							<th class="column-title" style="text-align: center;">No</th>
							<th class="column-title" style="text-align: center;">시작</th>
							<th class="column-title" style="text-align: center;">종료</th>
							<th class="column-title" style="text-align: center;">내용</th>
							<th class="column-title" style="text-align: center;">등록자</th>
							<th class="column-title" style="text-align: center;">노출여부</th>
							<th class="bulk-actions" colspan="7"><a class="antoo"
								style="color: #fff; font-weight: 500;">총<span
									class="action-cnt"> </span>건
							</a></th>
						</tr>
					</thead>

					<tbody>
						<tr class="even pointer">
							<td class="a-center "><input type="checkbox" class="flat"
								name="table_records"></td>
							<td class=" " style="text-align: center;">96</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">10:00부터 정기점검이 진행될
								예정입니다.</td>
							<td class=" " style="text-align: center;">admin1</td>
							<td class=" " style="text-align: center;">예정</td>
						</tr>
						<tr class="odd pointer">
							<td class="a-center "><input type="checkbox" class="flat"
								name="table_records"></td>
							<td class=" " style="text-align: center;">96</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">10:00부터 정기점검이 진행될
								예정입니다.</td>
							<td class=" " style="text-align: center;">admin1</td>
							<td class=" " style="text-align: center;">예정</td>
						</tr>
						<tr class="even pointer">
							<td class="a-center "><input type="checkbox" class="flat"
								name="table_records"></td>
							<td class=" " style="text-align: center;">96</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">10:00부터 정기점검이 진행될
								예정입니다.</td>
							<td class=" " style="text-align: center;">admin1</td>
							<td class=" " style="text-align: center;">예정</td>
						</tr>
						<tr class="odd pointer">
							<td class="a-center "><input type="checkbox" class="flat"
								name="table_records"></td>
							<td class=" " style="text-align: center;">96</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">10:00부터 정기점검이 진행될
								예정입니다.</td>
							<td class=" " style="text-align: center;">admin1</td>
							<td class=" " style="text-align: center;">예정</td>
						</tr>
						<tr class="even pointer">
							<td class="a-center "><input type="checkbox" class="flat"
								name="table_records"></td>
							<td class=" " style="text-align: center;">96</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">10:00부터 정기점검이 진행될
								예정입니다.</td>
							<td class=" " style="text-align: center;">admin1</td>
							<td class=" " style="text-align: center;">예정</td>
						</tr>
						<tr class="odd pointer">
							<td class="a-center "><input type="checkbox" class="flat"
								name="table_records"></td>
							<td class=" " style="text-align: center;">96</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">10:00부터 정기점검이 진행될
								예정입니다.</td>
							<td class=" " style="text-align: center;">admin1</td>
							<td class=" " style="text-align: center;">예정</td>
						</tr>
						<tr class="even pointer">
							<td class="a-center "><input type="checkbox" class="flat"
								name="table_records"></td>
							<td class=" " style="text-align: center;">96</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">10:00부터 정기점검이 진행될
								예정입니다.</td>
							<td class=" " style="text-align: center;">admin1</td>
							<td class=" " style="text-align: center;">예정</td>
						</tr>
						<tr class="odd pointer">
							<td class="a-center "><input type="checkbox" class="flat"
								name="table_records"></td>
							<td class=" " style="text-align: center;">96</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">10:00부터 정기점검이 진행될
								예정입니다.</td>
							<td class=" " style="text-align: center;">admin1</td>
							<td class=" " style="text-align: center;">예정</td>
						</tr>

						<tr class="even pointer">
							<td class="a-center "><input type="checkbox" class="flat"
								name="table_records"></td>
							<td class=" " style="text-align: center;">96</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">10:00부터 정기점검이 진행될
								예정입니다.</td>
							<td class=" " style="text-align: center;">admin1</td>
							<td class=" " style="text-align: center;">예정</td>
						</tr>
						<tr class="odd pointer">
							<td class="a-center "><input type="checkbox" class="flat"
								name="table_records"></td>
							<td class=" " style="text-align: center;">96</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">2020-01-01
								15:18:23</td>
							<td class=" " style="text-align: center;">10:00부터 정기점검이 진행될
								예정입니다.</td>
							<td class=" " style="text-align: center;">admin1</td>
							<td class=" " style="text-align: center;">예정</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
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

	<!-- 32 공지사항 삭제 모달 -->
	<div class="modal" id="deleteNotice">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<div class="container text-center">
						<div class="text-left mb-4">
							<h1 class="page-sub-title m-0">Confirm</h1>
						</div>
						<span>공지사항을 삭제하시겠습니까?</span>
						<div class="row justify-content-around mt-5">
							<button type="button" class="btn btn-secondary btn-sm col-md-3"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-success btn-sm col-md-8">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 32 공지사항 삭제 모달 END-->
</div>