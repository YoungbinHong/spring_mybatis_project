<!--
	* @FileName   : eventRegistration.ftl
	* @Description: 이벤트 등록  View
	* @Author     : 알 수 없음
	* @Version    : 2020.08.14
	* @Copyright  : ⓒADUP. All Right Reserved
-->

<#assign pagingTag = JspTaglibs["/WEB-INF/tld/paging.tld"] />
<#setting number_format = "###"/>


<script type="text/javascript">
	
	//등록 버튼 클릭 시 event+이용권 modal창 띄움
	$(document).ready(function(){
		$('#modalChEv').on('show.bs.modal', function(event) {
			eventInsertFrm.EventSeq.value = $(event.relatedTarget).data('id');
			document.getElementById('event').value = $(event.relatedTarget).data('eventname');
			document.getElementById('discount').value = $(event.relatedTarget).data('discount');
	    });
	});
	
	function fn_list(){
		$("#eventInsertFrm").prop("action", "/event/eventRegistration");
		$('#nowPage').val('1');
		formSubmit("eventInsertFrm");
	}
	

	function fn_evsave(){
		if (!eventInsertFrm.EventName.value || !eventInsertFrm.EventPeriods.value || !eventInsertFrm.EventPeriodf.value || !eventInsertFrm.DiscountRate.value){
			jsAlert.alert("알림", "빈칸을 모두 채워주세요");
		} else{
			jsAlert.confirm("확인", "이벤트 저장 하시겠습니까?", fn_evsaveYn, null, "확인", "취소")	
		}
	}
	
	function fn_evsaveYn(){
		eventInsertFrm.EventPeriodS.value=$("#EventPeriodst").val();
		eventInsertFrm.EventPeriodF.value=$("#EventPeriodfi").val();
		ajaxFormExecute("eventInsertFrm", "/event/ajaxeventSave", "post", false, false, ajaxReturnevsave);
	}
	
	function ajaxReturnevsave(data){
		if(data.sw){
    		jsAlert.alert("알림", "이벤트 저장 되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "이벤트 저장에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	function fn_applydc(){
	<#if TicketList?has_content>
		<#list TicketList as eMap>
		dc = $("#Discount").val()*0.01;
		$('#eventDiscountPrice_'+${eMap.useTicketSeq!}).html(parseInt(${eMap.useTicketPrice!}*(dc))+'원');
		$('#eventPrice_'+${eMap.useTicketSeq!}).html(parseInt(${eMap.useTicketPrice!}*(1-dc))+'원');
		</#list>
	</#if>
	}
	
</script>
		

<div class="right_col" role="main">

	<div class="col-md-12 col-sm-12 ">
	
		<div class="page-title">
			<div class="title_left">
				<h3>이벤트 등록</h3>
			</div>
		</div>
		
		<div class="x_panel" style="padding-top: 30px;">
		
			<div class="input-group justify-content-between">

				<form class="" name ="eventInsertFrm" id="eventInsertFrm" method="POST" style="width: 100%;">
				<input type="hidden" id=EventSeq" name="EventSeq" value="" />
				<input type="hidden" id="EventPeriodS" name="EventPeriodS" value="" />
				<input type="hidden" id="EventPeriodF" name="EventPeriodF" value="" />
				<input type="hidden" id="DiscountRate" name="DiscountRate" value="0" />
				
					<div class="table-responsive">
						<table class="table jambo_table bulk_action">
							<colgroup>
								<col width="200">
								<col width="*">
							</colgroup>
							
							<tbody>
							
								<tr>
									<th scope="row" class="bg-gray-100 text-center">이벤트 명</th>
									<td colspan="2"><input type="text" name="EventName" id="EventName" value=""
										class="form-control" /></td>
								</tr>
								<tr>
									<th scope="row" class="text-center">이벤트 기간</th>
									<td colspan="2">
										<div class="datepicker_wrap">
											<input id="EventPeriodst" name="EventPeriodst" class="datepicker form-control"
												type="date" required="required" onfocus="this.type='date'">
											<input id="EventPeriodfi" name="EventPeriodfi" class="datepicker form-control"
												type="date" required="required" onfocus="this.type='date'">
										</div>
									</td>
								</tr>
								
								<tr>
									<th scope="row" class="bg-gray-100 text-center">거래소</th>
									<td>
										<select type="select" name="EXsearchType" id="EXsearchType" class="form-control">
												<#if resultExchangeList?has_content>
									          	<#list resultExchangeList as exMap>
									          		<option value="${exMap.exchangename}">${exMap.exchangename}</option>
									          	</#list>
									          	<#else>
									          		<option value="NONE">거래소가 존재하지 않습니다</option>
									          	</#if>
										</select>
									</td>
								</tr>
								
								<tr>
									<th scope="row" class="bg-gray-100 text-center">할인율</th>
									<td colspan="2"><input type="text" name="Discount" id="Discount" value="" class="form-control col-md-3">
										<div class="col-md-1 txt-unit text-left">%</div>
										<div class="col-md-8">
											<button type="button" class="btn btn-success btn-sm col-md-5 x-1 btn-frm" onclick='fn_applydc()'>미리 적용해보기</button>
											<button type="button" class="btn btn-success btn-sm col-md-5 btn-frm" onclick='fn_evsave()'>저장</button>
										</div>
									</td>
								</tr>
								
							</tbody>
							
						</table>
						
					</div>
					
				</form>
				
			</div>

			<div class="ln_solid"></div>

			<div class="input-group justify-content-between">
				<h1 class="page-sub-title">이용권 명 </h1>
				<button type="button" class="btn btn-light btn-sm border">EXCEL
					다운로드</button>
			</div>
			<div class="table-responsive">
				<table class="table jambo_table bulk_action">
					<colgroup>
						<col width="13%" />
						<col width="17%" />
						<col width="16%" />
						<col width="16%" />
						<col width="19%" />
						<col width="19%" />
					</colgroup>
					<thead>
						<tr class="headings">
							<th class="column-title" style="text-align: center;">거래소</th>
							<th class="column-title" style="text-align: center;">이용권 명</th>
							<th class="column-title" style="text-align: center;">이용기간</th>
							<th class="column-title" style="text-align: center;">기본 가격</th>
							<th class="column-title" style="text-align: center;">할인 가격</th>
							<th class="column-title" style="text-align: center;">이벤트 적용 금액</th>
						</tr>
					</thead>
					<tbody>
						<#if TicketList?has_content>
							<#list TicketList as eMap>
								<tr style="cursor:pointer;">
									<td class="even pointer">${eMap.exchangeName!}</td>
									<td class="even pointer">${eMap.useTicketName!}</td>
									<td class="even pointer">${eMap.applicationPeriod!}&nbsp;&nbsp;일</td>
									<td class="even pointer">${eMap.useTicketPrice!}&nbsp;&nbsp;원</td>
									<td class="even pointer" id="eventDiscountPrice_${eMap.useTicketSeq!}">&nbsp;&nbsp;원</td>
									<td class="even pointer" id="eventPrice_${eMap.useTicketSeq!}">&nbsp;&nbsp;원</td>
								</tr>
							</#list>
						<#else>
								<tr>
									<td colspan="4"><strong>이용권이 존재하지 않습니다.</strong></td>
								</tr>
						</#if>				
					</tbody>
					</table>
			</div>
		</div>
	</div>
</div>