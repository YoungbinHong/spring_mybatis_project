<!--
	* @FileName   : notice.ftl
	* @Description: 접속 로그  View
	* @Author     : 알 수 없음
	* @Version    : 2020.08.14
	* @Copyright  : ⓒADUP. All Right Reserved
-->

<#assign pagingTag = JspTaglibs["/WEB-INF/tld/paging.tld"] />
<#setting number_format = "###"/>

<script type="text/javascript">
	$(document).ready(function(){
		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")){
				$("input[name=chk]").prop("checked",true);
			}else{
				$("input[name=chk]").prop("checked",false);
			}
		});
		
		 $('#from').datepicker({
			 dateformat:"YYYY-MM-DD", 
			 monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		     dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
		     changeMonth:true,
		     changeYear:true,
		     showMonthAfterYear:true,
			 timeFormat:'HH:mm:ss', 
			 controlType:'select', oneLine:true});
		 
		 $('#to').datepicker({
			 dateformat:"YYYY-MM-DD", 
			 monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		     dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
		     changeMonth:true,
		     changeYear:true,
		     showMonthAfterYear:true,
			 timeFormat:'HH:mm:ss', 
			 controlType:'select', oneLine:true});
		 
		 $('#stdate').datepicker({
			 dateformat:"YYYY-MM-DD", 
			 monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		     dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
		     changeMonth:true,
		     changeYear:true,
		     showMonthAfterYear:true,
			 timeFormat:'HH:mm:ss', 
			 controlType:'select', oneLine:true});
		 
		 $('#eddate').datepicker({
			 dateformat:"YYYY-MM-DD", 
			 monthNamesShort:[ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
		     dayNamesMin:[ '일', '월', '화', '수', '목', '금', '토' ],
		     changeMonth:true,
		     changeYear:true,
		     showMonthAfterYear:true,
			 timeFormat:'HH:mm:ss', 
			 controlType:'select', oneLine:true});
	});
	
	function fn_save(){
		
		if(writeFrm.noticeTitle.value==''){
			jsAlert.alert("알림", "제목을 입력하세요.", $("#noticeTitle"));
			return false;
		}
		
		oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
		var text = $('#noticeContent').val();
		var texttrim = replace(text, '&nbsp;', '');
		texttrim = replace(texttrim, '<p>', '');
		texttrim = replace(texttrim, '</p>', '');
		if(texttrim==""){
			jsAlert.alert("알림", "내용을 입력하세요.", $("#noticeContent"));
			return ;
		}
		
// 		if($('#imgNm').val() == ""){
// 			jsAlert.alert("알림", "첨부할 파일을 등록하여 주세요.", $("#uploadImg"));
// 			return false;
// 		}
		
		jsAlert.confirm("확인", "등록 하시겠습니까?", fn_submit, null, "확인", "취소");
	}
	
	function fn_submit(){
		ajaxFileFormExecute("writeFrm", "/notice/ajaxNoticeSubmit", "post", false, false, ajaxReturnSubmit);
    }
	
	function ajaxReturnSubmit(data){
		if(data.sw){
    		jsAlert.alert("알림", "등록 되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "등록에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	function fn_list(){
		location.href="/notice/notice";		
	}
	
	
	function fn_preview(){
		$("#myLargeModal2").modal();
		oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
		var text = $('#noticeContent').val();
		var texttrim = replace(text, '&nbsp;', '');
		texttrim = replace(texttrim, '<p>', '');
		texttrim = replace(texttrim, '</p>', '');

		$('#myModalLabel2').text(writeFrm.noticeTitle.value);
		$('#myModalContext2').html(texttrim);
    }
	
	function fn_putData(){
		jsAlert.confirm("등록", "해당 게시물을 등록 하시겠습니까?", fn_putDataYn, null, "등록", "취소");
    }
	
	function fn_putDataYn(){
		ajaxReturnPutData();
	}
	
	function ajaxReturnPutData(){
    	jsAlert.alert("알림", "등록에 실패하였습니다.<br>관리자에게 문의바랍니다.");	
	}
		
	
	function fn_search(){
		var text = document.getElementById("searchText").value;
		
		if(text == ""){
			jsAlert.alert("검색", "검색어를 입력해주세요");
		}
		$("#noticeFrm1").prop("action", "/notice/notice");
	}
	
	function fn_del(){
		jsAlert.confirm("확인", "해당 게시물을 삭제 하시겠습니까?", fn_deleteYn2(), null, "확인", "취소");
	}
	
	function getCookie(cookie_name) {
	  var x, y;
	  var val = document.cookie.split(';');
	
	  for (var i = 0; i < val.length; i++) {
	    x = val[i].substr(0, val[i].indexOf('='));
	    y = val[i].substr(val[i].indexOf('=') + 1);
	    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
	    if (x == cookie_name) {
	      return unescape(y); // unescape로 디코딩 후 값 리턴
	    }
	  }
	}
	
	function fn_deleteYn2(){
		var request = $.ajax({
				url:"/notice/ajaxNoticeDelete",
				method:"POST",
				data: {noticeSeq : getCookie('modalNoticeSeq')},
				dataType:"text"
			});
		request.done(function(data){
			jsAlert.alert("알림", "삭제되었습니다.");
			location.replace('/notice/notice');
		});
		
		request.fail(function(jqXHR,textStatus){
			jsAlert.alert("알림", "데이터 가져오기에 실패하였습니다.<br>관리자에게 문의바랍니다.");
		});	
	}

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
		
		ajaxFormExecute("noticeFrm", "/notice/ajaxNoticeDelete", "post", false, false, ajaxReturnDelete);
	}
	
	function ajaxReturnDelete(data){
		if(data.sw){
    		jsAlert.alert("알림", "삭제되었습니다.", null, fn_list, "확인");
    		location.replace('/notice/notice');
  
    	}else{
    		jsAlert.alert("알림", "삭제에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	function fn_list(){
		$("#noticeFrm").prop("action", "/notice/notice");
		$('#nowPage').val('1');
 		formSubmit("noticeFrm");
	}
	
	function fn_listnum(){

		$("#noticeFrm").prop("action", "/notice/notice");
		$('#nowPage').val('1');
 		formSubmit("noticeFrm2");
 		
	}
	
	function fn_view(noticeSeq){
		$("#noticeFrm").prop("action", "/notice/noticeView");
		$('#noticeSeq').val(noticeSeq);
 		formSubmit("noticeFrm");
	}
	
	function setCookie(cookie_name, value, days) {
	  var exdate = new Date();
	  exdate.setDate(exdate.getDate() + days);
	  // 설정 일수만큼 현재시간에 만료값으로 지정
	
	  var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
	  document.cookie = cookie_name + '=' + cookie_value;
	}
	
	function fn_view2(noticeSeq){
			setCookie('modalNoticeSeq',noticeSeq,'1');
			
			var request = $.ajax({
				url:"/notice/noticeModal",
				method:"POST",
				data:{noticeSeq},
				dataType:"text"
			});
			request.done(function(data){
    			$('#modal-content1').load("/notice/noticeModalView");
    		});
    		
    		request.fail(function(jqXHR,textStatus){
    			jsAlert.alert("알림", "데이터 가져오기에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    		});	
	}

	function fn_modi(){
    	$("#noticeFrm").prop("action", "/notice/noticeWrite");
		formSubmit("noticeFrm");
	}
	
	function formSubmit(formId){
		appendAjaxLoading();
		$('#' + formId).submit();
	}
	
	
	function fn_write(){
		location.href="/notice/noticeWrite";	
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
	
	function setToday2(){
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
 
<form class="form-inline" name="noticeFrm" id="noticeFrm" method="post" >
	<input type="hidden" id="noticeSeq" name="noticeSeq" value="" />
</form>



<div class="right_col" role="main">
	<div class="">
    	<div class="page-title">
  			<div class="title_left">
				<h3>공지 사항</h3>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12 col-sm-20 col-xs-20">
				<div class="x_content">
					<form class="form-inline" id="noticeFrm1" name="noticeFrm1" method="post" >
                        <input type="hidden" id="EventSeq" name="EventSeq" value="" />
                        <input type="hidden" id="EventPeriodS" name="EventPeriodS" value="" />
                        <input type="hidden" id="EventPeriodF" name="EventPeriodF" value="" />
                        <div class="table-responsive">
                            <table class="table table-striped jambo_table bulk_action">
                                <tbody>
                                    <tr>
                                        <td style="background-color:#E2E2E2">검색어</td>
                                        <td>
                                            <div class="form-inline form-group">
                                                <div class="col-sm-9">
                                         
	                                                    <input type="text" id="searchText" name="searchText" value="${searchText}" class="form-control" style="width:100%"/>
	                                           
                                             	</div>
	                                                <div class="col-sm-3">
	                                                    <button class="btn btn-success btn-sm btn-frm m-0 wd100" onclick="fn_search()">검색</button>
	                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E2E2E2">검색 기간</td>
                                        <td>
				                            <div class="form-group">
												<div class="col-sm-4">
														<div class="form-group">
															<input type="text" class="datetimepicker form-control" id="stdate" name="stdate" value="${stdate}" style="" placeholder="0000-00-00 00:00:00"/>
															<!--span class="input-group-addon">
															<span class="glyphicon glyphicon-calendar"></span>
															</span-->
														&emsp;~&emsp;
															<input type="text" class="datetimepicker form-control" id="eddate" name="eddate" value="${eddate}" style="" />
															<!--span class="input-group-addon">
															<span class="glyphicon glyphicon-calendar"></span>
															</span-->
														</div>
													
												</div>
												<div class="col-sm-8">
													<span class="pull-left">
														<button type="button" onclick="setToday2()" class="form-control">오늘</button>
														<button type="button" onclick="setYesterday()" class="form-control">어제</button>
														<button type="button" onclick="setWeekAgo()" class="form-control">7일</button>
														<button type="button" onclick="setMonthAgo()" class="form-control">1개월</button>
														<button type="button" onclick="set3MonthAgo()" class="form-control">3개월</button>
														<button type="button" onclick="set6MonthAgo()" class="form-control">6개월</button>
														<button type="button" onclick="setYearAgo()" class="form-control">1년</button>
													</span>
												<div>
											</div>
										</td>
                                    </tr> 
                                </tbody>
                            </table>
                        </div>
					</form>
				</div>
		    </div>
		</div>
		<div class="clearfix"></div>
		<div class="row">
			
				<div class="table-responsive">
					<div id="row1" style="float:left;">	
						<form class="form-inline" name="noticeFrm" id="noticeFrm" method="post" >
							<td class="">총 ${pageInfo.rowMax}건</td>
							&emsp;
							<button type="button" class="form-control" onclick="fn_delete();">삭제</button>	
						</form>
					</div>
					<div id="row2" style="float:right;">		
						<form class="form-inline" name="noticeFrm2" id="noticeFrm2" method="post">
							<select type="select" class="form-control" name="listNum" id="listNum" onchange="fn_listnum()">
								<option value-"basic" selected="selected">=== 선택 ===</option>
								<option value-"ten">10개씩 보기</option>
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
			    <div class="col-md-12 col-sm-20 col-xs-20">
					<div class="table-responsive">
                        <table class="table table-striped jambo_table bulk_action">
                            <thead>
                                <tr class="headings">
                                    <th class="column-title"><input type="checkbox" id="checkAll" name="checkAll" /></th>
                                    <th class="column-title">No</th>
                                    <th class="column-title">작성일</th>
                                    <th class="column-title">제목</th>
                                    <th class="column-title">내용</th>
                                    <th class="column-title">등록자</th>
                                    <th class="column-title">조회수</th>
                                    <th class="column-title">예약</th>
                                </tr>
                            </thead>
                            <tbody>
                                <#if resultList?has_content>
                                <#assign rNum = pageInfo.rowMax - pageInfo.startRowNum + 1 />
                                <#list resultList as rMap>
                                <tr style="cursor:pointer;">
                                    <td class=" "><input type="checkbox" name="chk" value="${rMap.noticeSeq!}" /></td>
                                    <td class="even pointer" onclick="fn_view2('${rMap.noticeSeq}')"  id="btView" data-toggle="modal" data-target="#myLargeModal">${rNum}</td>
                                    <td class="even pointer" onclick="fn_view2('${rMap.noticeSeq}')"  id="btView" data-toggle="modal" data-target="#myLargeModal">${rMap.regDate!}</td>
                                    <td class="even pointer" onclick="fn_view2('${rMap.noticeSeq}')"  id="btView" data-toggle="modal" data-target="#myLargeModal">${rMap.noticeTitle!}</td>
                                    <td class="even pointer" onclick="fn_view2('${rMap.noticeSeq}')"  id="btView" data-toggle="modal" data-target="#myLargeModal">${rMap.noticeContent!}</td>
                                    <td class="even pointer" onclick="fn_view2('${rMap.noticeSeq}')"  id="btView" data-toggle="modal" data-target="#myLargeModal">${rMap.id!}</td>
                                    <td class="even pointer" onclick="fn_view2('${rMap.noticeSeq}')"  id="btView" data-toggle="modal" data-target="#myLargeModal">${rMap.viewcnt!}</td>
                                    <td class="even pointer" onclick="fn_view2('${rMap.noticeSeq}')"  id="btView" data-toggle="modal" data-target="#myLargeModal">${rMap.reserv!}</td>
                                </tr>
                                <#assign rNum = rNum - 1/>
                                </#list>
                                 <!-- 큰 Modal -->
								<div class="modal fade" id="myLargeModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
								  <div class="modal-dialog modal-lg" role="document" style="height:90%;">
								    <div class="modal-content" id="modal-content1" name="modal-content1">
								    
								    </div>
								  </div>
								</div>	
                                <#else>
                                    <tr>
                                        <td colspan="8"><strong>게시물이 존재하지 않습니다.</strong></td>
                                    </tr>
                                </#if>
                            </tbody>
						</table>
					</div>
				</div>
				<div class="col-md-12 col-sm-20 col-xs-20">	
					<nav aria-label="Page navigation example" class="content-center text-center">
						<@pagingTag.Paging url="/notice/notice" pageCount="${pageInfo.pageCount!}" rowCount="${pageInfo.rowCount!}" rowMax="${pageInfo.rowMax!}" nowPage="${pageInfo.nowPage!}" params="1" />
					</nav>
				</div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_content">
						<form name="writeFrm" id="writeFrm" name="writeFrm" method="post" >
						<input type="hidden" name="noticeSeq" id="noticeSeq" value="" />
						<input type="hidden" name="crud" id="crud" value="" />
						
						<div class="table-responsive">
							<table class="table table-striped jambo_table bulk_action table_vertical">
								<tbody>
									<tr>
										<th class="column-title vertical-middle">제목</th>
										<td><input type="text" id="noticeTitle" name="noticeTitle" value="" class="form-control inline-block" maxlength="100" /></td>
									</tr>
									<tr>
										<th class="column-title vertical-middle">내용</th>
										<td>
											<textarea name="noticeContent" id="noticeContent" value="" class="form-control inline-block"  rows="10" cols="100" style="width:100%; height:300px; "></textarea>
										</td>
									</tr>
									
								</tbody>
							</table>
						</div>
						</form>
						<div class="text-center">
							<a href="#" class="btn btn-light" id="btPreview"  onclick="fn_preview()" data-toggle="modal" data-target="#myLargeModal2">미리보기</a>
							<!-- 큰 Modal2 -->
							<div class="modal fade" id="myLargeModal2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
							  <div class="modal-dialog modal-lg" role="document" style="height:90%;">
							    <div class="modal-content">
							    	<p align="left">
									    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
									</p>
									<div class="modal-header">
									    <h4 class="modal-title" id="myModalLabel">공지사항</h4>
									</div>
									<div class="modal-body">
									    <div class="row">
											<div class="col-md-8 col-sm-8 col-xs-8">
												<h2 class="modal-title" id="myModalLabel2" style="text-align:left">제목</h4>
											</div>
											<div class="col-md-4 col-sm-4 col-xs-4 text-right">
												작성시간&emsp;&emsp;조회 수
											</div>
									    </div>
									    <hr />
									    <p>
									    <div id="myModalContext2" style="text-align:left">
									        내용
									    </div>
									    </p>
									    <p class="col text-center">
									        <button type="button" class="btn btn-success" onclick="fn_save()" id="btPutData">등록</button>
									    </p>
									</div>
							    </div>
							  </div>
							</div>	
							<a href="#" class="btn btn-success" onclick="fn_save()" id="btPutData">등록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
</div>

<!-- 스마트 에디터2 -->
<script type="text/javascript" src="/src/js/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
	var oEditors = [];

	var sLang = "ko_KR"; // 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR
	// 추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "noticeContent",
		sSkinURI: "/src/js/smarteditor2/SmartEditor2Skin.html", 
		htParams : {
			bUseToolbar : true,    // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,  // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,   // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
				//alert("완료!");
				},
				I18N_LOCALE : sLang
			}, //boolean
			fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});

	function pasteHTML(filepath) { //업로드한 사진을 화면에 보여주게 만드는 스크립트

		 var sHTML = '<span style="color:#FF0000;"><img src="'+filepath+'"></span>';
		 oEditors.getById["noticeContent"].exec("PASTE_HTML", [sHTML]);
	}

	function showHTML() {
		var sHTML = oEditors.getById["noticeContent"].getIR();
		alert(sHTML);
	}
					
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["noticeContent"].setDefaultFont(sDefaultFont, nFontSize);
	}

	function writeReset() {
		document.f.reset();
		oEditors.getById["noticeContent"].exec("SET_IR", [""]);
	}
	
</script>