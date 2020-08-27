<!--
	* @FileName   : eventManagement.ftl
	* @Description: 이벤트 관리  View
	* @Author     : 알 수 없음
	* @Version    : 2020.08.14
	* @Copyright  : ⓒADUP. All Right Reserved
-->

<#assign pagingTag = JspTaglibs["/WEB-INF/tld/paging.tld"] />
<#setting number_format = "###"/>

<script type="text/javascript">

	//변경 버튼 클릭 시 event+이용권 modal창 띄움
	$(document).ready(function(){
		$('#modalChEv').on('show.bs.modal', function(event) {
			eventModifyFrm.eventSeq.value = $(event.relatedTarget).data('id');
			document.getElementById('event').value = $(event.relatedTarget).data('eventname');
			document.getElementById('periods').value = $(event.relatedTarget).data('periods');
			document.getElementById('periodf').value = $(event.relatedTarget).data('periodf');
			document.getElementById('discount').value = $(event.relatedTarget).data('discount');
	    });
	
	//체크박스 전체 체크    
	    $("#checkAll").click(function(){
			if($("#checkAll").prop("checked")){
				$("input[name=chk]").prop("checked",true);
			}else{
				$("input[name=chk]").prop("checked",false);
			}
		});
	    
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
		
		$("#eventseq").val(seqs.join(","));
		
		ajaxFormExecute("eventInsertFrm", "/event/ajaxDelete", "post", false, false, ajaxReturnDelete);
	}
	
	function ajaxReturnDelete(data){
		if(data.sw){
    		jsAlert.alert("알림", "삭제되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "삭제에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	function fn_list(){
		$("#eventInsertFrm").prop("action", "/event/eventManagement");
		$('#nowPage').val('1');
		formSubmit("eventInsertFrm");
	}
	
	function ajaxReturnevsave(data){
		if(data.sw){
    		jsAlert.alert("알림", "이벤트 저장 되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "이벤트 저장에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	function fn_changeEvent(){
		jsAlert.confirm("확인", "이벤트 변경 하시겠습니까?", fn_changeEvYn, null, "확인", "취소")	
	}
	
	function fn_changeEvYn(){
		eventModifyFrm.EventName.value=$("#event").val();
		eventModifyFrm.EventPeriodS.value=$("#periods").val();
		eventModifyFrm.EventPeriodF.value=$("#periodf").val();
		eventModifyFrm.DiscountRate.value=$("#discount").val();
		ajaxFormExecute("eventModifyFrm", "/event/ajaxeventUpdate", "post", false, false, ajaxReturnupdate);
	}
	function ajaxReturnupdate(data){
		if(data.sw){
    		jsAlert.alert("알림", "이벤트 변경 되었습니다.", null, fn_list, "확인");
    	}else{
    		jsAlert.alert("알림", "이벤트 변경에 실패하였습니다.<br>관리자에게 문의바랍니다.");
    	}
	}
	
	function fn_search() {
		$("#eventInsertFrm").prop("action", "/event/eventManagement");
		$('#nowPage').val('1');
		formSubmit("eventInsertFrm");
	}
</script>


 <!-- 이벤트 변경 창 -->
 
<form class="form-inline" name ="eventModifyFrm" id="eventModifyFrm" method="POST" style="width: 100%;">
<input type="hidden" id="eventSeq" name="eventSeq" value="" />
<input type="hidden" id="EventName" name="EventName" value="" />
<input type="hidden" id="EventPeriodS" name="EventPeriodS" value="" />
<input type="hidden" id="EventPeriodF" name="EventPeriodF" value="" />
<input type="hidden" id="DiscountRate" name="DiscountRate" value="" />
<div class="modal fade" id="modalChEv">
  <div class="modal-dialog" data-backdrop="static">
    <div class="modal-content">
      <div class="modal-body">
       	<h4 class="modal-title">이벤트를 변경하시겠습니까?</h4>
        <table>
	      <tbody>
	        <tr>
	          <td>*	이벤트 명</td><td>&nbsp;:&nbsp;&nbsp;&nbsp;<input type="text" id="event" value=""></td>
	        </tr>
	        <tr>
	          <td>* 적용 기간</td><td>&nbsp;:&nbsp;&nbsp;&nbsp;<input type="date" id="periods" value=""/> ~ <input type="date" id="periodf" value=""/></td>
	        </tr>
	        <tr>
	          <td>*	할인률</td><td>&nbsp;:&nbsp;&nbsp;&nbsp;<input type="text" id="discount" value="">%</td>
	        </tr>
	      </tbody>
	    </table>
      </div>
      <!--</form> Footer -->
      <div class="modal-footer">
        <center>
        	<button type="button" class="btn btn-primary" onclick="fn_changeEvent()">저장</button>
        	<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </center>
      </div>
    </div>
  </div>
</div>
</form>
 
 <!-- 이벤트 등록 페이지-->
<div class="right_col" role="main">
	<div class="col-md-12 col-sm-12">
    	<div class="page-title">
  			<div class="title_left">
				<h3>이벤트 관리</h3>
			</div>
		</div>

			<div class="x_panel" style="padding-top: 30px;">
				
					<div class="input-group justify-content-between">	
					
						<form class="" name="eventInsertFrm" id="eventInsertFrm" method="POST" style="width: 100%;">
						<input type="hidden" id="eventseq" name="eventseq" value="" />
						
							<div class="table-responsive">
								<table class="table jambo_table bulk_action">
									<colgroup>
										<col width="200">
										<col width="*">
									</colgroup>
									
								<tbody>
									<tr>
										<th scope="row" class="bg-gray-100 text-center">이벤트 이름</th>
										<td colspan="2"><input type="text" id="searchEventname" name="searchEventname" value="" class="form-control"  /></td>
									</tr>
									<tr>
										<th scope="row" class="text-center">이벤트 기간</th>
										<td colspan="2">
											<div class="datepicker_wrap">
												<input type="date" id="stdate" name="stdate" class="datepicker form-control"  value=""/>
												<input type="date" id="eddate" name="eddate" class="datepicker form-control"  value="" />
											</div>
										</td>
									</tr> 
									<tr>
										<th scope="row" class="bg-gray-100 text-center">거래소</th>
										<td>
											<select type="select" name="searchExchange" id="searchExchange" value="" class="form-control">
												<#if resultExchangeList?has_content>
									          	<#list resultExchangeList as exMap>
									          		<option value="${exMap.exchangename}">${exMap.exchangename}</option>
									          	</#list>
									          	<#else>	
									          		<option value="NONE">거래소가 존재하지 않습니다</option>
									          	</#if>
											</select>
										</td>
										<td>
											<button type="button" style="float:right;" class="btn btn-success" onclick="fn_search()">검색</button>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</form>
				</div>
	
		<div class="ln_solid"></div>
	
		
		<div class="table-responsive">	
			<div id="row1" style="float:left;">	
			<form class="form-inline" name="eventFrm" id="eventFrm" method="post" >
				<td class="">총 ${pageInfo.rowMax}건</td>
				&emsp;
				<button type="button" class="btn btn-light btn-sm border" onclick="fn_delete();">삭제</button>
			</form>
			</div>
		</div>
	
		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_content">
						<div class="table-responsive">
							<table class="table table-striped jambo_table bulk_action">
								<thead>
									<tr class="headings">
										<th class="column-title"><input type="checkbox" id="checkAll" name="checkAll" /></th>
										<th class="column-title">NO</th>
										<th class="column-title">거래소</th>
										<th class="column-title">이벤트명</th>
										<th class="column-title">이벤트 기간</th>
										<th class="column-title">할인률</th>
										<th class="column-title">상태</th>
										<th class="column-title">변경</th>
									</tr>
								</thead>
								<tbody>
									<#if eventList?has_content>
									<#assign eNum = pageInfo.rowMax - pageInfo.startRowNum +1/>
									<#list eventList as eMap>
										<tr style="cursor:pointer;">
											<td class=" "><input type="checkbox" name="chk" value="${eMap.eventseq!}" /></td>
											<td class="even pointer">${eNum}</td>
											<td class="even pointer">${eMap.exchange!}</td>
											<td class="even pointer">${eMap.eventname!}</td>
											<td class="even pointer">${eMap.eventperiods!?string("yyyy-MM-dd")}&nbsp;&nbsp; ~ &nbsp;&nbsp;${eMap.eventperiodf!?string("yyyy-MM-dd")}</td>
											<td class="even pointer">${eMap.discountrate!} %</td>
											<#if eMap.eventstatus == 0>
												<td class="even pointer">종료</td>
											<#else>
												<td class="even pointer">예약</td>
											</#if>
											
											<td> <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalChEv" data-id='${eMap.eventseq}' data-eventname='${eMap.eventname}' data-periods='${eMap.eventperiods?string("yyyy-MM-dd")}' data-periodf='${eMap.eventperiodf?string("yyyy-MM-dd")}' data-discount='${eMap.discountrate}' >변경</button> </td>
										</tr>
									<#assign eNum = eNum - 1/>	
									</#list>
									<#else>
										<tr>
											<td colspan="8"><strong>게시물이 존재하지 않습니다.</strong></td>
										</tr>
									</#if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<nav aria-label="Page navigation example" class="content-center text-center">
			<@pagingTag.Paging url="/event/eventManagement" pageCount="${pageInfo.pageCount!}" rowCount="${pageInfo.rowCount!}" rowMax="${pageInfo.rowMax!}" nowPage="${pageInfo.nowPage!}" params="searchEventname=${searchEventname} & stdate=${stdate} & eddate=${eddate} & searchExchange={searchExchange}" />
		</nav>
	</div>
	</div>
</div>
